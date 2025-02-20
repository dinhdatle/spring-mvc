package vn.datle.laptopshop.service.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import vn.datle.laptopshop.service.UserService;

@Component
public class EmailValidator implements ConstraintValidator<ValidEmail, String> {
    private final UserService userService;

    public EmailValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void initialize(ValidEmail constraintAnnotation) {
        // Không cần thực hiện gì ở đây
    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext context) {
        // Nếu email null hoặc không tồn tại trong DB thì hợp lệ
        return email != null && !userService.checkEmailExists(email);
    }

}
