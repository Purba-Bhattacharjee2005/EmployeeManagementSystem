package com.ems.util;

import java.util.Properties;

// --- THESE ARE THE ONLY CHANGES ---
// Notice they all say 'jakarta.mail' now instead of 'javax.mail'
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
// ----------------------------------

public class EmailUtil {
    
    // Replace with your actual email address
    private static final String SENDER_EMAIL = "pbhattacharjee861@gmail.com";
    // CRITICAL: Use your generated 16-digit Google "App Password" here
    private static final String SENDER_PASSWORD = "wbbu pxnc sagj lfry";

    public static void sendEmail(String recipientEmail, String subject, String messageBody) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(SENDER_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject(subject);
            message.setText(messageBody);

            Transport.send(message);
            System.out.println("Email sent successfully to " + recipientEmail);

        } catch (MessagingException e) {
            e.printStackTrace();
            System.err.println("Error sending email to " + recipientEmail);
        }
    }
}