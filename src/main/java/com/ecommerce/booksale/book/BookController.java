package com.ecommerce.booksale.book;


import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryMapper;
import com.ecommerce.booksale.book.category.CategoryService;
import com.ecommerce.booksale.book.subcategory.SubCategory;
import com.ecommerce.booksale.book.subcategory.SubCategoryService;
import com.ecommerce.booksale.cart.ShoppingCart;
import com.ecommerce.booksale.exception.BookNotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@AllArgsConstructor
@SessionAttributes("cart")
public class BookController {

    private final BookService bookService;
    private final CategoryService categoryService;
    private final SubCategoryService subCategoryService;
    private final HttpServletRequest request;
    private static final String BOOK_NOT_FOUND = "Book not found for id = ";

    @GetMapping("/book/category/{category}")
    public String getBookCategory(@PathVariable("category") String kebabCategoryName, Model model){
            // get URI
            String requestURI = request.getRequestURI();
            // retrieve data from database
            int categoryId = CategoryMapper.mapToCategoryId(kebabCategoryName);
            // get list book
            List<BookDTO>  books = bookService.getBookByCategoryIdWithPaging(categoryId, 0, 12);
            // get subcategory by category
            Category cat = categoryService.getCategoryById(categoryId);
            List<SubCategory> subCategories = subCategoryService.getSubcategoriesByCategory(cat);
            // add data to model
            model.addAttribute("path", kebabCategoryName);
            model.addAttribute("requestURI", requestURI);
            model.addAttribute("category", cat);
            model.addAttribute("books", books);
            model.addAttribute("subcategories", subCategories);
            // return view
            return "book";
    }

    @GetMapping("/book/{id}")
    public String accessBuyPage( @PathVariable("id") Integer bookId,  Model model){


            BookDTO foundBook = this.bookService.findBook(bookId);
            List<BookDTO> relevantBooks = this.bookService.getRelevantBooks(bookId);

            if (foundBook == null) {
                throw new BookNotFoundException(BOOK_NOT_FOUND + bookId );
            }


            model.addAttribute("book", foundBook );
            model.addAttribute("relevantBooks", relevantBooks);
            return "book-sell-page";
    }



}
