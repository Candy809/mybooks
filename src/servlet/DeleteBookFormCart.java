package servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteBookFormCart extends HttpServlet {

	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String isbn=request.getParameter("i");
		//从session中取出购买书籍的信息
		HttpSession session=request.getSession();
		@SuppressWarnings("rawtypes")
		HashMap cart=(HashMap)session.getAttribute("cart");
		cart.remove(isbn);
		request.getRequestDispatcher("viewCartUpdate.jsp").forward(request,response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
