package vn.datle.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.datle.laptopshop.domain.Cart;
import vn.datle.laptopshop.domain.CartDetail;
import vn.datle.laptopshop.domain.Product;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.repository.CartDetailRepository;
import vn.datle.laptopshop.repository.CartRepository;
import vn.datle.laptopshop.repository.ProductRepository;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.productRepository = productRepository;
        this.userService = userService;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public void saveProduct(Product product) {
        productRepository.save(product);
    }

    public void deleteProductById(Long id) {
        productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void handleAddproductToCart(String email, Long productID, HttpSession session) {
        // check uuser có cart chưa
        User user = userService.getUserByEmail(email);

        if (user != null) {
            Cart cart = cartRepository.findByUser(user);

            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(user);
                newCart.setSum(0);
                cart = cartRepository.save(newCart);
            }

            // lưu cartdetail
            // tìm product theo id
            Optional<Product> productOptional = productRepository.findById(productID);
            if (productOptional != null) {
                Product product = productOptional.get();

                // check product đã đươc add trong cart chưa
                CartDetail oldCartDetailCheck = cartDetailRepository.findByCartAndProduct(cart, product);

                if (oldCartDetailCheck == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setQuantity(1);
                    cartDetail.setPrice(product.getPrice());
                    cartDetailRepository.save(cartDetail);

                    // UPdate cart số lượng
                    cart.setSum(cart.getSum() + 1);
                    cartRepository.save(cart);
                    session.setAttribute("sumProductInCart", cart.getSum() + 1);
                } else {
                    oldCartDetailCheck.setQuantity(oldCartDetailCheck.getQuantity() + 1);
                    cartDetailRepository.save(oldCartDetailCheck);
                }

            }
        }
    }
}
