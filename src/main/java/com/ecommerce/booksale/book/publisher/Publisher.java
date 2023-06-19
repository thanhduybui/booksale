package com.ecommerce.booksale.book.publisher;

import com.ecommerce.booksale.book.Book;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name="Publishers")
public class Publisher {
    @Id
    @Column(name="publisher_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer publisherId;

    @Column(name="name")
    private String name;

    @Column(name="address")
    private String address;

    @Column(name="phone")
    private String phone;

    @Column(name="is_active")
    private boolean isActive;

    @OneToMany(mappedBy = "publisher", cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    private List<Book> books;

    public void add(Book newBook){
        if (this.books == null){
            this.books = new ArrayList<>();
        }

        this.books.add(newBook);

        newBook.setPublisher(this);
    }


}
