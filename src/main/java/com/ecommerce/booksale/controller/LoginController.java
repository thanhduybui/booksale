package com.ecommerce.booksale.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String handleLoginRequest(){
        return "login";
    }
}
