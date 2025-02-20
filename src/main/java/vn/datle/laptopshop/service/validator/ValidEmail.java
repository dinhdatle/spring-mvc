package vn.datle.laptopshop.service.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = EmailValidator.class) // Chỉ định lớp kiểm tra (validator)
@Target({ ElementType.FIELD }) // Annotation chỉ dùng cho các thuộc tính (fields)
@Retention(RetentionPolicy.RUNTIME) // Annotation có hiệu lực khi chương trình chạy
public @interface ValidEmail {
    String message() default "Email already exists"; // Thông báo lỗi mặc định

    Class<?>[] groups() default {}; // Nhóm kiểm tra (ít khi dùng)

    Class<? extends Payload>[] payload() default {}; // Dùng để thêm metadata (ít khi dùng)
}
