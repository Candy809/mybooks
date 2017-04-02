package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserOperation;

import entity.UserLogin;

public class AddUsersServlet extends HttpServlet {


	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userName=request.getParameter("userName");
		String passWord=request.getParameter("password");
		UserLogin ui=new UserLogin();
		ui.setLoginName(userName);
		ui.setPassword(passWord);
		ui.setUserRoleId(2);
		UserOperation uo=new UserOperation();
		int num=uo.getAddUsers(ui);
		if(num>0){
			request.getRequestDispatcher("ShowUserServlet").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
