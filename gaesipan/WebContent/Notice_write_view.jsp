<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({dateFormat : "yy/mm/dd"});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="Notice_write.do" method="post">
			<tr>
				<td> 이름 </td>
				<td> <input type="text" name="author" size = "50"> </td>
			</tr>
			<tr>
				<td> 제목 </td>
				<td> <input type="text" name="title" size = "50"> </td>
			</tr>
			<tr>
				<td> 게시 제한일 </td>
				<td> <input type="text" name="MTtime" class="datepicker"> </td>
			</tr>
			<tr>
				<td> 내용 </td>
				<td> <textarea name="contents" rows="10" ></textarea> </td>
			</tr>
			<tr >
				<td colspan="2"> <input type="submit" value="입력"> &nbsp;&nbsp; 
				<a href="NoticeList.do">목록보기</a> &nbsp;&nbsp; 
				<input type="hidden" name="listType" value="Notice"></td>
			</tr>
		</form>
	</table>
</body>
</html>