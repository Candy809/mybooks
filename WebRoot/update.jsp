<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="java.util.Set"/>
<jsp:directive.page import="entity.CartItemBean"/>
<jsp:directive.page import="entity.BookBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  
  int i=Integer.parseInt(request.getParameter("i"));
  HashMap cart=(HashMap)session.getAttribute("cart");
			Set keys=cart.keySet();
			Object[] isbn=keys.toArray();
			CartItemBean cartItem;
			cartItem=(CartItemBean)cart.get(isbn[i]);
			BookBean book=cartItem.getBook();
			int quantity=cartItem.getQuantity();
			double price=book.getPrice();
			double subtotal=price*quantity;
  
   %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>
    <table width="353" border="1" height="90">
    <tr>
      <td ><div align="right"> 书名：</div></td>
      <td ><div align="left"><%=book.getTitle() %></div></td>
    </tr>
    <tr>
      <td><div align="right"> 数量：</div></td>
      <td><div align="left">
        <input type="text" name="textfield" size="6" value="<%=quantity %>"/>
      </div></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="button" name="Submit" value="修 改" />
      </div></td>
    </tr>
  </table>
 
 <br>
  
  </body>
</html>
