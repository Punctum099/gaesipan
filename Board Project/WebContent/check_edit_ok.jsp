<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	
	String passw = request.getParameter("password"); //check_edit 에서 적은 패스워드
	String password="";  //db에서 password를 꺼내서 넣을 변수
	String sql = "SELECT PASSWORD FROM board WHERE NUM=" + idx;  //몇 번째 글의 비밀번호를 가져올지
	ResultSet rs = stmt.executeQuery(sql);

 if(rs.next()){
		password = rs.getString(1);  //글의 비밀번호를 DB에서 가져와서 password에 넣는다
 }

 if(password.equals(passw)) {  //check_edit에서 적은 비번과 DB의 비번이 같으면 edit.jsp로 이동
%>
		<script language = "javascript">
			self.window.alert("글 수정 페이지로 이동합니다.");
			opener.location.href="edit.jsp?idx=<%=idx%>";
			self.close();
		</script>
<%

	if(rs!=null&&rs.isClosed()==false)rs.close();
	if(stmt!=null&&stmt.isClosed()==false)stmt.close();
	if(conn!=null&&conn.isClosed()==false)conn.close();
	
} else {		//틀렸을 경우 경고창을 띄워주고 check_edit으로 돌아간다.
%>
	<script language=javascript>
		self.window.alert("비밀번호를 틀렸습니다.");
		location.href="javascript:history.back(-1)";
	</script>
<%			
}
 			
%>