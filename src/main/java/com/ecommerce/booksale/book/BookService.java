package com.ecommerce.booksale.book;



import com.ecommerce.booksale.book.category.Category;
import com.ecommerce.booksale.book.category.CategoryRepository;
import com.ecommerce.booksale.book.category.CategoryService;
import com.ecommerce.booksale.exception.NotFoundException;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class BookService {

    private final BookRepository bookRepository;
    private final CategoryService categoryService;

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

    public List<BookDTO> getBookByCategoryIdWithPaging(int id, int pageNumber, int quantity){
        Pageable pageable = PageRequest.of(pageNumber, quantity);
        List<Book> books =  bookRepository.findByCategoryId(id, pageable);

        List<BookDTO> bookData = books.stream().map(BookMapper::toDTO).collect(Collectors.toList());

        return bookData;
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


    public List<BookDTO> getBookBySubCategoryId(int id, Pageable pageable){

        List<Book> books = bookRepository.findBySubcategoryId(id, pageable);

        // throw exception
        if (books.isEmpty() || books == null){
            throw new NotFoundException("Mục sản phẩm đang trống");
        }

        List<BookDTO> dataBooks = books.stream().map(BookMapper::toDTO).collect(Collectors.toList());

        return dataBooks;
    }


    // this function will add data to the model, include three list of books: fiction book, children book and self-help books
    // this data will use for home page of the website
    public void getHomeBookData(Model model){

        Map<String, Category> categoryMap = categoryService.getHomeCategories();

        model.addAttribute("categoriesMap", categoryMap);

        Pageable pageable = PageRequest.of(0, 7);

        List<Book> books = null;
        List<BookDTO> bookData = null;

        for (String category : categoryMap.keySet()){
            books = bookRepository.findBySubcategoryId(categoryMap.get(category)
                    .getSubCategories().get(0)
                    .getSubCategoryId(), pageable);

            bookData = books.stream().map(BookMapper::toDTO).collect(Collectors.toList());

            model.addAttribute(category+"Books", bookData);

        }

    }


}
