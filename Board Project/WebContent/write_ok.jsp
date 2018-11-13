<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String play = request.getParameter("play");
	
	
	content = content.replace("\r\n","<br>");
	content = content.replace(" ", "&nbsp;");
	int max = 0;
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass); 
		Statement stmt = conn.createStatement(); 
		String sql = "SELECT MAX(NUM) FROM board"; 
		ResultSet rs = stmt.executeQuery(sql); 
		
		if(rs.next()){ 
			max=rs.getInt(1); 
			} 
		sql = "INSERT INTO board(NAME,PASSWORD,TITLE,CONTENT,TIME,REF,PLAY) VALUES(?,?,?,?,now(),?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, name); 
		pstmt.setString(2, password);
		pstmt.setString(3, title); 
		pstmt.setString(4, content); 
		pstmt.setInt(5, max+1); 
		pstmt.setString(6, play);
		pstmt.execute();
		
		if(pstmt!=null&&pstmt.isClosed()==false)pstmt.close(); 
		if(stmt!=null&&stmt.isClosed()==false)stmt.close();
		if(conn!=null&&conn.isClosed()==false)conn.close();
		}
	catch(SQLException e) { 
		out.println( e.toString() ); 
		}

	
	
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 

</script>