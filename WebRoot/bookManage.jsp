<%@ page language="java" import="dao.*,entity.*,java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookManage.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <link rel="stylesheet" type="text/css" href="left.files/style_admin.css">
</head>
<body>
		<table cellspacing="1" cellpadding="4" width="100%"
			class="tableborder" id="table3">
			<form name="form1" action="showUserList.jsp" method="post">
			<tr>
				<td colspan="15" class="header">图书管理 
				</td>
			</tr>
			
			<tr>
				<td align="center" class="altbg1">
					<b>图书编号</b>
				</td>
				<td align="center" class="altbg1">
					<b>图书名称</b>
				</td>
				<td align="center" class="altbg1">
					<b>图书出版日期</b>
				</td>
				<td align="center" class="altbg1">
					<b>图书作者</b>
				</td>
				<td align="center" class="altbg1">
					<b>图书价格</b>
				</td>				
				<td align="center" class="altbg1">
					<b>修改</b>
				</td>
				<td align="center" class="altbg1">
					<b>删除</b>
				</td>
			</tr>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<jsp:useBean id="titlesBean" class="dao.TitlesBean" scope="request"/>
			<c:set var="titles" value="${titlesBean.titles}" scope="session"/>
			<c:forEach items="${sessionScope.titles}" var="bb" varStatus="status">
			
			<tr>
				<td rowspan="2" align="center" class="altbg2">
					${bb.isbn}
				</td>
				<td class="altbg2" rowspan="2" align="center">
					${bb.title}
				</td>
				<td class="altbg2" rowspan="2" align="center">
					${bb.copyright}
				</td>
				<td class="altbg2" rowspan="2" align="center">
					${bb.author}
				</td>
				<td class="altbg2" rowspan="2" align="center">
					${bb.price}
				</td>
				<td class="altbg2" rowspan="2" align="center">
					<a href="bookUpdate.jsp?isbn=${bb.isbn}">修改</a>
				</td>				
				<td class="altbg2" rowspan="2" align="center">
					<a href="DeleteBookManageServlet?isbn=${bb.isbn}" onClick="return window.confirm('确认要删除选中的信息')">删除</a>
				</td>
			</tr>
			
			<tr>

			</tr>
			</c:forEach>
			</table>
</body>
</html>
