<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input[type=submit] {
		margin-top: 15px;
		float: right;
		margin-right: 50px;
	}
	div{
		width: 400px;
		margin: 0 auto;
		text-align: center;
	}
	
</style>
</head>
<body>

<div>
<h2>입력하여 표만들기</h2>
<form method="post" action="formTestTo.jsp">
	반복할 숫자입력 : <input type="text" name="num"><br>
	<input type="submit" value="입력완료">
</form>
</div>
</body>
</html>