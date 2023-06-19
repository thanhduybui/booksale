package com.ecommerce.booksale.book;


import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BookService {

    private final BookRepository bookRepository;

    // get All books
    public List<Book> findAllBooks(){
        return bookRepository.findAll();
    }

    //
    public List<Book> findTopBooks(){

        Page<Book> pageBooks = bookRepository.findAll(PageRequest.of(0, 5));

        return pageBooks.getContent();
    }
}
