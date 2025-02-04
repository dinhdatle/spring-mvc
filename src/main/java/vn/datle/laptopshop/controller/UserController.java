package vn.datle.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.service.UserService;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String create(User user) {
        userService.saveUser(user);
        return "redirect:/admin/user/table-user";
    }

    @GetMapping("/admin/user/table-user")
    public String getTableUserPage(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin/user/table-user";
    }

}
