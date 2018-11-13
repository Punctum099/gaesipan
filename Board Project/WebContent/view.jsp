
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./images/font-awesome.min.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<%@page import="java.awt.print.PrinterException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<style>
  
 	.box2 {
  display: inline-block;
  width: 1000px;
  height: 100px;
  margin-left: 450px;
  align:center;
  
}
  
  
  .btn {
    border: none;
    color:black;
    padding: 12px 16px;
    font-size: 16px;
    cursor: pointer;
}

.btn:hover {
    background-color: 
}
  

  .line{border-bottom:1px solid black;
  		border-left:1px solid black;
  		border-right:1px solid black;
  }                                      
 
   .lin{border-bottom:1px solid black;
  		
  }
  

	#relative2
	{
	width:100px;
	height:50px;
	background-color:#ffffff;
	position:relative;
	top:0px;
	right:5px;
	left:920px;
}



	#relative3
	{
	width:505px;
	height:40px;
	background-color:white;
	position:relative;
	top:0px;
	right:20px;	
	left:0px;
}




	#relative5
	{
	width:1000px;
	height:40px;
	position:relative;
	top:10px;
	right:20px;	
	left:0px;
}
	#relative6
	
		{
	width:505px;
	height:40px;
	position:relative;
	top:10px;
	right:20px;	
	left:450px;
}
	
	
	
    
  </style>


  
    <script language="JavaScript">

    function change1(obj){
        obj.style.background = 'red';
        obj.style.color = 'white';
    }
     
    function change2(obj){
        obj.style.background = 'white';
        obj.style.color = 'black';
    }

</script>

<script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.commentform;
   
   if( !form.name.value )   // form 에 있는 name 값이 없을 때
   {
    alert( "이름을 적어주세요" ); // 경고창 띄움
    form.name.focus();   // form 에 있는 name 위치로 이동
    return;
   }
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
 
  if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }
 
  form.submit();
  }
 </script>

<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
	String id = "root";
	String pass = "1234";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	Connection conn;
	
	try {
		
		conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT NAME, TITLE, CONTENT, TIME, HIT, PLAY, `LIKE` FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
				String name = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String time = rs.getString(4);
				int hit = rs.getInt(5);
				String play = rs.getString(6);
				int like = rs.getInt(7);
				
				hit++;	
%>
<html>

  <head><title></title></head>

<meta charset="utf-8">
<body>

	<div class="box2">
	<table align="center" border="1">

		<tr>
			<td  bgcolor=#e5e5e5 width="1000" height="30">
		</tr>
			</td>
		<tr>
			<td  bgcolor=#ffffff width="1000" height="50">
		<div style= "float: left; height: auto; width: 200px; margin: 10px 40px 0px 40px;">
		<h2>TicketFlower</h2>
		</div>

		 <div style=" float: left; height: auto; width:200px; margin: 27px 40px 0px 20px;">
			 <h4>
		<a href=" " style="text-decoration:none">공연 &nbsp;</a>

		<a href=" " style="text-decoration:none">전시 &nbsp;</a>
		
		<a href=" " style="text-decoration:none">축제 &nbsp;</a>
		
		<a href=" " style="text-decoration:none">체험</a>
 			</h4>
 		</div>
 		</div>
 		
 		
 		
  <script language = "javascript"> // 자바 스크립트 시작

function searchCheck()
  {
   var form = document.searchform;
   
   
  if(!form.search.value )
   {
	 form.search.focus();
    return;
   }
  form.submit();
  }
 </script>
    
 		
 		
 <form name='searchform' method='POST' action="search_list.jsp">		
<div style= "float: left; height: auto; width: 40px; margin: 30px -100px -36px 60px;">
 
  <ASIDE style='float: center;'>
      <SELECT name="op" style='height:25px; width: 100px;'> 
     	<OPTION value='title'>제목</OPTION>
        <OPTION value='content'>내용</OPTION>
        <OPTION value='title_content'>제목+내용</OPTION>
      </SELECT>  
    </ASIDE> 
</div>	

 		<div style= "float: left; height: auto; width: 200px; margin: 30px 0px -36px 170px;">
			<input type="text" name="search" >
		</div>

 		<div style= "float: left; height: auto; width: 50px; margin: 12px 0px -10px 380px;">
 		<div class="btn-group btn-group-sm">
 			<button class="btn" onClick="location.href='javascript:searchCheck();'">
 				<i class="fa fa-search">

 				</i>
 			</button>
		
 		</div>
		</div>
	 </FORM>
			</td>
		</tr>

	</table>
<br>

	<table align="center">
 		<td width="1000" height="120">
 			<h1>REVIEW</h1>
 		</td>
	</table>



<br>
<br>


	<table border="1" align ="center" >
		<tr>
			<td width="1000" height="50" align="center"><%=title %></td>
		</tr>
		<tr>
			<td width="1000" height="50" align="center"><%=play %></td>
		</tr>
	</table>




	<table  border="0" align ="center" >
		<tr>
		
		<td  bgcolor=#EDEDED class="line" width="150" height="40" align="center" >작성자</td>
		<td class="line" width="300" height="40">&nbsp;<%=name %></td>
		
		<td  bgcolor=#EDEDED class="line" width="150" height="40" align="center">작성 날짜</td>
		<td class="line" width="300" height="40">&nbsp;<%=time %></td>
			
		<td bgcolor=#EDEDED class="line" width="100" height="40">&nbsp;♥<i class="far fa-heart"></i> &nbsp;&nbsp; <%=like %> </td>
			
			
			</tr>
				</table>


<br>
<br>



	<table border="1" align="center" >
		<tr>
			<td width="1000" height="500">&nbsp;&nbsp;<p><%=content %></p></td>
		</tr>
	</table>


<br>
<br>
   
<%
sql = "UPDATE board SET HIT=" + hit + " where NUM=" +idx;  //조회수가 올라가는 부분
 	stmt.executeUpdate(sql);
 		stmt.close();
		conn.close();
	 	}
	}catch(SQLException e) {
		e.printStackTrace();
	}
%>
	<div style="text-align: center">
		<a href="check_edit.jsp?idx=<%=idx%>"><button type="button" class="btn" onClick="window.open('check_edit.jsp?idx=<%=idx%>','비밀번호 확인','width=500, height=300')">수정</button></a>
		<button type="button" class="btn" onClick="window.open('check_delete.jsp?idx=<%=idx%>','비밀번호 확인','width=500, height=300')">삭제</button>
		 <button type="button" class="btn btn-default" onmouseout="change2(this)"  onClick="location.href='like_ok.jsp?idx=<%=idx%>'" style="background-color:#F85B80">♥<i class="far fa-heart">
			 </i> 
		</button>
	


<hr width=100%>

	<div id="relative2">
		<button type="button" class="btn" onClick="location.href='list.jsp'">목록</button>
	</div>

<hr width=100%>

	</div>

<br><br>

					<!-- 여기서부터 댓글 부분 -->

<form name="commentform" method="post" action="comment_ok.jsp">

<input type="hidden" name="b_idx" value="<%=idx%>">

<div id="relative3"> 
	<tr>
		<td><b>작성자</b></td>
			<td>
				<input type="text" name="name" style=" width :100px; height : 30px;">
			</td>

		<td><b>비밀번호 </b></td>
		<td>
			<input type="text" name="password" style=" width : 100px; height : 30px;" >
		</td>
			</tr>
				</div>
				
 <script type="text/javascript">

$(document).ready(function() {



    $('#comment').on('keyup', function() {



        if($(this).val().length > 1500) {

            $(this).val($(this).val().substring(0, 1500));

        }



    });



});

</script>

<table align="center" >

<tr>
	<td>
		 <textarea placeholder="댓글 내용" id="comment" name="content" style=" width : 900px; height : 100px;" ></textarea>
			</td>
			<td align="center" width ="90" height="100"; >
		<input type="button"  style="WIDTH: 75pt; HEIGHT: 75pt" value="등록" Onclick="javascript:writeCheck();">
	</td>
</tr>

</table>
</form>



<%
int b_idx=0;
int c_idx=0;

int indent=0;
int afterNum = 0;
String preTitle = " ";
String afterTitle = " ";
int preNum = 0;

int pre= idx+1;
int after= idx-1;

int i=0;

String sqlList = "SELECT NUM, USERNAME, TIME, CONTENT, INDENT from comment where b_idx=" + idx + " order by REF DESC, STEP ASC";
try{
	conn = DriverManager.getConnection(url,id,pass);
	ResultSet rs;
	Statement stmt;
	stmt = conn.createStatement();
	PreparedStatement pstmt;
	
	
	while(i<5){    //이전글의 제목과 NUM값을 구한다.
	String sqlNum = "SELECT NUM,TITLE from board where NUM =" + pre;
	pstmt=conn.prepareStatement(sqlNum);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		preNum = rs.getInt("NUM");
		preTitle = rs.getString("TITLE");
	}
	
	if(preNum!=0)break;
	
	pre++;
	i++;
}
	
	i=0;
	
	while(i<5){  	//다음글의 제목과 NUM값을 구한다.
		String sqlNum = "SELECT NUM,TITLE from board where NUM =" + after;
		pstmt=conn.prepareStatement(sqlNum);
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			afterNum = rs.getInt("NUM");
			afterTitle = rs.getString("TITLE");
		}
		
		if(afterNum!=0)break;
		
		after--;
		i++;
	}
	
	rs = stmt.executeQuery(sqlList);
	
		while(rs.next()) {
			c_idx = rs.getInt(1);
			String name = rs.getString(2);
			String time = rs.getString(3);
			String content = rs.getString(4);
			indent = rs.getInt(5);
%>

<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
							

<div id="relative5">

	<table  border="0" align ="left" >
		<tr>
			<td width="1000" height="40">
			
				
	
			<table border="0" align ="left"  >
			<tr>
			<td>
			<%if(indent != 0){%>
			   		&nbsp;<img src='img/reply.png' />
			   		<% }%><b><%=name %></b> . <%=time %>
			
			</td>
			
			&nbsp;&nbsp;&nbsp;
			
			<a href ="recomment.jsp?c_idx=<%=c_idx %>"onClick="window.open(this.href,'_blank','width=800, height=500');return false;"><b>답글</b></a>&nbsp;
			<a href ="c_check_edit.jsp?c_idx=<%=c_idx %>" onClick="window.open(this.href,'_blank','width=500, height=300');return false;"><b>수정</b>&nbsp;</a>
			<a href ="c_check_delete.jsp?c_idx=<%=c_idx %>" onClick="window.open(this.href,'_blank','width=500, height=300');return false;"><b>삭제</b></a>	
			
			</td>
			</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td>
				<table  border="0" align ="left" >
					<tr>
						
						<td class="lin" width="1000" height="20">
							<div id="relative5"><%=content %></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<% 
			}
			if(rs!=null&&rs.isClosed()==false)rs.close();
		//}
		//if(pstmt!=null&&pstmt.isClosed()==false)pstmt.close();
		if(conn!=null && conn.isClosed()==false)conn.close();
		if(stmt!=null && stmt.isClosed()==false)stmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
				
							
							
							<!-- 여기까지 댓글 -->
<br>
<br>
<br>
<br>
	
	<table align ="center" border="1"; width ="1000" height="100">

		<tr>
			<td  align ="center" width="200" height="6";>이전글 ▲</td>
				<td width ="900" height="5";>
				<%
							if(preNum!=0){
						%>	
						<a href="view.jsp?idx=<%=preNum %>" style="text-decoration:none">
						<span style="color:black"> &nbsp;<%=preTitle %>
					</a>
						 <%  
							}else{
						 %>
						 <span style="color:black">&nbsp; 이전글이 없습니다.</span>
						 <%
						 } 
						 %>
					
				</td>
			</span>
		</tr>
	</td>
			
			<tr>
				<td  align ="center" width="200" height="6";>다음글 ▼</td>
					<td width ="900" height="5";>
						<%
							if(afterNum!=0){
						%>	
						<a href="view.jsp?idx=<%=afterNum %>" style="text-decoration:none">
						<span style="color:black">&nbsp;<%=afterTitle %></span>
						</a>
						 <%  
							}else{
						 %>
						 <span style="color:black">&nbsp; 다음글이 없습니다.</span>
						 <%
						 } 
						 %>
					</tr>
				</td>	
<br><br><br><br><br><br>
<br>

	</table>

   
   
   
<br>
<br> 


	<table align="center" border="1">
		<tr>
 			<td  bgcolor=#e5e5e5 width="1000" height="100">
		</tr>
			</td>

		<tr>
 			<td  bgcolor=#e5e5e5 width="1000" height="10">
 	<div style="text-align: center">
 <br>
  		 <div class="btn-group btn-group-sm">
			<button type="button" class="btn btn-default">
					<a href="#">TOP</a>
			</button>


<br>
<br>
	</tr>
</td>

</table>
</div>
</div>

</body>
</html>