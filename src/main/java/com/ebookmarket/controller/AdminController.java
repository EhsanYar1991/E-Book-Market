package com.ebookmarket.controller;

import com.ebookmarket.model.Book;
import com.ebookmarket.repository.BookDao;
import com.itextpdf.text.pdf.PdfImportedPage;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.List;

/**
 * Created by at on 4/23/2017.
 */
@Controller
public class AdminController {

    private BookDao bookDao;
    private Path filePath;
    private Path imagePath;

    @Autowired
    public AdminController(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @RequestMapping("/admin")
    public String getAdminPage(){
        return "admin/adminPage";
    }

    @RequestMapping("/booksInventory")
    public String getBookInventoryPage(Model model){
        List books = bookDao.findAll();
        if (books!= null){
            model.addAttribute("books",books);
            model.addAttribute("newBook",new Book());
            model.addAttribute("updatedBook",new Book());
        }
        return "admin/booksInventory";
    }

    @RequestMapping(value = "/addNewBook" ,method = RequestMethod.POST)
    public String addNewBook(@ModelAttribute("newBook") Book book, HttpServletRequest request){
        if (book!=null) {

            bookDao.save(book);
            saveBookFile(book, request);
        }
        return "redirect:/booksInventory";
    }

    @RequestMapping(value = "/updateBook" ,method = RequestMethod.POST)
    public String updateBook(@ModelAttribute("updatedBook") Book book,HttpServletRequest request){
        if (book!=null) {
            bookDao.save(book);
            saveBookFile(book, request);
        }
        return "redirect:/booksInventory";
    }

    @RequestMapping(value = "/removeBook/{id}")
    public String removeBook(@PathVariable("id") String bookId , Model model){
        bookDao.delete(Long.valueOf(bookId.trim()));
        return "redirect:/booksInventory";
    }

    private void saveBookFile(Book book, HttpServletRequest request) {
        if (book.getFile()!= null) {
            MultipartFile file = book.getFile();
            String rootDirectory = request.getSession().getServletContext().getRealPath("/");
            filePath = Paths.get(rootDirectory + "\\WEB-INF\\resources\\book_files\\" + book.getTitle() + "_" + book.getId() + ".pdf");
            imagePath = Paths.get(rootDirectory + "\\WEB-INF\\resources\\book_images\\" + book.getTitle() + "_" + book.getId() + ".png");
            if (file != null) {
                try {
                    file.transferTo(new File(filePath.toString()));
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new RuntimeException("Book file saving failed!", e);
                }
            }
            // take book image
            PdfReader pdfReader;
            try {
                pdfReader = new PdfReader(filePath.toString());
                byte[] pageContent = pdfReader.getPageContent(1);
                FileWriter fileWriter = new FileWriter(imagePath.toString());
                BufferedWriter bw = new BufferedWriter(fileWriter);
                bw.write(Arrays.toString(pageContent));


            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }




}
