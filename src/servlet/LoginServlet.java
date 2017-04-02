package servlet;

import java.io.IOException;







import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CheckLogin;
import entity.UserLogin;


public class LoginServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//response.setContentType("text/html");
		doGet(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//response.setContentType("text/html");
		String userName=request.getParameter("userName");
		String userPass=request.getParameter("userPass");
	
		CheckLogin checkLogin=new CheckLogin();
		UserLogin userInfo=checkLogin.validate(userName,userPass);
		if(userInfo!=null && userInfo.getUserRoleId()==1){
			HttpSession session=request.getSession();
			session.setAttribute("username", userName);
			session.setAttribute("userInfo", userInfo);
			request.getRequestDispatcher("books.jsp").forward(request,response);
		}
		
		else if(userInfo!=null && userInfo.getUserRoleId()==2){
		
			HttpSession session=request.getSession();
			session.setAttribute("username", userName);
			session.setAttribute("userInfo", userInfo);
			
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		
		else {
			//µÇÂ¼Ê§°Ü£¬·µ»ØLoginÒ³Ãæ
			request.getRequestDispatcher("Login.html").forward(request,response);
		}
	}

}
