<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String managerId="";
	try{
		managerId = (String)session.getAttribute("managerId");
		
		if(managerId==null || managerId.equals("")) {
			response.sendRedirect("logon/managerLoginForm.jsp");
		} else {
%>
<form method="post" action="logon/managerLogout.jsp">
	<b>관리작업중..</b> <input type="submit" value="로그아웃">
</form><br>

<table>
	<tr>
		<td align="center" bgcolor="<%=bar %>">상품관련 작업</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookRegisterForm.jsp">상품등록</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=all">상품수정/삭제</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=100">문학등록 도서목록</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=200">외국어등록 도서목록</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=300">컴퓨터등록 도서목록</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=400">레시피등록 도서목록</a>
		</td>
	</tr>
	<tr>
		<td>
			<a href="productProcess/bookList.jsp?book_kind=500">여행등록 도서목록</a>
		</td>
	</tr>
</table><br><br>
<table>
	<tr>
		<td align="center" bgcolor="<%=bar%>">
			구매된 상품관련 작업
		</td>
	</tr>
	<tr>
		<td>
			<a href="orderedProduct/orderedList.jsp">전체구매목록 확인</a>
		</td>
	</tr>
</table>
</body>
</html>
<% 
		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>