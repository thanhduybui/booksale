package com.ecommerce.booksale.registration;


import com.ecommerce.booksale.user.User;
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
        // set object name
        model.addAttribute("user", new User());
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
            @RequestParam("confirm-password") String confirmPassword, Model model){
        try{
            registrationService.register(user, confirmPassword);
        }catch (Exception e){
            // set object name
            model.addAttribute("error", e.getMessage());
            return "register";
        }

        return "register-success";
    }

}
