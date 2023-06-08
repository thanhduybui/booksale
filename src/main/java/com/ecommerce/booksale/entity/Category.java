package com.ecommerce.booksale.entity;

import lombok.Builder;
import lombok.Data;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "Categories")
public class Category {
    @Id
    @Column(name = "category_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    @Column(name = "name")
    private String name;

    @Column(name="is_active")
    private boolean isActive;

    @OneToMany(mappedBy = "category", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<SubCategory> subCategories;

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="Book_Category",
                joinColumns = @JoinColumn(name="category_id"),
                inverseJoinColumns = @JoinColumn(name="book_id"))
    private List<Book> books;

    public void add(SubCategory newSubCategory){
        if (this.subCategories == null){
            this.subCategories = new ArrayList<>();
        }

        this.subCategories.add(newSubCategory);

        newSubCategory.setCategory(this);
    }

    public void addBook(Book newBook){
        if (this.books == null){
            this.books = new ArrayList<>();
        }
        this.books.add(newBook);
    }

}