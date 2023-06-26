package com.ecommerce.booksale.book;

import com.ecommerce.booksale.book.category.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BookRepository extends JpaRepository<Book, Long>, PagingAndSortingRepository<Book, Long> {
    // find All Books
    List<Book> findAll();

    Page<Book> findAll(Pageable pageable);


    @Query("SELECT b FROM Book b JOIN b.categories c WHERE c.categoryId = :categoryId")
    List<Book> findByCategoryId(@Param("categoryId") int categoryId);

    @Query("SELECT b FROM Book b JOIN b.Subcategories c WHERE c.subCategoryId = :subCategoryId")
    List<Book> findBySubCategoryId(@Param("subCategoryId") int subCategoryId);

    @Query("SELECT b FROM Book b JOIN b.Subcategories c WHERE c.subCategoryId = :subCategoryId")
    List<Book> findBySubcategoryId(@Param("subCategoryId") int subCategoryId, Pageable pageable);
}
