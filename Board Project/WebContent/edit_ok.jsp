<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			
<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
		try{
			
			request.setCharacterEncoding("utf-8");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String password = request.getParameter("password");
			String play = request.getParameter("play");
		
			
			content = content.replace("\r\n","<br>");  //엔터키를 <br>로 바꿔서 DB에 넣는다. (그래야 다시 출력될 때 엔터키가 먹은것 처럼 보임)
			content = content.replace(" ", "&nbsp;");
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
		
			
		
		 
				String sql = "UPDATE board SET TITLE='" + title+ "' ,CONTENT='"+ content +"', PASSWORD='"+ password +"', PLAY='"+ play +"' WHERE NUM=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="view.jsp?idx=<%=idx%>";
				  </script>
<%

		
	if(stmt!=null&&stmt.isClosed()==false)stmt.close();
	if(conn!=null&&conn.isClosed()==false)conn.close();	 
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 

%>