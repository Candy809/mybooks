package servlet;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

 

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 


import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

import entity.UserLogin;

public class UserNew extends HttpServlet {
    public void init(ServletConfig config) throws ServletException
    {
    	super.init(config);
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
    	}catch(Exception e){}
    }

    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//doGet(request,response);
		doGet(request,response);  
	}
	 public void doGet(HttpServletRequest request,HttpServletResponse response)
             throws ServletException,IOException
{

Connection con;
Statement sql;
UserLogin reg=new UserLogin();




String loginname=request.getParameter("txtName").trim(),
  password=request.getParameter("txtPass").trim();




String url="jdbc:mysql://localhost:3306/mybooks";
if(loginname==null)
 loginname="";

if(password==null)
	   password="";

boolean isLD=true;
for(int i=0;i<loginname.length();i++)
{
	  char c=loginname.charAt(i);
	  if(!((c<='z'&&c>='a')||(c<='Z'&&c>='A')||(c<='9'&&c>='0')))
		  isLD=false;
}
boolean boo=(loginname.length()>0&&password.length()>0&&(isLD==true));

try{
	
	  
	  //前面要判断用户名，密码是否为空，所以现在来转换编码
//	  loginname=new String(request.getParameter("txtName").trim().getBytes("ISO-8859-1"),"utf-8") ;
//	  password=new String(request.getParameter("txtPass").trim().getBytes("ISO-8859-1"),"utf-8") ;
//	 
	  
	 // String insertRecord="('"+loginname+"','"+password+"','"+1+"')";
   con=(Connection) DriverManager.getConnection(url,"root","123456");
   String insertCondition="insert into userInfo(loginname,password,userRoleId) values('"+loginname+"','"+password+"','"+1+"')";
   String select="select * from userInfo where loginname='"+loginname+"'";
   sql=(Statement) con.createStatement();
   
   if(boo){
	   ResultSet n=sql.executeQuery(select);
	   if(n!=null){
		   request.getRequestDispatcher("regist1.jsp").forward(request, response); 
		   
	   }else{
		  sql.executeUpdate(insertCondition);
		  request.getRequestDispatcher("Login.html").forward(request, response); 
	   }
   }else{
	   request.getRequestDispatcher("regist1.jsp").forward(request, response); 
	   
   }
   
   
   
//   if(boo)
//   {
// 	  int m=sql.executeUpdate(insertCondition);
// 	  if(m!=0)
// 	  {
//
// 		  reg.setLoginName(loginname);
// 		  reg.setPassword(password);
//
// 	  } 
//   }
//   else
//   {
// 	   
// 	  request.getRequestDispatcher("regist1.jsp").forward(request, response); 
//   }
   con.close();
}catch(SQLException exp){
	  request.getRequestDispatcher("regist1.jsp").forward(request, response);
}
request.getRequestDispatcher("Login.html").forward(request, response); 
//RequestDispatcher dispatcher=request.getRequestDispatcher("Login.html");
//dispatcher.forward(request,response);


}
	
}
