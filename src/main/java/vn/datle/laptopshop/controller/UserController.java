package vn.datle.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import vn.datle.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

// @RestController
// public class UserController {
//     private final UserService service;

//     public UserController(UserService service) {
//         this.service = service;
//     }

//     @GetMapping("/")
//     public String getHomepage() {
//         return this.service.handleHello();
//     }

// }
@Controller
public class UserController {
    private final UserService service;

    public UserController(UserService service) {
        this.service = service;
    }

    @RequestMapping("/")
    public String getHomepage() {
        String message = this.service.handleHello();
        return "hello";
    }

}