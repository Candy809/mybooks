package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.BookBean;
import entity.CartItemBean;
import entity.UserLogin;

public class AddBookToCart extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//�жϵ�½״̬
				HttpSession session=request.getSession();
				UserLogin userInfo=(UserLogin) session.getAttribute("userInfo");
				if(userInfo==null){
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}else{
		            //��session��ȡ�������鼮����Ϣ
					
					BookBean bookToAdd=(BookBean)session.getAttribute("bookToAdd");
					//
					@SuppressWarnings({ "rawtypes", "unchecked" })
					Map<String, CartItemBean> cart=(Map)session.getAttribute("cart");
					//������ﳵ�����ڣ���ʹ������ﳵ
					if(cart==null){
						cart=new HashMap<String, CartItemBean>();//dtsjgdj
						//�����ﳵ����session��
						session.setAttribute("cart",cart);
					}
					//�ж��鼮�Ƿ���빺�ﳵ��
					CartItemBean cartItem=(CartItemBean)cart.get(bookToAdd.getIsbn());
					//����鼮�ڹ��ﳵ�У������������
					//���򣬴���һ����Ŀ��Map��
					if(cartItem!=null)
						cartItem.setQuantity(cartItem.getQuantity()+1);
					else
						cart.put(bookToAdd.getIsbn(),new CartItemBean(bookToAdd,1));
					request.getRequestDispatcher("viewCartUpdate.jsp").forward(request, response);
				}
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		
	}

}
