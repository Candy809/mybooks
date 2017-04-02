package servlet;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;

import entity.UserLogin;

public class MessageServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 request.setCharacterEncoding("utf-8");
	        HttpSession session=request.getSession();
	        UserLogin userInfo=(UserLogin) session.getAttribute("userInfo");
			if(userInfo==null){
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}else
			{	
	        String isbn=request.getParameter("isbn");
	        session.setAttribute("isbn", isbn);
	        MessageDao messageDao=new MessageDao();
	        List listMessage=messageDao.GetMessageByISBN(isbn);
	        session.setAttribute("listMessage", listMessage);
	        request.getRequestDispatcher("message.jsp").forward(request, response);
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

		doGet(request,response);
	}

}
