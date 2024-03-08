package com.user.servlet;

import java.io.IOException;
import java.util.Random;
import java.util.Properties;

import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.DAO.UserDAOImpl;
import com.entity.User;
import com.google.protobuf.Message;

@WebServlet("/resetPassword")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
        HttpSession session = req.getSession();
        try {
            String email = req.getParameter("email");
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;
            if (email != null && !email.isEmpty()) {
                // Generate OTP
                Random rand = new Random();
                otpvalue = rand.nextInt(999999);
                // Save OTP in session
                session.setAttribute("otp", otpvalue);
                session.setAttribute("email",email);
                // Send OTP to the user's email
                sendOTP(email, otpvalue);
               
                // Redirect to the page where user enters OTP
                dispatcher = req.getRequestDispatcher("enterOTP.jsp");
            } else {
                // Email not provided, redirect back to forgot password page
                dispatcher = req.getRequestDispatcher("forgotPassword.jsp");
            }
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception
        }
    }

    private void sendOTP(String email, int otp) {
        // Implement email sending logic here to send OTP to the user's email address
        // You can use JavaMail API or any other email sending library
        // Example using JavaMail API:
       
        Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(properties, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("prasanthib144@gmail.com", "yssl ciob fclj lbof");
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("prasanthib144@gmail.com"));
            message.setRecipients(jakarta.mail.internet.MimeMessage.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Your OTP for password reset");
            message.setText("Your OTP is: " + otp);
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
      
    }
}
