package com.ebookmarket.controller;

import com.ebookmarket.model.Book;
import com.ebookmarket.repository.BookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by at on 4/22/2017.
 */

@Controller
public class HomeController {


    private BookDao bookDao;

    @Autowired
    public HomeController(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/bookList")
    public String getBooks(Model model) {
        List<Book> bookList = bookDao.findAll();
        if (bookList != null && !bookList.isEmpty()) {
            model.addAttribute("books", bookList);
        }
        return "bookList";
    }

    @RequestMapping("/bookList/bookDetail/{id}")
    public String viewBookDetail(@PathVariable("id") String id, Model model) {
        Book book = null;
        if (id !=null) {
            book = bookDao.find(Long.valueOf(id));
        }
        model.addAttribute("book", book);
        return "bookDetail";
    }
}
