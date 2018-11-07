<%@ page language="java" contentType="text/html; charset=utf-8" %>

<html>
	<head>
		<title>session 내장객체를 이용한 로그인/로그아웃 구현</title>
	</head>
	<body>
		안전하게 로그아웃 되었습니다. 이용해주셔서 감사합니다.<hr/>
		다시 로그인 하시려면
		<%
			pageContext.include("/Login.jsp");
		%>
		<hr/>
		<form action="Login.jsp" method="post">
			<input type="submit" value="첫 화면으로" />
		</form>
	</body>
</html>