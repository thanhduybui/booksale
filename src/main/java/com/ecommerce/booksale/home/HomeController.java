package com.ecommerce.booksale.home;

import com.ecommerce.booksale.book.Book;
import com.ecommerce.booksale.book.BookDTO;
import com.ecommerce.booksale.book.BookService;
import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@AllArgsConstructor
public class HomeController {

    private final BookService bookService;

    @GetMapping("/")
    public String renderHomePage(Model theModel) {

        Pageable pageable = PageRequest.of(0, 7);

        // get all books from service
        List<Book> books = bookService.findTopBooks();

        List<BookDTO> fictionBooks = bookService.getBookBySubCategoryId(1, pageable);

        // add attributes to model
        theModel.addAttribute("books", books);
        theModel.addAttribute("fictionBooks", fictionBooks);


        return "index";
    }
}
