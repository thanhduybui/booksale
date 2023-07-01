package com.ecommerce.booksale.book.subcategory;


import com.ecommerce.booksale.book.category.Category;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class SubCategoryService {

    private final SubCategoryRepository subCategoryRepository;

    public List<SubCategory> getSubcategoriesByCategory(Category category){
        return subCategoryRepository.findByCategory(category);
    }
}
