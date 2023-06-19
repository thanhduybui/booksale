package com.ecommerce.booksale.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user-information")
public class UserController {
    @GetMapping
    public String getUserInfoPage(){
        return "user-info";
    }
}
