package vn.datle.laptopshop.controller.error;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @GetMapping("/403")
    public String accessDenied() {
        return "error/403"; // Chỉ đến file 403.jsp trong WEB-INF/views/error/
    }
}
