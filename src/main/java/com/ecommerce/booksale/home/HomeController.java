package com.ecommerce.booksale.home;

import com.ecommerce.booksale.book.Book;
import com.ecommerce.booksale.book.BookService;
import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final BookService bookService;

    @GetMapping("/")
    public String renderHomePage(Model theModel, HttpSession session) {

        // get all books from service
        List<Book> books = bookService.findTopBooks();


        // add to model;
        theModel.addAttribute("books", books);


        return "index";
    }
}
