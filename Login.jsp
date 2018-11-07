<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
	<head>

	</head>

	<body>
	<%
	if ( session.getAttribute("ID") == null ){
	%>
		<form action="Logined.jsp" method="post">
			아이디와 비밀번호를 입력하십시오<hr/>
			<table border="1">
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="id" /></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pw"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input type=checkBox name="chek" value="on">id/pw 저장
					<input type=hidden name="chek" value="off">
					</td>
				</tr>

				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인" />
					</td>
				</tr>
			</table>
		</form>	
	<%			
		} else {
	%>
		<form action="Logined.jsp" method="post">
			아이디와 비밀번호를 입력하십시오<hr/>
			<table border="1">
				<tr>
					<td align="center">아이디</td>
					<td><input type="text" name="id" value="<%= session.getAttribute("ID") %>"/></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pw" value="<%= session.getAttribute("PW") %>"/></td>
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
	<%
		}
	%>
	
	</body>
</html>