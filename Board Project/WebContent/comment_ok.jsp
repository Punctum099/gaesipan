<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver");
	
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	String name = request.getParameter("name").replaceAll("<","&lt;").replaceAll(">","&gt;");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	int b_idx = Integer.parseInt(request.getParameter("b_idx"));
	int max = 0;
	try {
		Connection conn = DriverManager.getConnection(url,id,pass); 
		Statement stmt = conn.createStatement(); 
		content = content.replace("\r\n","<br>");
		content = content.replace(" ", "&nbsp;");
		
		String sql = "SELECT MAX(NUM) FROM comment"; 
		ResultSet rs = stmt.executeQuery(sql); 
		
		if(rs.next()){ 
			max=rs.getInt(1); 
			} 
		
		sql = "INSERT INTO comment (USERNAME,PASSWORD,CONTENT,TIME,b_idx,REF,c_idx) VALUES(?,?,?,now(),?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, name); 
		pstmt.setString(2, password);
		pstmt.setString(3, content);
		pstmt.setInt(4, b_idx); 
		pstmt.setInt(5, max+1);
		pstmt.setInt(6, max+1);
		pstmt.execute();
		pstmt.close(); 
		stmt.close();
		conn.close();
		
	}catch(Exception e) { 
		e.printStackTrace(); 
	}

	
	
%>
  <script language=javascript>
   self.window.alert("입력한 댓글을 저장하였습니다.");
   location.href="view.jsp?idx=<%=b_idx%>"; 

</script>