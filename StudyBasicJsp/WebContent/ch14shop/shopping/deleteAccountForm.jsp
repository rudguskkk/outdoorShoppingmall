<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제계좌 삭제</title>
<link href="../etc/style_1.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");

if(buyer == null){
	response.sendRedirect("shopMain.jsp");
} else {
%>
<h3><%=buyer %>님의 계좌삭제</h3>
<form method="post" action="deleteAccountPro.jsp">
	<table>
		<tr>
			<td width="70">결제계좌</td>
			<td width="150"><%=accountList %></td>
			<input type="hidden" name="accountList" value="<%=accountList %>">
		</tr>
		<tr>
			<td width="80" align="center">비밀번호 확인</td>
			<td width="300" align="center">
				<input type="password" name="passwd">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="확인"> &nbsp;
				<input type="button" value="취소"
				onclick="javascript:window.location='buyForm.jsp'">
			</td>
		</tr>
	</table>
</form>
<%} %>
</body>
</html>