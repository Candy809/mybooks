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
		//判断登陆状态
				HttpSession session=request.getSession();
				UserLogin userInfo=(UserLogin) session.getAttribute("userInfo");
				if(userInfo==null){
					request.getRequestDispatcher("Login.jsp").forward(request, response);
				}else{
		            //从session中取出购买书籍的信息
					
					BookBean bookToAdd=(BookBean)session.getAttribute("bookToAdd");
					//
					@SuppressWarnings({ "rawtypes", "unchecked" })
					Map<String, CartItemBean> cart=(Map)session.getAttribute("cart");
					//如果购物车不存在，则就创建购物车
					if(cart==null){
						cart=new HashMap<String, CartItemBean>();//dtsjgdj
						//将购物车存入session中
						session.setAttribute("cart",cart);
					}
					//判断书籍是否放入购物车中
					CartItemBean cartItem=(CartItemBean)cart.get(bookToAdd.getIsbn());
					//如果书籍在购物车中，则更新其数量
					//否则，创建一个条目到Map中
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
