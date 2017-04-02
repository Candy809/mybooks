package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderOperation;
import entity.BookOrder;

public class ProcessOrder extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	/**
	
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		String username=request.getParameter("username");
		String creditcard=request.getParameter("creditcard");
		String zipcode=request.getParameter("zipcode");
		String phone=request.getParameter("phone");
		double total=((Double)session.getAttribute("total")).doubleValue();
		BookOrder bookOrder=new BookOrder();
		bookOrder.setUserName(username);
		bookOrder.setCreditCard(creditcard);
		bookOrder.setPhone(phone);
		bookOrder.setTotal(total);
		bookOrder.setZipcCode(zipcode);
		OrderOperation op=new OrderOperation();
		int num=op.getBookOrder(bookOrder); 
		if(num>0){
			request.getRequestDispatcher("bye.jsp").forward(request,response);
		}else{
			request.getRequestDispatcher("books.jsp").forward(request,response);
		}
		
	}

}
