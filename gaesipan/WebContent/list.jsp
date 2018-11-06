<%@page import="gaesipanDAO.gDAO"%>
<%@page import="gaesipanDTO.gDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		<tr>
			<td colspan="6"> <a href="write_view.do">글작성</a> </td>
		</tr>
	</table>
	
</body>
</html>