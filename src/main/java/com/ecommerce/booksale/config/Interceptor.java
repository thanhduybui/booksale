package com.ecommerce.booksale.config;


import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryRepository;
import com.ecommerce.booksale.book.category.CategoryService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.List;

@Component
@AllArgsConstructor
public class Interceptor implements HandlerInterceptor {

    private CategoryService categoryService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        List<Category> categories = categoryService.getAllCategories();
        request.setAttribute("categories", categories);
        return true;
    }
}
