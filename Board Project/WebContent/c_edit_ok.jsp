<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	
	int c_idx = Integer.parseInt(request.getParameter("c_idx"));

	
	
	
	String password = request.getParameter("password");
	String content = request.getParameter("content");
 	
	
	content = content.replace("\r\n","<br>");
	content = content.replace(" ", "&nbsp;");
	
	String sql = "UPDATE comment SET CONTENT='" + content + "', PASSWORD='" + password + "' where NUM=" + c_idx;	
	stmt.executeUpdate(sql);

%>
		  <script language=javascript>
		  	self.window.alert("댓글이 수정되었습니다.");
		  	self.close();
		  	opener.parent.location.reload();
		  </script>
<%

	if(stmt!=null&&stmt.isClosed()==false)stmt.close();
	if(conn!=null&&conn.isClosed()==false)conn.close();
	
		
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>