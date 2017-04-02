package servlet;

import java.io.IOException;
 

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.UserLogin;
 

public class LoginExit extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response); 
		 
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

		  HttpSession session=request.getSession(true);  
	      UserLogin login=(UserLogin)session.getAttribute("userInfo");  
	      boolean ok=true;  
	       if(login==null) 
	       {  
	         ok=false;  
	         response.sendRedirect("Login.html");  
	       } 
	       if(ok==true) 
	       {  
	         continueDoPost(request,response); 
	       } 
	   
	}
	
	 public void continueDoPost(HttpServletRequest request,HttpServletResponse response)  
             throws ServletException,IOException 
{  
HttpSession session=request.getSession(true);  
session.invalidate();              //销毁用户的 session 对象 
response.sendRedirect("home.jsp"); //返回主页    
} 

}
