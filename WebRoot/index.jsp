<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
  <script>
function mfk()
{
   if(shang.style.display=='none')
    {
     shang.style.display='';
    }
   else
   {
     shang.style.display='none';
   }
}
</script>
  
  
  <body scroll=no topmargin="0" leftmargin="0">
		<table width="100%" height="100%" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td id='shang' width="162" height="100%">
					<iframe frameBorder="0" id="left" name="left" src="left.jsp"
						height="100%" width="162" target="main">
					</iframe>
				</td>
				<td align="center" class="unnamed1" onClick="mfk();" height="100%">
					<table width="100%" height="100%" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td bgcolor="#3A5F94">
								<font color="#FFFFFF">点此切换</font>
							</td>
						</tr>
					</table>
				</td>
				<td width="100%" height="100%">
					<iframe frameBorder="0" id="main" name="main" scrolling="yes"
						src="right.jsp" height="100%" width="100%"></iframe>
				</td>
			</tr>
		</table>
	</body>
</html>
