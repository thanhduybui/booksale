package com.ecommerce.booksale.utils.email;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
@AllArgsConstructor
public class EmailService implements EmailSender{
    private final static Logger LOGGER =  LoggerFactory
            .getLogger(EmailService.class);
    private final JavaMailSender mailSender;
    @Override
    @Async
    public void send(String to, String email) {
        try{
            MimeMessage mimeMessage = mailSender.createMimeMessage();

            MimeMessageHelper helper = new
                    MimeMessageHelper(mimeMessage, "utf-8");
            helper.setText(email, true);
            helper.setTo(to);
            helper.setSubject("Confirm your email");
            helper.setFrom("dtb1742002@gmail.com");
            mailSender.send(mimeMessage);

        }catch (MessagingException e){
            LOGGER.error("failed to send email ", e);
            throw new IllegalStateException("failed to send email");
        }
    }
}
