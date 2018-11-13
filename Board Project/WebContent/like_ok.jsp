<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
    <%
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	Connection conn;
	
	try {
		
		conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT `LIKE` FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
				
				int like = rs.getInt(1);
				
				like++;	
				
				
	sql = "UPDATE board SET `LIKE`=" + like + " where NUM=" +idx;  //조회수가 올라가는 부분
 	stmt.executeUpdate(sql);
 		stmt.close();
		conn.close();
		rs.close();
	 	}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
%>

<script language="javascript">
	location.href="view.jsp?idx=<%=idx%>";
	alert("좋아요를 누르셨습니다.");

</script>

    
  