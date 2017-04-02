package servlet;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookManage;

public class DeleteBookManageServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String isbn=request.getParameter("isbn");
		BookManage deleteBookManager=new BookManage();
		int num=deleteBookManager.getDelete(isbn);
		if(num>0){
            request.getRequestDispatcher("bookManage.jsp").forward(request, response);
        }
		
	}	

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
