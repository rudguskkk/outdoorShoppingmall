<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../../etc/style_1.css" rel="stylesheet" type="text/css">
<title>책삭제</title>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
	String managerId = "";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
			response.sendRedirect("../logon/managerLoginForm.jsp");
		} else {
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			String book_kind = request.getParameter("book_kind");
%>
<p>책삭제</p>
<br>
<form method="post" name="delForm" action="bookDeletePro.jsp?book_id=<%=book_id %>
&book_kind=<%=book_kind %>" onsubmit="return deleteSave()">
	<table class="delete_table">
		<tr>
			<td align="right" bgcolor="<%=value_c %>">
				<a href="../managerMain.jsp">관리자 메인으로</a> &nbsp;
				<a href="bookList.jsp?book_kind=<%=book_kind %>">목록으로</a>
			</td>
		</tr>
		
		<tr height="30">
			<td align="center" bgcolor="<%=value_c %>">
				<input type="submit" value="삭제">
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<%

		}
	} catch(Exception e){
		e.printStackTrace();
	}
%>