package vn.datle.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.datle.laptopshop.domain.Cart;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public Cart getCartByUser(User user) {
        return cartRepository.findByUser(user);
    }

}
