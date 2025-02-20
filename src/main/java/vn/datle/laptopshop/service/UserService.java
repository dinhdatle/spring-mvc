package vn.datle.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.datle.laptopshop.domain.Role;
import vn.datle.laptopshop.domain.User;
import vn.datle.laptopshop.domain.dto.RegisterDTO;
import vn.datle.laptopshop.repository.RoleRepository;
import vn.datle.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }

    public void deleteUserById(Long id) {
        userRepository.deleteById(id);
    }

    public Role findRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public boolean checkEmailExists(String email) {
        return userRepository.existsByEmail(email);
    }

    public User registerDTOtoUser(RegisterDTO registorDTO) {
        User user = new User();
        user.setEmail(registorDTO.getEmail());
        user.setPassword(registorDTO.getPassword());
        user.setFullName(registorDTO.getFirstName() + " " + registorDTO.getLastName());
        return user;
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}
