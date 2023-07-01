package com.ecommerce.booksale.book.category;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class CategoryDTO {
    private int categoryId;
    private String categoryName;
    private String kebabCaseName;
}
