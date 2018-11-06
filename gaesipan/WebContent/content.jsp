<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%!
		Connection connection;
		Statement statement;
		ResultSet resultSet;
	
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC";
		String upw = "tjddlr320";
		String query = "select * FROM bored";
	%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	try{
		
		Class.forName(driver);	//com.mysql.jdbc.Driver
		connection = DriverManager.getConnection(url, "root", upw);	//jdbc:mysql://localhost:3306/gaesipan?characterEncoding=UTF-8&serverTimezone=UTC
		statement = connection.createStatement();
		resultSet = statement.executeQuery(query);	//select * from bored
		
		while(resultSet.next()){
			int siq = resultSet.getInt("siq");
			String title = resultSet.getString("title");
			String contents = resultSet.getString("contents");
			String author = resultSet.getString("author");
			int hit = resultSet.getInt("hit");
			String time = resultSet.getString("time");
			String UPtime = resultSet.getString("UPtime");
			String see = resultSet.getString("see");
	%>
	
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>조회수</td>
			<td>게시 시간</td>
			<td>최근 수정 시간</td>
		</tr>
		<tr>
			<td><%= siq %></td>
			<td><%= title %></td>
			<td><%= author %></td>
			<td><%= hit %></td>
			<td><%= time %></td>
			<td><%= UPtime %></td>
		</tr>
	</table>
	
	

	<%
	}
		
	} catch(Exception e) {
		} finally {
			try{
				if(resultSet != null) resultSet.close();
				if(statement != null) statement.close();
				if(connection != null) connection.close();
			} catch(Exception e){}
		}
	%>
</body>
</html>