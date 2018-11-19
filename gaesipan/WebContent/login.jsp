<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<form action="#" method="post">
			아이디와 비밀번호를 입력하십시오<hr/>
			<table border="1">
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="id" value=""/></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pw" value=""/></td>
				</tr>
				<!-- <tr>
					<td colspan="2" align="right"><input type=checkbox name="g_box1" checked="checked">id/pw저장 </td>
				</tr> -->
				 <td colspan="2" align="right">
					<input type=checkBox name="chek" value="on">id/pw 저장
					<input type=hidden name="chek" value="off">
					</td>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인" />
					</td>
				</tr>
			</table>
		</form>	
		<a href="sign_in.jsp">회원가입</a>
</body>
</html>