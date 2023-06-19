package com.ecommerce.booksale.book.subcategory;

import com.ecommerce.booksale.book.category.Category;
import lombok.Data;

import jakarta.persistence.*;
@Data
@Entity
@Table(name = "Sub_categories")
public class SubCategory {
    @Id
    @Column(name = "sub_category_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer subCategoryId;

    @Column(name = "name")
    private String name;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="category_id")
    private Category category;

}
