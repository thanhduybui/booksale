package com.ecommerce.booksale.book;


import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@AllArgsConstructor
public class BookController {

    private final BookService bookService;
    private final CategoryService categoryService;

    @GetMapping("/book/category/{categoryId}")
    public String getBookCategory(@PathVariable("categoryId") int categoryId, Model model){
        List<BookDTO>  books = bookService.getBookByCategoryIdWithPaging(categoryId, 0, 12);
        Category cat = categoryService.getCategoryById(categoryId);

        // add data to model
        model.addAttribute("categoryName", cat.getName());
        model.addAttribute("books", books);
        return "book";
    }


}
