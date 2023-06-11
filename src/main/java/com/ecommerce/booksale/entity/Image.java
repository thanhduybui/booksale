package com.ecommerce.booksale.entity;


import com.ecommerce.booksale.home.book.Book;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name="Images")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="img_id")
    private int imgId;

    @Column(name="img_url", nullable = false)
    private String imgUrl;

    @ManyToOne(cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinColumn(name="book_id")
    private Book book;
}
