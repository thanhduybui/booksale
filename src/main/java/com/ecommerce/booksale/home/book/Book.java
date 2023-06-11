package com.ecommerce.booksale.home.book;


import com.ecommerce.booksale.entity.Author;
import com.ecommerce.booksale.entity.Category;
import com.ecommerce.booksale.entity.Image;
import com.ecommerce.booksale.entity.Publisher;
import jakarta.persistence.*;
import jakarta.persistence.criteria.CriteriaBuilder;
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
    public Author author;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE,
                    CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="publisher_id")
    public Publisher publisher;

    @ManyToMany(fetch = FetchType.LAZY, cascade =
            {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="Book_Category",
            joinColumns = @JoinColumn(name="book_id"),
            inverseJoinColumns = @JoinColumn(name="category_id"))
    public List<Category> categories;

    @OneToMany(mappedBy = "book" , cascade =
                    {CascadeType.DETACH, CascadeType.MERGE,
                    CascadeType.PERSIST, CascadeType.REFRESH})
    public List<Image> images;

}
