package com.ecommerce.booksale.book;


import lombok.AllArgsConstructor;
import org.springframework.data.repository.query.Param;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/book")
public class BookRestController {
    private BookService bookService;

    @GetMapping("/{id}")
    List<Book> getBooksByCategory(@PathVariable int id){
        return bookService.getBookBySubCategoryId(id);
    }

}
