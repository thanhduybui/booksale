package com.ecommerce.booksale.cart;

import com.ecommerce.booksale.book.Book;
import com.ecommerce.booksale.book.BookRepository;
import com.ecommerce.booksale.order.orderItem.OrderItem;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


@Slf4j
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Service
public class ShoppingCart {
    private List<CartDTO> items = new ArrayList<>();
    private BookRepository bookRepository;

    public void addBook(CartDTO newItem) {
        boolean isDuplicate = items.stream()
                .anyMatch(item -> newItem.getBookId() == item.getBookId());

        if (isDuplicate) {
            items.stream()
                    .filter(item -> newItem.getBookId() == item.getBookId())
                    .forEach(item -> item.setQuantity(item.getQuantity() + newItem.getQuantity()));
        } else {
            items.add(newItem);
        }
    }

    public void updateQuantityItem(Integer bookId, Integer quantity){
        items.stream().filter(item -> item.getBookId() == bookId)
                .forEach(item ->
                    item.setQuantity(quantity));
    }

    public boolean deleteItem(int id){
        Iterator<CartDTO> itr = items.iterator();

        while (itr.hasNext()){
            CartDTO item = itr.next();

            if (item.getBookId() == id){
                itr.remove();
                return true;
            }
        }
        return false;
    }

    public void updateStatusItem(int id, boolean chosen){
        items.stream().filter(item -> item.getBookId() == id)
                .forEach(item ->
                        item.setChosen(chosen));
    }

    public boolean checkCreateOrderValid() {
        return items.stream().anyMatch(CartDTO::getChosen);
    }


    public Double getTotalPrice() {
        return items.stream()
                .filter(CartDTO::getChosen)
                .mapToDouble(item -> item.getQuantity() * item.getPrice())
                .sum();
    }


}
