package vn.datle.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {
    @GetMapping("/admin/dashboard")
    public String getDashboardPage() {
        return "admin/dashboard/show";
    }

}
