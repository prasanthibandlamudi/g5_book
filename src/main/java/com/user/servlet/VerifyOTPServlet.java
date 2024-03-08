package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/verifyOTP")
public class VerifyOTPServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        try {
        	RequestDispatcher dispatcher = null;
            int otp = Integer.parseInt(req.getParameter("otp"));
            Integer storedOTP = (Integer) session.getAttribute("otp");

            if (otp == storedOTP) {
                // OTP is correct, allow the user to reset the password
                req.setAttribute("email", session.getAttribute("email"));
                dispatcher = req.getRequestDispatcher("changePassword.jsp");
            } else {
                // OTP is incorrect, redirect back to the enter OTP page
                req.setAttribute("error", "Invalid OTP, please try again.");
                dispatcher = req.getRequestDispatcher("enterOTP.jsp");
                
            }
            dispatcher.forward(req, resp);
        } catch (NumberFormatException e) {
            // Invalid OTP format, redirect back to the enter OTP page
            req.setAttribute("error", "Invalid OTP format, please enter a valid OTP.");
            RequestDispatcher dispatcher = req.getRequestDispatcher("enterOTP.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
