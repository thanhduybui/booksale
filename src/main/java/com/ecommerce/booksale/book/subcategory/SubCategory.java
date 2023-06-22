package com.ecommerce.booksale.book.subcategory;

import com.ecommerce.booksale.book.Book;
import com.ecommerce.booksale.book.category.Category;
import lombok.Data;

import jakarta.persistence.*;

import java.util.List;

@Data
@Entity
@Table(name = "Sub_categories")
public class SubCategory {
    @Id
    @Column(name = "subcategory_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer subCategoryId;

    @Column(name = "name")
    private String name;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="category_id")
    private Category category;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="Book_Subcategory",
            joinColumns = @JoinColumn(name="subcategory_id"),
            inverseJoinColumns = @JoinColumn(name="book_id"))
    private List<Book> books;
}
