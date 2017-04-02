<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
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
    width:1380px;
    height:650px;
	float: left;
	background:url(image/banner3.jpg);
	background-position:center;
	background-attachment:fixed;
	background-repeat:no repeat;
 
	}
.login{
    width:450px;
    height:450px;
	float: left;
	background-position:center;
	background-color:#2b2d41;
	margin-left:450px;
	margin-top:130px;
}
form {
	margin-top: 49px;
	margin-left: 58px;
	}
.input1 {
	 
	 outline: none;
    font-size: 15px;
	font-family:"微软雅黑";
    color: #fff;
    padding:  10px;
    margin: 0;
    width: 85%;
    border: none;
    border-bottom: 1px dashed #ccc;
    -webkit-appearance: none;
    margin-bottom: 2.5em;
    background: transparent;
	}
.input1:focus {
	 border-color: #d24747;
    border-bottom-style: double;

	}
	
 
input.checkbox {
    background: #2b2d41;
	cursor: pointer;
    width: 1.2em;
    height: 1.2em;
}
input.checkbox:before {
	content: "";
	position: absolute;
	width: 1.2em;
	height: 1.2em;
	background: inherit;
	cursor: pointer;
}
input.checkbox:after {
	content: "";
	transition: .4s ease-in-out;
	position: absolute;
	top: 0px;
	left: 0;
	z-index: 1;
	width: 1.2em;
	height: 1.2em;
	border: 1px solid #d24747; 
}
input.checkbox:checked:after {
	transform: rotate(-45deg);
	height: .5rem;
	border-color: #d24747;
	border-top-color: transparent;
	border-right-color: transparent;
}
.choose input.checkbox:checked:after {
	transform: rotate(-45deg);
	height: .5rem;
	border-color: transparent;
	border-right-color: transparent;
	animation: .4s rippling .4s ease;
	animation-fill-mode: forwards;
}
.choose p {
    display: inline-block;
    float: left;
}
 
.choose a {
    font-size: 1em;
    color: #fff;
	transition: 0.5s all;
	-webkit-transition: 0.5s all;
	-moz-transition: 0.5s all;
	-o-transition: 0.5s all;
	-ms-transition: 0.5s all;
}
.wthree-text ul li a:hover{ 
    color: #d24747;
}
.p {
	margin-left: 25px;
	margin-top: -18px;
	font-family:"微软雅黑";
	}
.submit {
	height: 47px;
	width: 155px;
	background-color: #d24747;
	color: white;
	font-family: "微软雅黑";
	font-size: 20px;
	border-color: #d24747;
	border-style:none;
	}
.head {
	color: #d24747;
	font-size: 40px;
	font-align: center;
	background-color: rgba(0, 0, 0, 0.2);
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 160px;
	font-family:"微软雅黑";
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
  
  
  <div class="content">
  
   <div class="login">
    <p class="head">REGIST</p>
    <form method="post" action="AddUser">
  
        <input type="text" name="txtName" class="input1" placeholder="用户名" required="" /><br>
    
      
        <input type="password" name="txtPass" class="input1" placeholder="密码" required="" /><br>
    
     <div class="choose"> 
					<input type="checkbox" class="checkbox" ><p class="p"><span style="color:white;">Remember me ? </span>  <span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;<a href="#">Forgot password?</a></span></p>
</div>  
        
		<br>	<br>	
      
         <input type="submit" class="submit" name="Submit" value="确定" />   &nbsp;
        <input type="reset" class="submit" name="Submit2" value="重 置" />
    
 
      </form>
      </div>
    </div>
  </body>
</html>
