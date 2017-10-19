<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 수정</title>
<link href="../etc/style_1.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<%
String buyer = (String)session.getAttribute("id");
String accountList = request.getParameter("accountList");

if(buyer == null) {
	response.sendRedirect("shopMain.jsp");
} else {
%>
<h3><%=buyer %> 님의 계좌수정</h3>

<form method="post" action="updateAccountPro.jsp">
	<table>
		<tr>
			<td width="100">결제계좌</td>
			<td width="200" name="accountList"><%=accountList %>
			<input type="hidden" name="accountList" value="<%=accountList %>">
			</td>
		</tr>
		<tr>
			<td width="100">수정 계좌번호</td>
			<td width="200">
				<input type="text" name="update_account">
			</td>
		</tr>
		<tr>
			<td width="100">수정 계좌은행</td>
			<td width="200">
				<input type="text" name="update_bank">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="확인">
				<input type="button" value="취소"
				onclick="javascript:window.location='buyForm.jsp'">
			</td>
		</tr>
	</table>
</form>

<%} %>
</body>
</html>