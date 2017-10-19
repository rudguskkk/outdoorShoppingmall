<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.CartDBBean" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록의 수량을 변경</title>
<link href="../etc/style_1.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
	String cart_id = request.getParameter("cart_id");
	String buy_count = request.getParameter("buy_count");
	String book_kind = request.getParameter("book_kind");
	
	if(session.getAttribute("id")==null){
		response.sendRedirect("shopMain.jsp");
	} else {
%>
	<form method="post" name="updateform" action="updateCart.jsp">
		변경할 수량 : 
		<input type="text" name="buy_count" size="5" value="<%=buy_count %>">
		<input type="hidden" name="cart_id" value="<%=cart_id %>">
		<input type="hidden" name="book_kind" value="<%=book_kind %>">
		<input type="submit" value="변경">
	</form>
</body>
</html>
<%}%>