package vn.datle.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.datle.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    public boolean existsByEmail(String email);

    public User findByEmail(String email);

}