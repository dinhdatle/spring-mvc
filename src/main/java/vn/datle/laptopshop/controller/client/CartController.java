package vn.datle.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.datle.laptopshop.domain.Cart;
import vn.datle.laptopshop.domain.CartDetail;
import vn.datle.laptopshop.service.CartDetailService;
import vn.datle.laptopshop.service.CartService;
import vn.datle.laptopshop.service.ProductService;
import vn.datle.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class CartController {
    private final ProductService productService;
    private final UserService userService;
    private final CartService cartService;
    private final CartDetailService cartDetailService;

    public CartController(ProductService productService, UserService userService, CartService cartService,
            CartDetailService cartDetailService) {
        this.productService = productService;
        this.userService = userService;
        this.cartService = cartService;
        this.cartDetailService = cartDetailService;
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession();

        String email = (String) session.getAttribute("email");
        Long productId = id;

        productService.handleAddproductToCart(email, productId, session);

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String getCartPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        Cart cart = cartService.getCartByUser(userService.getUserByEmail(email));
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();

            model.addAttribute("cartDetails", cartDetails);
            model.addAttribute("totalPrice", totalPrice);

        }
        return "client/cart/cart";

    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable Long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Long cartDetailId = id;
        cartDetailService.handleRemoveCartDetail(id, session);

        return "redirect:/cart";
    }

}
