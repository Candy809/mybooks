package servlet;

import java.io.IOException;
 
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MessageDao;

public class DeleteMessagesServlet extends HttpServlet
{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        int messageId=Integer.parseInt(request.getParameter("messageId"));
        HttpSession session=request.getSession();
        MessageDao messageDao=new MessageDao();
        int num=messageDao.deleteMessageByMessageID(messageId);
        if(num>0)
        {
            List message=messageDao.getMessage();
            session.setAttribute("message", message);
            request.getRequestDispatcher("deleteMessage.jsp").forward(request, response);
        }
    }

     
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        doGet(request,response);
    }

}
