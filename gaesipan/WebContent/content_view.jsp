<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="modify_view.do" method="post">
			<input type="hidden" name="seq" value="${content_view.seq}">
			<input type="hidden" name="modify" value="modify">
			<tr>
				<td> 번호 </td>
				<td> ${content_view.seq} </td>
			</tr>
			<tr>
				<td> 히트 </td>
				<td> ${content_view.hit} </td>
			</tr>
			<tr>
				<td> 이름 </td>
				<td> ${content_view.author}</td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> ${content_view.title}</td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td>${content_view.contents}</td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="수정"> &nbsp;&nbsp; <a href="list.do">목록보기</a> &nbsp;&nbsp; <a href="delete.do?seq=${content_view.seq}">삭제</a></td>
			</tr>
		</form>
	</table>
	
</body>
</html>