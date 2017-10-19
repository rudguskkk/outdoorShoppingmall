<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch14.bookshop.shopping.BuyDataBean" %>
<%@ page import="ch14.bookshop.shopping.BuyDBBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="../../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
<link href="../../etc/style_1.css" rel="stylesheet" type="text/css">
<style>
	table{
		border-collapse:collapse;
	}
</style>
</head>
<body bgcolor="<%=bodyback_c%>">
<%
	String buyer = (String)session.getAttribute("id");
%>
<%
	List<BuyDataBean> buyLists =null;
	BuyDataBean buyList = null;
	int count = 0;
	
	BuyDBBean buyProcess = BuyDBBean.getInstance();
	count = buyProcess.getListCount();
	
	if(count == 0) {
%>
	<h3><b>주문목록</b></h3>
	<table>
		<tr>
			<td>구매목록이 없습니다.</td>
		</tr>
	</table>
	<a href="../managerMain.jsp">관리자메인으로</a>
<%
	} else {
		buyLists = buyProcess.getBuyList();
%>
	<h3><b>주문목록</b></h3>
	<a href="../managerMain.jsp">관리자 메인으로</a>
	<table border="1" class="order_table">
		<tr>
			<td>주문번호</td>
			<td>주문자</td>
			<td width="200">책이름</td>
			<td>주문가격</td>
			<td>주문수량</td>
			<td>주문일</td>
			<td>결제계좌</td>
			<td width="50">배송명</td>
			<td>배송지전화</td>
			<td>배송지주소</td>
			<td>배송상황</td>
		</tr>
	<%
		for(int i=0; i<buyLists.size();i++){
			buyList = (BuyDataBean)buyLists.get(i);
	%>
	<tr>
		<td><%=buyList.getBuy_id() %></td>
		<td><%=buyList.getBuyer() %></td>
		<td><%=buyList.getBook_title() %></td>
		<td><%=buyList.getBuy_price() %></td>
		<td><%=buyList.getBuy_count() %></td>
		<td><%=buyList.getBuy_date().toString() %></td>
		<td><%=buyList.getAccount() %></td>
		<td><%=buyList.getDeliveryName() %></td>
		<td><%=buyList.getDeliveryTel() %></td>
		<td><%=buyList.getDeliveryAddress() %></td>
		<td><%=buyList.getSanction() %></td>
	</tr>
	<%} %>
	</table>
	<%} %>
</body>
</html>