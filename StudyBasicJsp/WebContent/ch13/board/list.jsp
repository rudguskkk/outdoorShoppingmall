<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDBBean"%>
<%@ page import="ch13.board.BoardDataBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link href="../etc/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body bgcolor="<%=bodyback_c %>">
<%!
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null) {
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum); //현재 페이지 번호
	int startRow = (currentPage - 1) * pageSize + 1; // 현재 페이지의 시작 번호
	int endRow = currentPage * pageSize;  			//현재 페이지의 끝 번호
	int count = 0;
	int number = 0;
	List<BoardDataBean> articleList = null;
	
	BoardDBBean dbPro = BoardDBBean.getInstance();
	count = dbPro.getArticleCount();
	
	if(count > 0) {
		articleList = dbPro.getArticles(startRow, endRow);
	}
	
	number = count - (currentPage-1) * pageSize;
%>
<p class="top_text" style="color:#fff;">아웃도어 상품 리뷰 게시판</p>
<table class="table_text_t">
	<tr>
		<td align="right" bgcolor="<%=value_c %>" class="top_text">
			<p class="p_count">글목록(전체 글 : <%=count %>)</p>
			<a href="writeForm.jsp">글쓰기</a>
		</td>
	</tr>
</table>

<% if(count == 0 ) { %>
	<table>
		<tr>
			<td align="center">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>
<%} else { %>
	<table>
		<tr height="30" bgcolor="<%=value_c%>">
			<td align="center" width="50">번 호</td>
			<td align="center" width="250">제 목</td>
			<td align="center" width="100" class="ta_center">작성자</td>
			<td align="center" width="150">작성일</td>
			<td align="center" width="50">조 회</td>
			<td align="center" width="100">IP</td>
		</tr>
<%
	for(int i=0; i < articleList.size(); i++) {
		BoardDataBean article = articleList.get(i);
	
%>
	<tr height="30">
		<td width="50" height="45"><%=number-- %></td>
		<td width="250" align="left">
<%
	int wid=0;
	if(article.getRe_level()>0){
		wid=5*(article.getRe_level());

%>
	<img src="../images/level.png" width="<%=wid %>" height="16">
	<img src="../images/re.png">
	
<%} else { %>
	<img src="../images/level.png" width="<%=wid %>" height="16">
<%} %>

<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
	<%=article.getSubject() %></a>
	
<%if(article.getReadcount()>=20){ %>
	<img src="../images/hot.png" border="0" height="16"><%} %></td>
	<td width="100" align=left>
		<a href="mailto:<%=article.getEmail() %>">
		<%=article.getWriter() %></a></td>
	<td width="150"><%=sdf.format(article.getReg_date())%></td>
	<td width="50"><%=article.getReadcount() %></td>
	<td width="100"><%=article.getIp() %></td>
</tr>
<%} %>

</table>
<%} %>
<%
	if(count > 0) {
		int pageCount = count/pageSize + (count%pageSize == 0?0:1);
			int startPage = 1;
			
			if(currentPage % 10 != 0) {
				startPage = (int)(currentPage/10)*10 + 1;
			} else {
				startPage = ((int)(currentPage/10)-1)*10 + 1;
			}
		
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		if(startPage > 10) {%>
			<b><a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a></b>
<% 		}

		for(int i = startPage; i <= endPage; i++){ %>
			<b><a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a></b>
<%		} 

		if(endPage < pageCount) {%>
			<b><a href="list.jsp?pageNum=<%=startPage + 10%>">[다음]</a></b>
<%
		}
	}
%>

</body>
</html>