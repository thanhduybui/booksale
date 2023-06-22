package com.ecommerce.booksale.book;


import com.ecommerce.booksale.book.author.Author;
import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.image.Image;
import com.ecommerce.booksale.book.publisher.Publisher;
import com.ecommerce.booksale.book.subcategory.SubCategory;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "Books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="book_id")
    private int bookId;

    @Column(name="title")
    private String title;

    @Column(name="publication_year")
    private int publicationYear;

    @Column(name="discount")
    private int discount;

    @Column(name="main_img")
    private String mainImg;

    @Column(name="price")
    private double price;

    @Column(name="quantity")
    private int quantity;

    @Column(name="is_active")
    private boolean isActive;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE,
            CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="author_id")
    @JsonIgnore
    private Author author;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE,
                    CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="publisher_id")
    @JsonIgnore
    private Publisher publisher;

    @ManyToMany(fetch = FetchType.LAZY, cascade =
            {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="Book_Category",
            joinColumns = @JoinColumn(name="book_id"),
            inverseJoinColumns = @JoinColumn(name="category_id"))
    @JsonIgnore
    private List<Category> categories;

    @ManyToMany(fetch = FetchType.LAZY, cascade =
            {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="Book_Subcategory",
            joinColumns = @JoinColumn(name="book_id"),
            inverseJoinColumns = @JoinColumn(name="subcategory_id"))
    @JsonIgnore
    private List<SubCategory> Subcategories;

    @OneToMany(mappedBy = "book" , cascade =
                    {CascadeType.DETACH, CascadeType.MERGE,
                    CascadeType.PERSIST, CascadeType.REFRESH})
    private List<Image> images;

}
