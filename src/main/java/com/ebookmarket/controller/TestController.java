package com.ebookmarket.controller;

import com.ebookmarket.model.Book;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by at on 4/25/2017.
 */
@Controller
public class TestController {

    @RequestMapping("/test")
    public String testPage(Model model){
        model.addAttribute("newBook",new Book());
        model.addAttribute("updatedBook",new Book());
        return "test";
    }

   /* @RequestMapping(value = "/addNewBook" *//*,method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_UTF8_VALUE*//*)
    public String addNewBook(@RequestBody Book book){
        if (book!=null) {
            return book.toString();
        }
        return "redirect:/admin/booksInventory";
    }*/
}
