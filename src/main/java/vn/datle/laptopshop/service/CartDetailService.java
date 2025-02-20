package vn.datle.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.datle.laptopshop.domain.Cart;
import vn.datle.laptopshop.domain.CartDetail;
import vn.datle.laptopshop.repository.CartDetailRepository;
import vn.datle.laptopshop.repository.CartRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;
    private final CartRepository cartRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository, CartRepository cartRepository) {
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
    }

    public List<CartDetail> getCartDetailsByCartId(Long cartId) {
        return cartDetailRepository.findByCartId(cartId);
    }

    public void handleRemoveCartDetail(Long cartDetailId, HttpSession session) {
        Optional<CartDetail> cOptional = cartDetailRepository.findById(cartDetailId);

        if (cOptional.isPresent()) {
            CartDetail cartDetail = cOptional.get();

            Cart currentCart = cartDetail.getCart();
            // delete cartdetail
            cartDetailRepository.deleteById(cartDetailId);

            // update cart
            if (currentCart.getSum() > 1) {
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                cartRepository.save(currentCart);
                session.setAttribute("sumProductInCart", s);

            } else {
                cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sumProductInCart", 0);
            }

        }
    }

}
