package vn.datle.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.datle.laptopshop.domain.Cart;
import vn.datle.laptopshop.domain.CartDetail;
import vn.datle.laptopshop.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);

    List<CartDetail> findByCartId(long cartId);

}
