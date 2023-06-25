package com.ecommerce.booksale.book;


import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryRepository;
import com.ecommerce.booksale.exception.NotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

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

    public List<BookDTO> getBookBySubCategoryId(int id){

        List<Book> books = bookRepository.findBySubCategoryId(id);

        // throw exception
        if (books.isEmpty() || books == null){
            throw new NotFoundException("Mục sản phẩm đang trống");
        }

        List<BookDTO> dataBooks = books.stream().map(BookMapper::toDTO).collect(Collectors.toList());

        return dataBooks;
    }


}
