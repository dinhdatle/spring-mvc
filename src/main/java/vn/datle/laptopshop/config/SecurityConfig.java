package vn.datle.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfig {

        @Bean
        public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
                return new CustomAuthenticationSuccessHandler();
        }

        @Bean
        public PasswordEncoder passwordEncoder() {
                return new BCryptPasswordEncoder();
        }

        @Bean
        public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
                http
                                .authorizeHttpRequests(auth -> auth
                                                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
                                                .permitAll()
                                                .requestMatchers("/", "/login", "/register", "/css/**",
                                                                "/js/**", "/images/**", "/client/**", "/product/**")

                                                .permitAll() // Ai cũng vào được
                                                .requestMatchers("/admin/**").hasRole("ADMIN") // Chỉ ADMIN vào được
                                                .anyRequest().authenticated())
                                .formLogin(form -> form
                                                .loginPage("/login")
                                                .successHandler(customAuthenticationSuccessHandler()) // sau khi login
                                                .failureUrl("/login?error=true") // Báo lỗi nếu login sai
                                                .permitAll())
                                .logout(logout -> logout
                                                .logoutUrl("/logout")
                                                .logoutSuccessUrl("/login?logout=true")
                                                .permitAll())
                                .rememberMe(remember -> remember
                                                .key("my-secure-key") // 🔑 Đặt khóa bảo mật
                                                .tokenValiditySeconds(7 * 24 * 60 * 60) // ⏳ Lưu trong 7 ngày
                                                .rememberMeParameter("remember-me") // 🏷️ Tên tham số từ form login
                                )
                                .exceptionHandling(exception -> exception
                                                .accessDeniedPage("/403") // Chuyển hướng khi user không có quyền
                                )
                                .sessionManagement((session) -> session
                                                // .sessionFixation().none()
                                                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                                                .invalidSessionUrl("/login?expired")
                                                .maximumSessions(1) // Cho phép tối đa 1 session
                                                .maxSessionsPreventsLogin(false))
                                .csrf(csrf -> csrf.disable());// Tắt CSRF Protection

                return http.build();
        }
}
