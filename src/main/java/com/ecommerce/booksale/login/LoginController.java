package com.ecommerce.booksale.login;


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
public class LoginController {

    private final CategoryService categoryService;
    @GetMapping("/login")
    public String handleLoginRequest(HttpSession session){

        // get all list Category from service
        List<Category> categories = categoryService.getAllCategories();
        // add categories to session
        session.setAttribute("categories", categories);

        return "login";
    }
}
