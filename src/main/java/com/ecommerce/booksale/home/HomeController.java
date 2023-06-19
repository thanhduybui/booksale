package com.ecommerce.booksale.home;

import com.ecommerce.booksale.book.Book;
import com.ecommerce.booksale.book.BookService;
import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final BookService bookService;
    private final CategoryService categoryService;
    @GetMapping("/")
    public String renderHomePage(Model theModel){

        // get all books from service
        List<Book> books = bookService.findTopBooks();
        // get all list Category from service
        List<Category> categories = categoryService.getAllCategories();

        // add to model;
        theModel.addAttribute("books", books);
        theModel.addAttribute("categories", categories);

        return "index";
    }
}
