package com.ecommerce.booksale.service;


import com.ecommerce.booksale.entity.User;
import com.ecommerce.booksale.registration.token.ConfirmationTokenRepository;
import com.ecommerce.booksale.registration.token.ConfirmationToken;
import com.ecommerce.booksale.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {
    private final static String USER_NOT_FOUND = "user with email %s not found";
    private final UserRepository userRepository;
    private final ConfirmationTokenRepository confirmationTokenRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException(String.format(USER_NOT_FOUND, email)));
    }

    public String registerUser(User user){
        //encode user's password
        String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        // create token
        String token = UUID.randomUUID().toString();
        ConfirmationToken confirmationToken = new
                ConfirmationToken(token,
                LocalDateTime.now(),
                LocalDateTime.now().plusMinutes(15),
                user);

        // save confirm token to db
        confirmationTokenRepository.save(confirmationToken);

        return token;
    }

    public int enableUser(String email){
        return userRepository.enableUser(email);
    }



}
