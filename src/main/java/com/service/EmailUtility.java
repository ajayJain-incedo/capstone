package com.service;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtility {
    public boolean sendMail(String toEmail, int otp) {
        boolean test=false;
        String from="senddummymail7@gmail.com";
        String pass="dummy123@";

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host","smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
//            pr.put("mail.smtp.socketFactory.port", "587");
//            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(from, pass);
                }
            });
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(from));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("Verification Mail");
            message.setText("Your 6 digit OTP for password reset is: "+otp);
            Transport.send(message);
            test=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        return test;
    }
}