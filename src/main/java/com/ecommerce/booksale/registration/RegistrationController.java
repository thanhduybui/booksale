package com.ecommerce.booksale.registration;


import com.ecommerce.booksale.entity.User;
import com.ecommerce.booksale.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor
@RequestMapping("/register")
public class RegistrationController {

    private final RegistrationService registrationService;

    @GetMapping
    public String handleGetRegister(Model model){
        // create new user to bind to the form
        User newUser = new User();
        System.out.println("IN GET METHOD");
        // set object name
        model.addAttribute("user", newUser);
        return "register";
    }

    @GetMapping("/confirm")
    public String confirmRegisterToken(@RequestParam("token") String token){
        registrationService.confirmToken(token);
        return "redirect:/login";
    }

    @PostMapping
    public String handlePostRegister(
            @ModelAttribute("user") User user,
            @RequestParam("confirm-password") String confirmPassword){
        System.out.println("IN POST METHOD");

        try{
            registrationService.register(user, confirmPassword);
        }catch (Exception e){
            System.out.println("Message " + e);
        }
        return "register-success";
    }

}
