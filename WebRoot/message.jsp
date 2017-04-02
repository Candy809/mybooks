<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message.jsp' starting page</title>
    
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
  margin-top:0px;
  }
 .new {
 margin-left:326px;
 }
  lable {
  font-family:"微软雅黑";
  font-size:20px;
  color:#EEE;
  }
 .inputM {
 margin-left:60px;
  margin-top:30px;
 
 }
 .submit {
 
	border: none;
	font-size:15px;
	font-family:"微软雅黑";
}

.submit:hover {
	background-color: #feea3a;
}
#input {
    background-color:#EEE;
    border-color:#EEE;
    border-style:none;
    font-family:"微软雅黑";
    font-size:15px;
	 
}
.add {
background: rgba(0, 0, 0, 0.7);
width:700px;
height:600px;
border-top-left-radius:18px;border-top-right-radius:18px;
}
.all {
background:url(image/banner2.jpg);
	background-position:center;
	background-attachment:fixed;
}
  </style>
  
  
  
  </head>
  
 <BODY>
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

<!-- navigation -->
 
<section class="about-w3ls">
	<div class="container">
        <!-- Intro Content -->
        <div class="row">
            <div class="col-lg-12">
				 
                <h3 class="text-center" style="font-family:微软雅黑">留言板</h3>
                <p style="font-family:黑体">书是人类进步的阶梯,终生的伴侣,最诚挚的朋友。</p>
                 </div>
        </div>
        <!-- /.row -->
	</div>
</section>	

<div class="all">

 <div class="new">
    <h2 style="background-color:blue;text-align:center;font-family:微软雅黑;color:white; background-color: #33accc;
    border: 2px solid #33accc;width: 700px;height:60px;padding-top:10px;border-radius:18px;">新留言</h2> 
    <form onsubmit=submitonce(this) action="AddMessageServlet" method="post">
    <table border=0; cellPadding=1 width=700px style="font-family:微软雅黑;text-align:center;background: rgba(255, 255,255, 0.9);">
      <tr style="height: 40px; border:none;background-color:#feea3a;font-size:20px;">
         <td style="width: 300px; ">标题</td>
         <td style="width: 126px; ">作者</td>
         <td style="width: 171px; ">时间</td>
      </tr>
       <c:forEach items="${sessionScope.listMessage}" var="message">
      <tr  style="height: 40px; border:none;border-bottom:#EEE;">
        <td>${message.title }</td>
         <td>${message.username}</td>
          <td>${message.writeDate }</td>
      </tr>
      </c:forEach>
       
    </table>
    
    <div class="add" >
 <h2 style="background-color:blue;text-align:center;font-family:微软雅黑;color:white; background-color: #33accc;
    border: 2px solid #33accc;width: 700px;height:50px;padding-top:5px;border-top-left-radius:18px;border-top-right-radius:18px;">Add New</h2>
    <br>
    
    <div class="inputM">
    <div class="name">
     <lable>姓名：</lable>
     <input id="input" type="text" value="<%=((UserLogin)session.getAttribute("userInfo")).getLoginName() %>" style="width: 500px;height:40px; "/>
    </div>
     <br>
    <div class="biaoti">
    <lable>标题：</lable>
    <input id="input" type="text" name="txtTitle" style="width: 500px;height:40px; "/>
    </div>
     <br>
    <div class="neirong">
    <lable>内容：</lable><br>
   &nbsp;&nbsp;&nbsp;&nbsp; 
   <textarea id="input" cols="60" rows="5" name="txtContent" style="width: 500px; "></textarea>
    </div>
     <br>
    <div class="shijain">
    <lable>时间：</lable>
   <input id="input" type="text" name="txtDate" style="width: 500px; height:40px;"/>
    </div>
     <br><br>
    <div>
    <input type="submit" class="submit" value="提 交" style="width: 570px; height: 48px;font-size:20px;"/>
    </div>
 </div>
 </div>
    
    
    </form>
 
 </div>
 
 </div>
 
 
 

</BODY>
</html>
