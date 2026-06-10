package com.ems.test;

import com.ems.util.EmailUtil;

public class EmailTest {
    public static void main(String[] args) {
        System.out.println("Starting email test...");
        
        // Replace this with your personal email address so you can check your inbox
        String testRecipient = "pbhattacharjee861@gmail.com";
        String testSubject = "System Test: JavaMail API";
        String testBody = "Success! If you are reading this, your EmailUtility class is configured perfectly.";
        
        try {
            EmailUtil.sendEmail(testRecipient, testSubject, testBody);
            System.out.println("Test complete. Please check your inbox (and spam folder).");
        } catch (Exception e) {
            System.err.println("The test failed. See error details below:");
            e.printStackTrace();
        }
    }
}