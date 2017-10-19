<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin: 0 auto;
		margin-top: 50px;
	}
	table,tr,td,th{
		border:1px solid #333;
		text-align:center;
	}
	th{
		background-color: #eee;
		height: 30px;
	}
</style>
</head>
<body>
<table>
	<tr>
		<th width="130">글번호</th>
		<th width="130">글제목</th>
		<th width="130">글내용</th>
	</tr>
	
	<%int num = Integer.parseInt(request.getParameter("num"));
	
	for(int i = num; i > 0; i--){
		out.println("<tr>");
		out.println("<td>" + i + "</td>");
		out.println("<td>제목" + i + "</td>");
		out.println("<td>내용" + i + "</td>");
		out.println("</tr>");
	}
		
	%>
</table>
</body>
</html>