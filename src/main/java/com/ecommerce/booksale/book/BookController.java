package com.ecommerce.booksale.book;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class BookController {

    @GetMapping("/book/category/{categoryId}")
    public String getBookCategory(@PathVariable("categoryId") int categoryId){
        return "book";
    }
}
