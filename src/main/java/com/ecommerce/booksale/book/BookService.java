package com.ecommerce.booksale.book;


import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class BookService {

    private final BookRepository bookRepository;
    private final CategoryRepository categoryRepository;

    // get All books
    public List<Book> findAllBooks(){
        return bookRepository.findAll();
    }

    //
    public List<Book> findTopBooks(){

        Page<Book> pageBooks = bookRepository.findAll(PageRequest.of(0, 5));

        return pageBooks.getContent();
    }

    public List<Book> getBookByCategoryId(int id){
        return bookRepository.findByCategoryId(id);
    }

    public List<Book> getBookBySubCategoryId(int id){
        return bookRepository.findBySubCategoryId(id);
    }


}
