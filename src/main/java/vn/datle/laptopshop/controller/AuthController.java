package vn.datle.laptopshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.service.UserService;

@RestController
public class AuthController {
    @Autowired
    private UserService userService;

    @GetMapping("/auth-info")
    public String getAuthInfo(HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();

        HttpSession session = request.getSession();

        User user = userService.getUserByEmail(email);

        // return "User: " + authentication.getName() + " | Roles: " +
        // authentication.getAuthorities() + " | Authentication: " +
        // authentication.getAuthorities();

        return "Email: " + email;

    }
}