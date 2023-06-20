package com.ecommerce.booksale.book;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {

    @GetMapping("/category")
    public String getBookCategory(){
        return "book";
    }
}
