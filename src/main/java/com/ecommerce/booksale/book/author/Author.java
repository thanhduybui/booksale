package com.ecommerce.booksale.book.author;
import com.ecommerce.booksale.book.Book;
import jakarta.persistence.*;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "Authors")
public class Author {
    @Id
    @Column(name = "author_id")
    private Integer authorId;

    @Column(name = "name")
    private String name;

    @Column(name = "biography", columnDefinition = "TEXT")
    private String biography;

    @Column(name = "country")
    private String country;

    @OneToMany(mappedBy="author", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<Book> books;

    public void add(Book newBook){
        if (this.books == null){
            this.books = new ArrayList<>();
        }

        this.books.add(newBook);

        newBook.setAuthor(this);
    }

}

