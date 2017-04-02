package servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.BookBean;
import entity.CartItemBean;

public class MotiyBookToCart extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int quantity=Integer.parseInt(request.getParameter("txtNum"));
		String isbn=request.getParameter("isbn");
		HttpSession session=request.getSession();
		@SuppressWarnings("rawtypes")
		HashMap cart=(HashMap)session.getAttribute("cart");
	 	CartItemBean cartItem=(CartItemBean)cart.get(isbn);
		@SuppressWarnings("unused")
		BookBean book=cartItem.getBook();
		cartItem.setQuantity(quantity);
		request.getRequestDispatcher("viewCartUpdate.jsp").forward(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
