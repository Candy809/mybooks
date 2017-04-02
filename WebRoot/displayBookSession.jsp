<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.util.*, dao.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="id" value="${param.id}"></c:set>
<c:forEach var="titles" items="${sessionScope.titles}">
	<c:if test="${id==titles.isbn}">
		<c:set var="bookToAdd" value="${titles}" scope="session"></c:set>
	</c:if>

</c:forEach>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'displayBookSession.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
  <style type="text/css">
  .content {
  background:url(image/banner2.jpg);
  background-attachment:fixed;
   padding-left:380px;
   padding-top:30px;
  padding-bottom:100px;
  }
  </style>
  
  
  </head>
  
  <body>
   <!-- navigation -->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home.jsp"><h1 style="font-family:微软雅黑;"><span class="fa fa-diamond" aria-hidden="true"></span >Book Store</h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right" >
			  <li class="active"><a href="home.html" style=" font-family:微软雅黑;
 font-size:18px; ">主页</a></li>
			  <li><a href="regist.jsp" style=" font-family:微软雅黑;
 font-size:18px; ">注册</a></li>
			  <li><a href="Login.html" style=" font-family:微软雅黑;
 font-size:18px; ">登录</a></li>
			  <li><a href="books.jsp" style=" font-family:微软雅黑;
 font-size:18px; ">购书</a></li>
			  <li><a href="viewCartUpdate.jsp" style=" font-family:微软雅黑;
 font-size:18px; ">查看购物车</a></li>
			  <li><a href="LoginExit" style=" font-family:微软雅黑;
 font-size:18px; ">退出</a></li>
			  <li><a href="books.jsp" style=" font-family:微软雅黑;
 font-size:18px; ">登录者：${sessionScope.username}</a></li>
				
				
			</ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<!--/navigation -->
  
  

<br><br>
<section class="about-w3ls">
	<div class="container">
        <!-- Intro Content -->
        <div class="row">
            <div class="col-lg-12">
				 
                <h3 class="text-center" style="font-family:微软雅黑 ;font-size:30px;">图书详情</h3>
               
                 </div>
        </div>
        <!-- /.row -->
	</div>
</section>	
  
  
  
  <div class="content">
    <TABLE style="TEXT-ALIGN: center;background-color:#2b2d41;
    color:white;font-family:黑体;font-size:20px;border:10px solid #c4bcb1;" 
	cellSpacing="1" cellPadding="1" width="590" border="1" >
										<TBODY>
											<tr height="80" style="background-color: rgba(0, 0, 0, 0.2);color:#d24747;">
												<td colspan="3">
												<h2 >${bookToAdd.title }</h2>
												</td>
											</tr>
											
											<tr>
											
												<!-- create table cell for product image -->
												<td rowspan="6"><!-- cell spans 5 rows -->
													<img
														style="border: thin solid black"
														src="images/${bookToAdd.imageFile}" alt="${bookToAdd.title }" />
												</td>

												<!-- create table cells for price in row 1 -->
												<td class="bold" align="center" height="40px">
													图书编号：
												</td>

												<td align="center" height="25px">
													${bookToAdd.isbn }
												</td>
											</tr>

											<tr align="center" height="25px">

												<!-- create table cells for ISBN in row 2 -->
												<td class="bold"  align="center" height="40px">
													价格：
												</td>

												<td  align="center" height="25px">
													${bookToAdd.price}
												</td>
												
											</tr>

											<tr  align="center" height="25px">

												<!-- create table cells for edition in row 3 -->
												<td class="bold" height="40px">
													作者：
												</td>

												<td height="25px">
													${bookToAdd.author}
												</td>
											</tr>

											<tr align="center" height="25px">

												<!-- create table cells for copyright in row 4 -->
												<td class="bold" height="40px">
													版权：
												</td>

												<td height="25px">
													${bookToAdd.copyright}
												</td>
											</tr>
                                             <tr  align="center" height="25px">

												<!-- create table cells for edition in row 3 -->
												<td class="bold" height="40px">
												   详情：
												</td>

												<td height="25px">
													${bookToAdd.description}
												</td>
											</tr>
											<tr align="center">
												<!-- create Add to Cart button in row 5 -->
												<td>
													<form method="post" action="AddBookToCart">
															<input type="submit" value="放入购物车" style="margin-top:20px;height: 35px; 
															background-color:#d24747;border-style:none;border-color:#d24747;font-family:微软雅黑;
															color:white;font-size:15px; width: 152px"/>
															</form>
												</td>

												<!-- create View Cart button in row 5 -->
												<td>
													<form method="get" action="viewCartUpdate.jsp">
															<input type="submit" value="查看购物车" style="margin-top:20px;height:35px; 
															background-color:#d24747;border-style:none;border-color:#d24747;font-family:微软雅黑;
															color:white;font-size:15px; width: 164px"/>
															</form>	
												</td>	
											</tr>
											<tr align="center">
												<td style="background-color: rgba(0, 0, 0, 0.2);">
													
												</td>
												<td align="center" style="background-color: rgba(0, 0, 0, 0.2);">
													<form method="post" action="MessageServlet?isbn=${bookToAdd.isbn }">
														<input type="submit" value="查看留言" style="margin-top:20px;height: 35px; 
															background-color:#d24747;border-style:none;border-color:#d24747;font-family:微软雅黑;
															color:white;font-size:15px; width: 155px"/>
													</form>
												</td>
												<td align="center" style="background-color: rgba(0, 0, 0, 0.2);">
													<form method="post" action="books.jsp">
														<input type="submit" value="返回购物" style="margin-top:20px;height: 35px; 
															background-color:#d24747;border-style:none;border-color:#d24747;font-family:微软雅黑;
															color:white;font-size:15px; width: 155px"/>
													</form>
												</td>
											</tr>
										</TBODY>
									</TABLE>
									
				</div>					
									
  </body>
</html>
