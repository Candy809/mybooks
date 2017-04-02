<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="entity.BookOrder"/>
<jsp:directive.page import="entity.UserLogin"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'processOrder.jsp' starting page</title>
    
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
    <%
    	//BookOrder bookOrder=new BookOrder();
    	//bookOrder.setUserName(((UserInfo)session.getAttribute("userInfo")).getLoginName());
     %>
     <jsp:useBean id="bookOrder" class="entity.BookOrder" scope="request" />
     <jsp:setProperty name="bookOrder" property="userName" param="username"/>
     <jsp:setProperty name="bookOrder" property="zipcCode" param="zipcode"/>
     <jsp:setProperty name="bookOrder" property="phone" param="phone"/>
     <jsp:setProperty name="bookOrder" property="creditCard" param="creditcard"/>
     <jsp:setProperty name="bookOrder" property="total" value="<%=((Double)session.getAttribute("total")).doubleValue() %>"/>
     
     <jsp:useBean id="orderOperation" class="dao.OrderOperation" scope="request"/>
     <jsp:setProperty name="orderOperation" property="bookOrder" value="<%=(BookOrder)request.getAttribute("bookOrder") %>"/>
  </body>
</html>
