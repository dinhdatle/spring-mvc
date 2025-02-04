package vn.datle.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

}
