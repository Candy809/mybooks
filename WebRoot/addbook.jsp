<%@ page language="java" import="dao.*,entity.*,java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addbook.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="left.files/style_admin.css">

<script type="text/javascript">
		function fun_check_form(){
			if(document.form1.serialNumber.value==""){
				alert("请输入商品编号（系列）信息信息。");
				return false;
			}else if(document.form1.name.value==""){
				alert("请输入商品名称。");
				return false;
			}else if(document.form1.brand.value==""){
				alert("请输入商品商标。");
				return false;
			}else if(document.form1.model.value==""){
				alert("请输入商品型号。");
				return false;
			}else if(document.form1.price.value==""){
				alert("请输入商品价格。");
				return false;
				if(!isNaN(document.form1.price.value)){
					alert("");
					return false;
				}
			}else{
				return true;
			}
		}
		
		
		 function   checkIsFloat(){  
          var   nc=event.keyCode;            
          if(nc < 48 || nc > 57 ){         
          		if(nc==46){  
              		var s=document.form1.price.value;  
              		for(var   i=0;i<s.length;i++){  
                 		 if(s.charAt(i)=='.'){  
                      		 event.keyCode=0;   
                      		 return;  
                  		}  
              		}  
          		}else{  
             		 event.keyCode=0;return;  
          
      			}
      		}
      }  
		</script>
</head>

<body>
<form action="UpLoadBookImageServlet" method="post" enctype="multipart/form-data" >
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder"
	id="table3">
	
	 <tr>
			   <td>上传图片</td>
			   <td><input type="file" name="f"> </td>
	        </tr>	
	        <tr>
			   <td><input type="submit" value="上传" ></td>
			   <td></td>
			</tr>
</table></form>
<form name="form1" action="AddBookManage" method="post"
	onSubmit="return fun_check_form()">
<table cellspacing="1" cellpadding="4" width="100%" class="tableborder"
	id="table3">

	<input type="hidden" name="action" value="save">
	<tr>
		<td colspan="12" class="header">添加图书信息</td>
	</tr>
	<tr>
		<td class="altbg1">图书名称：</td>
		<td class="altbg2" colspan="11"><input type="text"
			name="title" size="34"></td>
	</tr>
	<tr>
		<td class="altbg1">图书作者：</td>
		<td class="altbg2" colspan="11"><input type="text" name="author"
			size="34"></td>
	</tr>
	<tr>
		<td class="altbg1">图书编号：</td>
		<td class="altbg2" colspan="11"><input type="text" name="isbn"
			size="34"></td>
	</tr>
	<tr>
		<td class="altbg1">出版日期：</td>
		<td class="altbg2" colspan="11"><input type="text" name="copyright"
			size="34"></td>
	</tr>
	<tr>
		<td class="altbg1">图书价格：</td>
		<td class="altbg2" colspan="11"><input type="text" name="price"
			size="34" onkeypress="checkIsFloat();" /></td>
	</tr>
	
	<tr>
		<td class="altbg1">书出版商：</td>
		<td class="altbg2" colspan="20">
		
		<select name="cbPublisher">
		<%
			PublisherOperation po=new PublisherOperation();
			Publishers p=new Publishers();
			List list=po.getAllPublisher();
			for(int i=0;i<list.size();i++){
				p=(Publishers)list.get(i);
				%>
				
			<option value="<%=p.getPublisherId() %>"><%=p.getPublisherName() %></option>
			<%
			}
		 %>
		</select>
</td>
	</tr>
	<tr>
		<td class="altbg1">图书介绍：</td>
		<td class="altbg2" colspan="11"><textarea rows="5" cols="60"
			name="description"></textarea></td>
	</tr>


	<tr>
		<td class="altbg1"></td>
		<td class="altbg2" colspan="11"><input type="submit" value="提交"
			name="B1" /> &nbsp; <input type="reset" value="重置" name="B2" /></td>
	</tr>

</table>
</form>
</body>

</html>
