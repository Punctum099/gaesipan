<%@page import="javafx.beans.property.SetProperty"%>
<%@page import="gaesipanDAO.gDAO"%>
<%@page import="gaesipanDTO.gDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	gDAO gDAO = new gDAO();
	String pageNumber = "1";
	String option = "";
	String search = "";
	if(request.getParameter("pageNumber") != null){
		pageNumber = request.getParameter("pageNumber");
	}
	if(request.getParameter("option") != null){
		option = request.getParameter("option");
	}
	if(request.getParameter("search") != null){
		search = request.getParameter("search");
	}
	try{
		Integer.parseInt(pageNumber);
	}catch (Exception e){
		response.sendRedirect("list.do");
	}
	
	int targetPage = gDAO.targetPage(pageNumber);
	int totalCount = gDAO.totalCount(option, search);
	System.out.println(totalCount);
	int pageSize = 20;
	int totalPage = totalCount / pageSize;
	if (totalCount % pageSize > 0) {
	    totalPage++;
	}
	if (totalPage < Integer.parseInt(pageNumber)) {
		pageNumber = String.valueOf(totalPage);
	}
	int startPage = (Integer.parseInt(pageNumber) / 11) * 10 + 1;
	int endPage = startPage + 9;
	if (endPage > totalPage) {
	    endPage = totalPage;
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<table cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>조회수</td>
			<td>게시 시간</td>
			<td>최근 수정 시간</td>
		</tr>
		<c:choose>
		    <c:when test="${list != NULL}">
				<c:forEach items="${list}" var="dto">
				<tr>
					<td>${dto.seq}</td>
					<td><a href ="content_view.do?seq=${dto.seq}">${dto.title}</a></td>
					<td>${dto.author}</td>
					<td>${dto.hit}</td>
					<td>${dto.time}</td>
					<td>${dto.UPtime}</td>
				</tr>
				</c:forEach>
		    </c:when>
		    <c:otherwise>
		        <tr>
		        	<td colspan=6>글이 없습니다.</td>
		        </tr>
		    </c:otherwise>
		</c:choose>

		<tr>
			<td colspan="6"> <a href="write_view.do">글작성</a> </td>
		</tr>
	</table>
	
		<%
			if(startPage != 1){
		%>
			<a href="list.do?pageNumber=<%= startPage - 1%>&option=<%=option%>&search=<%=search%>">◀</a>
		<%
			}else{
		%>
			◁
		<%
			}
			for(int i = startPage; i <= endPage; i++){
		%>
			<a href="list.do?pageNumber=<%= i%>&option=<%=option%>&search=<%=search%>"><%= i %></a>
		<%
			}
		if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
		%>
			<a href="list.do?pageNumber=<%= startPage + 10%>&option=<%=option%>&search=<%=search%>">▶</a>
		<%
			}else{
		%>
			▷
		<%
			}
		%>
		
		<form method="GET" action="list.do">
      		<SELECT name="option">
		        <OPTION value='author'>이름</OPTION>
		        <OPTION value='title'>제목</OPTION>
		        <OPTION value='contents'>내용</OPTION>
		        <OPTION value='title_content'>제목+내용</OPTION>
		    </SELECT>
		    <input type="text" name="search" value="" placeholder="특수문자는 사용할수 없습니다.">
		    <button type='submit'>검색</button>    
		</form>
	
	<table  cellpadding="3" border="0">
		<form action="logined.jsp" method="post">
			<tr>
				<td>아이디 <input type="text" name="ID" size = "15"></td>
				<td rowspan="2"><input type="submit" value="로그인"></td>
			</tr>
			<tr>
				<td>비밀번호 <input type="text" name="password" size = "15"></td>
			</tr>
		</form>
		<tr>
			<td><a href="#">회원가입</a></td>
			<td><a href="#">아이디·비밀번호 찾기</a></td>
		</tr>
	</table>
	
</body>
</html>