package com.ecommerce.booksale.book;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


@Getter
@Setter
@NoArgsConstructor
public class BookPaging {
    private List<BookDTO> books;
    private int currentPage;
    private int totalPages;
    private int numberOfBooks;
}
