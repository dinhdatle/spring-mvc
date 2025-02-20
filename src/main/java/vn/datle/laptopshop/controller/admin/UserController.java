package vn.datle.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.service.UploadService;
import vn.datle.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/user/create")
    public String createUser(@ModelAttribute @Valid User user, BindingResult result,
            @RequestParam("avatar1") MultipartFile file, Model model) {

        List<FieldError> errors = result.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        if (result.hasErrors()) {
            model.addAttribute("user", user);
            model.addAttribute("errors", result); // Đảm bảo errors có mặt trong model

            return "admin/user/create";
        }

        String avatar = uploadService.hanldeFileUpload(file, "avatar");
        String hashPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setAvatar(avatar);
        user.setRole(userService.findRoleByName(user.getRole().getName()));
        userService.saveUser(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user")
    public String getTableUserPage(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "admin/user/show";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(@PathVariable long id, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "admin/user/detail";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(@PathVariable Long id, Model model) {
        User currentUser = userService.getUserById(id);
        model.addAttribute("user", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute User user) {
        User currentUser = userService.getUserById(user.getId());
        if (currentUser != null) {
            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            userService.saveUser(currentUser);
        }

        return "redirect:/admin/user";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String postDeleteUser(@PathVariable Long id) {
        userService.deleteUserById(id);

        return "redirect:/admin/user";
    }

}
