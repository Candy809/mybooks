package servlet;

import java.io.IOException;
 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;
import entity.Message;
import entity.UserLogin;

public class AddMessageServlet extends HttpServlet {

	 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 request.setCharacterEncoding("utf-8");
		 HttpSession session=request.getSession();
		 Message message=new Message();
		 String username=((UserLogin)session.getAttribute("userInfo")).getLoginName();
		 String title=request.getParameter("txtTitle");
		 String content=request.getParameter("txtContent");
		 String isbn=(String)session.getAttribute("isbn");
		 String writeDate=request.getParameter("txtDate");
		 MessageDao messagedao=new MessageDao();
		 message.setUsername(username);
		 message.setTitle(title);
		 message.setContent(content);
		 message.setIsbn(isbn);
		 message.setWriteDate(writeDate);
		 int num=messagedao.addMessage(message);
		 if(num>0)
		 {
		       List listMessage=messagedao.GetMessageByISBN(isbn);
		       session.setAttribute("listMessage", listMessage);
			   request.getRequestDispatcher("message.jsp").forward(request, response);
		 }
	}

 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
