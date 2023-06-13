package com.ecommerce.booksale.user;


import com.ecommerce.booksale.constants.AuthenError;
import com.ecommerce.booksale.registration.token.ConfirmationTokenRepository;
import com.ecommerce.booksale.registration.token.ConfirmationToken;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@AllArgsConstructor
public class UserService implements UserDetailsService {
    private final UserRepository userRepository;
    private final ConfirmationTokenRepository confirmationTokenRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException(String.format(AuthenError.USER_NOT_FOUND, email)));
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
