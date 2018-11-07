<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
 <%
 	session.setAttribute("ID",request.getParameter("id")); 

	session.setAttribute("PW",request.getParameter("pw")); 
 %>
<%
	String val = request.getParameter("chek");
if(val.equals("on")){
	session.setMaxInactiveInterval(300);
}else if(val.equals("off")){
	session.setMaxInactiveInterval(0);
	session.removeAttribute("ID");
}
%>

</head>
<body>

 
<table border="1">
 	<tr>
 		<td><%=request.getParameter("id") %>님 로그인을 환영합니다.</td>
 	</tr>
 	<tr>
 		<td>
 			<form action="Logout.jsp" method="post">
 				<input type="submit" value="로그아웃">
 			</form>
 		</td>
 	</tr> 
 </table>
</body>
</html>