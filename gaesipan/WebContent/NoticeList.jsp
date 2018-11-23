<%@page import="javafx.beans.property.SetProperty"%>
<%@page import="gaesipanDAO.bDAO"%>
<%@page import="gaesipanDTO.bDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	bDAO bDAO = new bDAO();
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
	
	int targetPage = bDAO.targetPage(pageNumber, option, search); //남은 페이지의 개수를 구함
	int totalCount = bDAO.totalCount(option, search);
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<td>게시 유지일</td>
				<td>표시 여부</td>
			</tr>
			<c:choose>
			    <c:when test="${list != NULL and list != '' and not empty list}">
					<c:forEach items="${list}" var="dto">
						<c:if test="${dto.listType == 'Notice'}">
							<form action="apply.do" method="POST">
								<tr>
									<td>${dto.seq}</td>
									<td><a href ="content_view.do?seq=${dto.seq}">${dto.title}</a></td>
									<td>${dto.author}</td>
									<td>${dto.hit}</td>
									<td>${dto.time}</td>
									<td>${dto.UPtime}</td>
									<td>${dto.MTtime}</td>
									<td><input type="checkbox" name="see" value="Y" <c:if test="${dto.see == 'Y'}">checked</c:if>>
									<input type="submit" value="표시 여부 적용">
									<input type="hidden" name="see" value="N">
									<input type="hidden" value="${dto.seq}" name="seq"></td>
								</tr>
							</form>
						</c:if>
					</c:forEach>
			    </c:when>
			    <c:otherwise>
			        <tr>
			        	<td colspan=8>공지사항이 없습니다.</td>
			        </tr>
			    </c:otherwise>
			</c:choose>
			<tr>
				<td colspan="8"> <a href="Notice_write_view.do">공지사항 작성</a> </td>
			</tr>
		</table>
	
		<%
			if(startPage != 1){
		%>
			<a href="list.do?pageNumber=1&option=<%=option%>&search=<%=search%>">◀◀</a>
			<a href="list.do?pageNumber=<%= startPage - 1%>&option=<%=option%>&search=<%=search%>">◀</a>
		<%
			}else{
		%>
			◁◁&nbsp;◁
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
			<a href="list.do?pageNumber=<%= totalPage%>&option=<%=option%>&search=<%=search%>">▶▶</a>
		<%
			}else{
		%>
			▷&nbsp;▷▷
		<%
			}
		%>
		
		<form method="GET" action="list.do">
      		<SELECT name="option">
		        <OPTION value='title' <%if(option.equals("title") || option.equals("") || option == null){%>selected="selected"<%}%>>제목</OPTION>
		        <OPTION value='contents' <%if(option.equals("contents")){%>selected="selected"<%}%>>내용</OPTION>
		        <OPTION value='author' <%if(option.equals("author")){%>selected="selected"<%}%>>이름</OPTION>
		        <OPTION value='title_content' <%if(option.equals("title_content")){%>selected="selected"<%}%>>제목+내용</OPTION>
		    </SELECT>
			<input type="text" name="search" value="<%=search %>" placeholder="특수문자는 사용할수 없습니다.">
		    <button type='submit'>검색</button>    
		</form>
	<a href="list.do">처음으로</a>
	
</body>
</html>