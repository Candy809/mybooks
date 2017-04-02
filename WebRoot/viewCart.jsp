<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:directive.page import="java.util.HashMap"/>
<jsp:directive.page import="java.util.Set"/>
<jsp:directive.page import="entity.CartItemBean"/>
<jsp:directive.page import="entity.BookBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewCart.jsp' starting page</title>
    
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



<CENTER>
<TABLE cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff 
background=images/top1bg.jpg border=0>
  <TBODY>
  <TR>
    <TD width=778>&nbsp;</TD></TR></TBODY></TABLE>
<TABLE class=center height=100 cellSpacing=0 cellPadding=0 width=778 
bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD align=middle width=150><IMG 
      title="" height=100 
      src="images/logo.jpg" width=100 border=0></TD>
    <TD width=58>&nbsp;</TD>
    <TD vAlign=top width=110><IMG
      height=90 src="images/top1.jpg" width=70 border=0></TD>
    <TD vAlign=top width=110><IMG 
      height=90 src="images/top2.jpg" width=70 border=0></TD>
    <TD vAlign=top width=110><IMG 
       height=90 src="images/top3.jpg" width=70 
      border=0></TD>
    <TD vAlign=top width=110><IMG 
      height=90 src="images/top4.jpg" width=70 border=0></TD>
    <TD width=130>
     </TD></TR></TBODY></TABLE>

<TABLE class=center cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff 
border=0>
  <TBODY><TR>
    <TD style="FONT-SIZE: 1px" bgColor=#b0b0b0 colSpan=19 
  height=1></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TD style="FONT-SIZE: 1px" bgColor=#dcdcdc height=3></TD></TR>
  <TR>
    <TD align=right background=images/bn01.jpg height=120>&nbsp;</TD>
  </TR></TBODY></TABLE>

<TABLE height=15 cellSpacing=0 cellPadding=0 width=778 border=0>
  <TBODY>
  <TR>
    <TD style="FONT-SIZE: 10px; LINE-HEIGHT: 10px" 
    background=../images/bnbg1.gif height=15></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff border=0 height="357">
  <TBODY>
  <TR>
    <TD vAlign=top width=168 height=400>
      <TABLE class=center height="100%" cellSpacing=0 cellPadding=0 width=168 
      bgColor=#ffffff background=images/leftbg.gif border=0>
        <TBODY>
       
        <TR>
          <TD class=lefttd vAlign=top align=middle><BR>
            </TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top align=middle width=610>
      <TABLE cellSpacing=0 cellPadding=0 width="98%" 
      background=/store./images/top01.gif border=0>
        <TBODY>
        <TR>
          <TD align=left height=25><IMG height=11 src="images/icon1.gif" 
            width=31>　购物车内商品：</TD></TR></TBODY></TABLE><BR>
      <TABLE style="TEXT-ALIGN: center" cellSpacing=0 cellPadding=0 width=590 
      border=0>
        <TBODY>


<!--   显示内容开始  -->



<%-- start scriptlet to display shopping cart contents --%>

<%-- end scriptlet for literal XHTML output --%>

   <table cellSpacing=0 cellPadding=0 width=590 border=1>
      <thead><tr align="center">
         <th>书籍名称</th>
         <th>数量</th>
         <th>价格</th>
         <th>小计</th>
      </tr></thead>
		<%
			HashMap cart=(HashMap)session.getAttribute("cart");
			Set keys=cart.keySet();
			Object[] isbn=keys.toArray();
			CartItemBean cartItem;
			double total=0;
			for(int i=0;i<isbn.length;i++){
				cartItem=(CartItemBean)cart.get(isbn[i]);
				BookBean book=cartItem.getBook();
				int quantity=cartItem.getQuantity();
				double price=book.getPrice();
				double subtotal=price*quantity;
				total+=subtotal;
		 %>

         <tr>
            <td><%=book.getTitle() %></td>

            <td align="center"><%=cartItem.getQuantity() %></td>

            <td class = "right">
               <%=book.getPrice() %>
            </td>

            <td class = "bold right">
               <%=subtotal %>
            </td>
         </tr>
	<%} %>
        <tr>
         <td colspan = "4" class = "bold right"><b>总计：<%=total %>  </b>
            
         </td>
      </tr>
   </table> <p class = "bold green">
      <a href = "books.jsp">继续购物</a>
   </p>

   <form method = "get" action = "order.jsp">
      <p><input type = "submit" value = "结 账" /></p>
   </form>

<!--   显示内容结束  -->
				 </TBODY>
				 </TABLE>
      <BR></TD></TR></TBODY></TABLE>
<TABLE class=center cellSpacing=0 cellPadding=0 width=778 bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD align=middle background=images/bk.gif height=50>
    </TD></TR></TBODY></TABLE>

</CENTER></BODY>
</html>
