package servlet;

import java.io.IOException;
 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserOperation;

public class DeleteUserServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int userId=Integer.parseInt(request.getParameter("userId"));
		UserOperation uo=new UserOperation();
		int num=uo.getDeleteUser(userId);
		if(num>0){
			request.getRequestDispatcher("ShowUserServlet").forward(request,response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
