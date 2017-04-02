<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUsers.jsp' starting page</title>
    
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
		<form name="form1" action="AddUsersServlet" method="post">
			<table cellspacing="1" cellpadding="4" width="100%"
				class="tableborder" id="table3">

				<input type="hidden" name="action" value="save" />
				<tr>
					<td colspan="12" class="header">
						管理员-添加
					</td>
				</tr>
				<tr>
					<td class="altbg1">
						管理员名称：
					</td>
					<td class="altbg2" colspan="11">
						<input type="text" name="userName" size="34">
					</td>
				</tr>
				<tr>
					<td class="altbg1">
						密&nbsp; 码：
					</td>
					<td class="altbg2" colspan="11">
						<input type="password" name="password" size="34">
					</td>
				</tr>
				<tr>
					<td class="altbg1"> 
					<br></td>
					<td class="altbg2" colspan="11">
						<input type="submit" value="提交" name="B1">
						<input type="reset" value="重置" name="B2">
					</td>
				</tr>


				<tr>
					<td class="altbg1">
					<br></td>
					<td class="altbg2" colspan="11">
						&nbsp;&nbsp;&nbsp;
					</td>
				</tr>

			</table>
		</form>
	</body>

</html>
