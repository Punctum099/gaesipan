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
			<td>��ȣ</td>
			<td>����</td>
			<td>�۾���</td>
			<td>��ȸ��</td>
			<td>�Խ� �ð�</td>
			<td>�ֱ� ���� �ð�</td>
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
		        	<td colspan=6>���� �����ϴ�.</td>
		        </tr>
		    </c:otherwise>
		</c:choose>

		<tr>
			<td colspan="6"> <a href="write_view.do">���ۼ�</a> </td>
		</tr>
	</table>
	
		<%
			if(startPage != 1){
		%>
			<a href="list.do?pageNumber=<%= startPage - 1%>&option=<%=option%>&search=<%=search%>">��</a>
		<%
			}else{
		%>
			��
		<%
			}
			for(int i = startPage; i <= endPage; i++){
		%>
			<a href="list.do?pageNumber=<%= i%>&option=<%=option%>&search=<%=search%>"><%= i %></a>
		<%
			}
		if(targetPage + Integer.parseInt(pageNumber) > startPage + 9){
		%>
			<a href="list.do?pageNumber=<%= startPage + 10%>&option=<%=option%>&search=<%=search%>">��</a>
		<%
			}else{
		%>
			��
		<%
			}
		%>
		
		<form method="GET" action="list.do">
      		<SELECT name="option">
		        <OPTION value='author'>�̸�</OPTION>
		        <OPTION value='title'>����</OPTION>
		        <OPTION value='contents'>����</OPTION>
		        <OPTION value='title_content'>����+����</OPTION>
		    </SELECT>
		    <input type="text" name="search" value="" placeholder="Ư�����ڴ� ����Ҽ� �����ϴ�.">
		    <button type='submit'>�˻�</button>    
		</form>
	
	<table  cellpadding="3" border="0">
		<form action="logined.jsp" method="post">
			<tr>
				<td>���̵� <input type="text" name="ID" size = "15"></td>
				<td rowspan="2"><input type="submit" value="�α���"></td>
			</tr>
			<tr>
				<td>��й�ȣ <input type="text" name="password" size = "15"></td>
			</tr>
		</form>
		<tr>
			<td><a href="#">ȸ������</a></td>
			<td><a href="#">���̵𡤺�й�ȣ ã��</a></td>
		</tr>
	</table>
	
</body>
</html>