<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="gaesipanDTO.gDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify.do" method="post">
			<input type="hidden" name="seq" value="${content_view.seq}">
			<tr>
				<td> ��ȣ </td>
				<td> ${content_view.seq} </td>
			</tr>
			<tr>
				<td> ��Ʈ </td>
				<td> ${content_view.hit} </td>
			</tr>
			<tr>
				<td> �̸� </td>
				<td>${content_view.author}</td>
			</tr>
			<tr>
				<td> ���� </td>
				<td> <input type="text" name=title value="${content_view.title}"></td>
			</tr>
			<tr>
				<td> ���� </td>
				<td> <textarea rows="10" name="contents" >${content_view.contents}</textarea></td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="����"> &nbsp;&nbsp; <a href="list.do">��Ϻ���</a> &nbsp;&nbsp; <a href="delete.do?seq=${content_view.seq}">����</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>