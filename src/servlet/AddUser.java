package servlet;

import java.io.IOException;
 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserOperation;
 
import entity.UserLogin;

public class AddUser extends HttpServlet {
 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName=request.getParameter("txtName");
		String passWord=request.getParameter("txtPass");
		UserLogin ui=new UserLogin();
		ui.setLoginName(userName);
		ui.setPassword(passWord);
		ui.setUserRoleId(1);
		UserOperation uo=new UserOperation();
		int num=uo.getAddUsers(ui);
		if(num>0){
			request.getRequestDispatcher("Login.html").forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

}
}