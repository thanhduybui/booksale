package com.ecommerce.booksale.book.subcategory;

import com.ecommerce.booksale.book.category.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SubCategoryRepository extends JpaRepository<SubCategory, Integer> {

    List<SubCategory> findByCategory(Category category);
}
