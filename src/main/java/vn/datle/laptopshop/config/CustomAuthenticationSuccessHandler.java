package vn.datle.laptopshop.config;

import java.io.IOException;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.service.UserService;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService userService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        // Thiết lập thông tin vào session trước khi xử lý quyền
        clearAuthenticationAttributes(request, authentication);

        // Kiểm tra quyền của người dùng và chuyển hướng
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority authority : authorities) {
            if (authority.getAuthority().equals("ROLE_ADMIN")) {
                response.sendRedirect("/admin/dashboard");
                return;
            } else if (authority.getAuthority().equals("ROLE_USER")) {
                response.sendRedirect("/");
                return;
            }
        }

    }

    protected void clearAuthenticationAttributes(HttpServletRequest request, Authentication authentication) {
        HttpSession session = request.getSession(false);

        if (session == null) {
            return;
        }

        // Xóa lỗi xác thực nếu có
        session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);

        // Lấy email từ Authentication
        String email = authentication.getName();

        // Lấy thông tin người dùng từ UserService
        User user = userService.getUserByEmail(email);
        if (user != null) {
            // // Lưu fullName và avatar vào session
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("avatar", user.getAvatar());
            session.setAttribute("id", user.getId());
            session.setAttribute("email", user.getEmail());
            session.setAttribute("sumProductInCart", user.getCart() == null ? 0 : user.getCart().getSum());
        } else {
            // // Nếu không có user, có thể thêm log hoặc xử lý lỗi ở đây
            System.out.println("User không tồn tại!");
        }
    }
}
