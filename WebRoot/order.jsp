<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="entity.*"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order.jsp' starting page</title>
    
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
 body {
 background:url(image/banner3.jpg);
	background-position:center;
	background-attachment:fixed;
 }
 
 .content {
 margin-top:-53px;
 margin-left:90px;
 background-color:rgba(254,254,254,1); 
 width:1170px;
 align:center;
 
 }
 
 /*-- tracking cart section --*/
section.shipment-w3ls p.text-center {
	font-size:16px;
	font-weight:normal;
	color:#999;
	line-height:30px;
	padding-bottom:50px;
}
.content-w3ls {
	width:100%;
	margin-top:-40px;
	height:260px;
	background-color:#F5F5F5;
}
.content1-w3ls {
	background-color:#33accc;
	text-align:center;
	padding:1.7em;
}
.content1-w3ls h2 {
	font-family: 'Exo 2', sans-serif;
	text-transform:uppercase;
	margin:0;
	color:#fff;
	font-size:20px;
	font-weight:bold;
}
.content2-w3ls {
	background-color:#b5e6ae;
}
.content2-header1 {
	float:left;
	width:27%;
	text-align:center;
	padding:1.5em;
}
.content2-header1 p {
	font-family: 'Open Sans', sans-serif;
	font-size:17px;
	font-weight:700;
	color:#33accc;
	margin:0;
}
.content2-header1 span {
	font-size:15px;
	font-weight:400;
}
.shipment {
	width:100%;
	margin:10% auto;
}
span.line {
    height: 5px;
    width: 90px;
    background-color:#F5998E;
    display: block;
    position: absolute;
    top: 35%;
    left: 45%;
}
.confirm{
	text-align:center;
	width:20%;
	position:relative;
	float:left;
	margin-left:5%;
}
.confirm .imgcircle , .process .imgcircle, .quality .imgcircle {
	background-color:#33accc;
}
.confirm span.line, .process span.line {
	background-color:#33accc; 
}
.content3-w3ls p {
	font-size:15px;
	font-weight:600;
	margin: 8% 0 0 -50%;
} 
.imgcircle {
	height:75px;
	width:75px;
	border-radius:50%;
	-webkit-border-radius:50%;
	-moz-border-radius:50%;
	-o-border-radius:50%;
	-ms-border-radius:50%;
	background-color:#F5998E;
	position:relative;
}
.imgcircle img {
	height:30px;
	position:absolute;
	top: 28%;
	left: 30%;
}
.process{
	position:relative;
	width:20%;
	text-align:center;
	float:left;
}
.quality {
	position:relative;
	width:20%;
	text-align:center;
	float:left;
}
.dispatch{
	position:relative;
	width:20%;
	text-align:center;
	float:left;
}
.delivery {
    position: relative;
    width: 15%;
    text-align: center;
    float: right;
    margin-right: 0;
}
.shipment {
margin-top:-60px;
margin-left:20px;

}
.shipment p{
margin-left:-160px;

}
/*-- /tracking cart section --*/

/*-- message --*/
p.text-center {
	font-size:16px;
	font-weight:normal;
	padding-bottom:70px;
	font-family:"微软雅黑";
	border:blue;
}
label.contact-p1 {
    font-size: 17px;
    font-weight: 300;
    color:#16214e;
    padding-bottom: 10px;
    font-family:"微软雅黑";
}
 
 
 
button{
	color: #ffffff;
    background-color: #33accc;
    border: 2px solid #33accc;
    font-size: 17px;
    padding: 10px 20px;
    width: 96%;
    margin-top:40px;
    margin-left:20px;
}
button:hover {
    color: #fff;
    background-color: #F5998E;
    border: 2px solid #F5998E;
}
.form-control {
width:552px;

}
input {
font-family:"微软雅黑";

}
.container {

background-color:rgba(254,254,254,0.9); 

 
}
.yidong {
padding-top:60px;
}
/*-- /message --*/
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
  

<!-- tracking section -->
<section class="shipment-w3ls">
	<div class="container" >
	
		<h3 class="text-center wthree w3-agileits agileits-w3layouts agile w3-agile" style="font-family:微软雅黑;">结账信息</h3>
		<p class="text-center wthree w3-agileits agileits-w3layouts agile w3-agile">填写个人信息，确认付款</p>
	</div>
	<div class="container">
		<div class="content-w3ls">	
			<div class="content1-w3ls">
				<h2 style="font-family:微软雅黑;">确认付款信息</h2>
			</div>
		
			<div class="content3-w3ls" style="height: 100px; ">
				<div class="shipment">
					<div class="confirm">
						<div class="imgcircle">
							<img src="image/confirm.png" alt="confirm order">
						</div>
						<span class="line"></span>
					<p>One</p>
					</div>
					<div class="process">
						<div class="imgcircle">
							<img src="image/process.png" alt="process order">
						</div>
						<span class="line"></span>
					<p>Two</p>
					</div>
					<div class="quality">
						<div class="imgcircle">
							<img src="image/quality.png" alt="quality check">
						</div>
						<span class="line"></span>
						<p>&nbsp;Three</p>
					</div>
					<div class="dispatch">
						<div class="imgcircle">
							<img src="image/dispatch.png" alt="dispatch product">
						</div>
						<span class="line"></span>
						<p>&nbsp;Four</p>
					</div>
					<div class="delivery">
						<div class="imgcircle">
							<img src="image/delivery.png" alt="delivery">
						</div>
					<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Five</p>
					</div>
					 
				</div>
			</div>
		</div>
	</div>	
</section>	
<!-- /tracking section -->
  
  
  
  
  <div class="content">
   
			
			

					<!--   显示内容开始  -->

				<form method="post" action="ProcessOrder">
					<div class="yidong">
					 <div class="col-lg-6 col-md-6 col-sm-6 contact-agile1">    
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">用户名:</label>
                            <input type="text" class="form-control" name="username" 
                            required data-validation-required-message="Please enter your name."
                            value="<%=((UserLogin)session.getAttribute("userInfo")).getLoginName() %>" 
                            style="border: 2px solid #33accc;"
                            />
                            <p class="help-block"></p>
                        </div>
                    </div>	
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">信用卡号:</label>
                            <input type="text" class="form-control" name="creditcard" 
                            required data-validation-required-message="Please enter your creditcard."
                            style="border: 2px solid #33accc;"
                            >
							<p class="help-block"></p>
						</div>
                    </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 contact-agile2">
                    <div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">邮编:</label>
                            <input type="text" class="form-control" name="zipcode"  
                            required data-validation-required-message="Please enter your zipcode."
                            style="border: 2px solid #33accc;"
                            >
							<p class="help-block"></p>
						</div>
                    </div>
					<div class="control-group form-group">
                        <div class="controls">
                            <label class="contact-p1">电话:</label>
                            <input type="text" class="form-control" name="phone" required data-validation-required-message="Please enter phone."
                            style="border: 2px solid #33accc;"
                            >
                            <p class="help-block"></p>
                        </div>
                    </div>
				</div>
					
					<button type="submit" style="font-family:微软雅黑;">提交</button>
					</div>
					</form>
					<br><br><br>
				</div>
  </body>
</html>
