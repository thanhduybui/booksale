package com.ecommerce.booksale.book.category;


import com.ecommerce.booksale.exception.NotFoundException;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@Getter
@Setter
@AllArgsConstructor
@Service
public class CategoryService {

    private final CategoryRepository categoryRepository;

    @Cacheable("categories")
    public List<CategoryDTO> getAllCategories() {



        List<Category> categories = categoryRepository.findAll();
        List<CategoryDTO> categoriesDTO = categories.stream()
                                                    .map(CategoryMapper::toDTO)
                                                    .collect(Collectors.toList());
        return categoriesDTO;
    }

    public Map<String, Category> getHomeCategories(){
        // create new Map
        Map<String, Category> categoryMap = new HashMap<>();

        // get categories
        Category fiction = categoryRepository.findById(1)
                        .orElseThrow(() -> new NotFoundException("Không có mục sách này")); // id = 1 is fiction book in database
        Category selfHelp = categoryRepository.findById(6)
                .orElseThrow(() -> new NotFoundException("Không có mục sách này")); // id = 6 is self-help book
        Category children = categoryRepository.findById(7)
                .orElseThrow(() -> new NotFoundException("Không có mục sách này")); // id = 7 is children book in database

        // add to map
        categoryMap.put("fiction", fiction);
        categoryMap.put("selfHelp", selfHelp);
        categoryMap.put("children", children);


        return categoryMap;
    }

    public Category getCategoryById(int id){
        return categoryRepository.findById(id).orElseThrow(() -> new NotFoundException("Không có danh mục này"));
    }







}
