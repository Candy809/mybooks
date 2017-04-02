package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserOperation;
 
import entity.UserLogin;

public class ShowUserServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserLogin ui=new UserLogin();
		UserOperation uo=new UserOperation();
		List listUsers=uo.getShowUsers();
		HttpSession session=request.getSession();
		session.setAttribute("listUsers",listUsers);
		request.getRequestDispatcher("showUserList.jsp").forward(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
