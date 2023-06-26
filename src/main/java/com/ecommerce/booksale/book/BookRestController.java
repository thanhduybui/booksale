package com.ecommerce.booksale.book;


import lombok.AllArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin(origins = "http://127.0.0.1:5500")
@RestController
@AllArgsConstructor
@RequestMapping("/api/book")
public class BookRestController {
    private BookService bookService;

    @GetMapping("/subcategory/{id}")
    List<BookDTO> getBooksBySubCategory(@PathVariable int id){

        Pageable pageable = PageRequest.of(0, 7);
        return bookService.getBookBySubCategoryId(id, pageable);
    }

}
