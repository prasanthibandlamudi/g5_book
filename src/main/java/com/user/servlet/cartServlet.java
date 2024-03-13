package com.user.servlet;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.cartDAOimpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.BookDetails;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConn());
			BookDetails b = bookDAOImpl.getBookById(bid);
			
			Cart cart = new Cart();
			cart.setBid(bid);
			cart.setUserId(uid);
			cart.setBookName(b.getBookName());
			cart.setAuthor(b.getAuthor());
			cart.setPrice(Double.parseDouble(b.getPrice()));
			cart.setTotalPrice(Double.parseDouble(b.getPrice()));
			System.out.println(cart);;
			cartDAOimpl cartDAOimpl = new cartDAOimpl(DBConnect.getConn());
			boolean f = cartDAOimpl.addcart(cart);
			
			HttpSession session = request.getSession();
			if(f) {
			    session.setAttribute("addCart", "Book added to cart");
			    response.sendRedirect(request.getParameter("returnTo"));
			} else {
			    session.setAttribute("failed", "Something Wrong Happen!");
			    response.sendRedirect(request.getParameter("returnTo"));
			}

			
//			if(f) {
//				session.setAttribute("addCart", "Book added to cart");
//				response.sendRedirect("all_new_book.jsp");
////				System.out.print("Success added Cart");
//			}else {
//				session.setAttribute("failed", "Something Wrong Happen!");
//				response.sendRedirect("all_new_book.jsp");
////				System.out.println("Not added to cart");
//			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
