package com.dog.filter;


import java.io.IOException;
 



import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;






import dao.CheckLogin;
import entity.UserLogin;

public class OnlineFilter implements Filter {


	
//	<filter>  
//    <filter-name>OnlineFilter</filter-name>  
//    <filter-class>com.dog.filter.OnlineFilter</filter-class>  
// </filter>  
// <filter-mapping>  
//    <filter-name>OnlineFilter</filter-name>  
//    <url-pattern>/*</url-pattern>  
// </filter-mapping> 
	
	
	
    public OnlineFilter() {
    

        // TODO Auto-generated constructor stub
    }

 public void destroy() {
 
// TODO Auto-generated method stub

       }


public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
		throws IOException, ServletException {

      HttpServletRequest req=(HttpServletRequest) request;
      HttpServletResponse res=(HttpServletResponse) response;

//获得请求的URL

      String url=req.getRequestURL().toString();



//获得session中的对象


     HttpSession session= req.getSession();

    UserLogin userInfo=(UserLogin) session.getAttribute("userInfo");
   
   // int x=userInfo.getUserRoleId();//加2017.1.1
//   
//	String userName=request.getParameter("userName");
//	String userPass=request.getParameter("userPass");
//	CheckLogin checkLogin=new CheckLogin();
//	UserLogin userinfo=checkLogin.validate(userName,userPass);
    

//     if(userInfo.getUserRoleId()==1){//用户
//    	if(url.indexOf("index.jsp")>-1||url.indexOf("left.jsp")>-1||url.indexOf("right.jsp")
//    			>-1){//是这些页面的话
//    		 res.sendRedirect("Login.jsp");
//    		
//    	}else{
//    		chain.doFilter(request, response);
//    		
//    	}	
//    }
//     
//     else if(userInfo.getUserRoleId()==2){//管理员
//    	 if(url.indexOf("viewCartUpdate.jsp")>-1){
//    		 res.sendRedirect("Login.jsp");
//    	 }else{
//    		 chain.doFilter(request, response);
//    		 
//    	 }
//    	 
//     }else{
//    	 if(userInfo==null||"".equals(userInfo)){
//    		  res.sendRedirect("Login.jsp");
//    	 }
//    	 
//     }
  
   
//   if(url.indexOf("/Login.html") > -1||url.indexOf("/books.jsp") > -1||url.indexOf("/regist.jsp") > -1||url.indexOf("/home.html") > -1
//		   ||url.indexOf("/right.jsp")>-1||url.indexOf("/left.jsp")>-1
//		   
//		   ){//是Login.jsp
//	   
//	   chain.doFilter(request, response);
//	   return;
//   }else{//不是Login.jsp
//	   if(userInfo == null){
//		   res.sendRedirect("Login.html");
//	   }
//	   
//	   else{// 已经登陆,继续此次请求
//		   chain.doFilter(request, response);
//		  
//		   
//	   }
//   }
    
//    if(url.indexOf("/Login.html") > -1||url.indexOf("/books.jsp") > -1||
//    		url.indexOf("/regist.jsp") > -1
//    
//    		||url.indexOf("/home.jsp") > -1
// 		   
// 		   
// 		   ){//是Login.jsp
// 	   
// 	   chain.doFilter(request, response);
// 	   return;
//    }else{//不是Login.jsp
// 	   if(userInfo == null){
// 		   res.sendRedirect("Login.html");
// 	   } 
// 	 
 		   
 
  			  
  	//	   }
 		   
 		  
 		   
 //	   }
 if(userInfo==null){
	 if(url.endsWith("Login.html")||url.endsWith("home.jsp")||url.endsWith("regist.jsp"))
	 
	 {
		 chain.doFilter(request, response);
		 
	 }
	 else{
		 
		 res.sendRedirect("home.jsp");
	 }
 } 
    
    
 	   
 else if(userInfo.getUserRoleId()==1){
	 if(url.endsWith("Login.html")||url.endsWith("home.jsp")||url.endsWith("messasge.jsp")||
			 url.endsWith("order.jsp")||url.endsWith("motiyBook.jsp")
			 ||url.endsWith("regist.jsp")||url.endsWith("displayBookSession.jsp")
			 ||url.endsWith("viewCartUpdate.jsp")||url.endsWith("books.jsp")
			 ||url.endsWith("bye.jsp")
			 
			 ){
		 chain.doFilter(request, response);
		 
	 }else{
		 res.sendRedirect("home.jsp");
		 
	 }
	 
	 
	 
 }else if(userInfo.getUserRoleId()==2){
//	 if(url.endsWith("index.jsp")||url.endsWith("left.jsp")||url.endsWith("right.jsp")||
//			 url.endsWith("addUsers.jsp")||url.endsWith("addbook.jsp")
//			 ||url.endsWith("deleteMessage.jsp")||url.endsWith("bookManage.jsp")
//			 ||url.endsWith("update.jsp")||url.endsWith("adminOut.jsp")
//			 ||url.endsWith("left.jsp")||url.endsWith("bookUpdate.jsp")
//			 ||url.endsWith("showUserList.jsp")
// //||url.endsWith("bookManage.jsp")
//			 ){
//		 chain.doFilter(request, response);
//		 
//	 }else{
//		 res.sendRedirect("index.jsp");
//		 
//	 }
	 
	 if(url.endsWith("messasge.jsp")||
			 url.endsWith("order.jsp")||url.endsWith("motiyBook.jsp")
			||url.endsWith("displayBookSession.jsp")
			 ||url.endsWith("viewCartUpdate.jsp")||url.endsWith("books.jsp")
			 ||url.endsWith("bye.jsp")){
		 res.sendRedirect("index.jsp");
		 
	 }else{
		 chain.doFilter(request, response);
		 
	 }
	 
	 
	 
 }else{
	 res.sendRedirect("home.jsp");
	 
 }
    
    
}
    
   
//使用endsWith()判断url结尾的字符串


// if(url.endsWith("Login.jsp") || userInfo!=null || url.endsWith("books.jsp") || url.endsWith(".css") || 
//
//url.endsWith(".js")|| url.endsWith(".gif")|| url.endsWith(".png")|| url.endsWith(".jpg")||
//
//url.endsWith("SSH_market/")){
//
////满足条件就继续执行
//
//   chain.doFilter(request, response);
//
//}else{
//
////不满足条件就跳转到其他页面
//
//   PrintWriter out=res.getWriter();
//
//   out.print("<script language>alert('请登录！…………');top.location.href='login.jsp'</script>");
////
//   res.sendRedirect(req.getContextPath() + "/Login.jsp"); 
//
//}


//}


/**

* @see Filter#init(FilterConfig)

*/

public void init(FilterConfig fConfig) throws ServletException {

// TODO Auto-generated method stub

}

}