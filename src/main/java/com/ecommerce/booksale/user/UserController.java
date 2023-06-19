package com.ecommerce.booksale.user;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@AllArgsConstructor
public class UserController {
    private final UserService userService;
    @GetMapping("/user-information")
    public String getUserInfoPage(Principal principal, Model model){


        UserDTO userData = userService
                .getUserInformation(principal.getName());
        model.addAttribute("userData", userData);
        return "information";
    }

    @GetMapping("update-info")
    public String updateUserInfo(){
        return "user-info";
    }
}
