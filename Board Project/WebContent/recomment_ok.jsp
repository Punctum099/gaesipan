<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String content = request.getParameter("content");
	
	
	content = content.replace(" ", "&nbsp;");
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;
		int b_idx = 0;
		int max=0;
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));

		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM comment"; 
		ResultSet rs = stmt.executeQuery(sql); 
		
		if(rs.next()){ 
			max=rs.getInt(1); 
			} 
		
		
		sql = "SELECT REF, INDENT, STEP, b_idx FROM comment WHERE NUM=" + c_idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
			b_idx = rs.getInt(4);
		}
		
	sql = "UPDATE comment SET STEP=STEP+1 where REF="+ref+" and STEP>" +step; 
	stmt.executeUpdate(sql);
	
	sql = "INSERT INTO comment"+
			"(USERNAME, PASSWORD, CONTENT,TIME, REF, INDENT, STEP, b_idx, c_idx)"+
			" values(?,?,?,now(),?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, content);
		pstmt.setInt(4, ref);
		pstmt.setInt(5, indent+1);
		pstmt.setInt(6, step+1);
		pstmt.setInt(7, b_idx);
		pstmt.setInt(8, max+1);
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		e.printStackTrace();
	} 

%>

		<script language=javascript> 
			self.window.alert("입력한 글을 저장하였습니다.");
			self.close();  
			opener.parent.location.reload();
		</script>
