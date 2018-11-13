<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./images/font-awesome.min.css">
   <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<html>
  <title></title>
  <meta charset="utf-8">
  <style>
 
  
  
	.box2 {
  display: inline-block;
  width: 1000px;
  height: 500px;
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


   
	#relative2
	{
	width:100px;
	height:50px;
	background-color:#ffffff;
	position:relative;
	top:500px;
	right:5px;
	left:860px;
}

   
	#relative3
	{
	width:100px;
	height:50px;
	background-color:#ffffff;
	position:relative;
	top:450px;
	right:5px;
	left:940px;
}





    
  </style>



<%
request.setCharacterEncoding("euc-kr");
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";
String id = "root";
String pass = "1234";

String name = "";
String password = "";
String title = "";
String content = "";
String play = "";

int idx = Integer.parseInt(request.getParameter("idx"));

try {
	
	Connection conn = DriverManager.getConnection(url,id,pass);
	Statement stmt = conn.createStatement();
	
	String sql = "SELECT NAME, PASSWORD, TITLE, CONTENT, PLAY FROM board WHERE NUM=" + idx;
	ResultSet rs = stmt.executeQuery(sql);

	
	if(rs.next()){
		
		name = rs.getString(1);
		password = rs.getString(2);
		title = rs.getString(3);
		content = rs.getString(4);
		play = rs.getString(5);
	}
	
	
	
	if(rs!=null&&rs.isClosed()==false)rs.close();
	if(stmt!=null&&stmt.isClosed()==false)stmt.close();
	if(conn!=null&&conn.isClosed()==false)conn.close();

}catch(SQLException e) {
	e.printStackTrace();
}


content = content.replace("<br>","\r\n"); //<br>을 엔터키로 바꾼다. 
content = content.replace("&nbsp;"," ");
%>

  
<script type="text/javascript">

$(document).ready(function() {
        $('#title').val('<%=title%>');
    });

$(document).ready(function() {
    $('#password').val('<%=password%>');
});


$(document).ready(function() {
    $('#play').val('<%=play%>');
});
</script>
  
  
 
<script language = "javascript"> // 자바 스크립트 시작

function editCheck()
	{
   var form = document.editform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.play.value)
	{
	  alert("다녀온 활동을 적어주세요.");
	  form.play.focus();
	  return;
	}   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
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
 
 
 
<script type="text/javascript">

$(document).ready(function() {



    $('#content').on('keyup', function() {



        if($(this).val().length > 1500) {

            $(this).val($(this).val().substring(0, 1500));

        }



    });



});

</script>



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
 		
 		
 		
<script language = "javascript"> // 자바 스크립트 시작

function searchCheck(){
	
	var form = document.searchform;
   
   
	if(!form.search.value )
   	{
    	alert("검색어를 입력해 주세요.");
		form.search.focus();
    	return;
   	}
  
 	 form.submit();
  }

</script>
    
 		
 		
	<form name='searchform' method='POST' action="list.jsp">		
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
 			<button class="btn" onClick="searchCheck();" type="button">
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
<br>


    
      <div style="text-align:center">
      	<h1><b>EDIT</b></h1>
      </div>
  
 <br>
		<hr width=100% >	

		<form method="post" action="edit_ok.jsp?idx=<%=idx%>" name="editform">
			<table align="center">
			
		<tr>
			<td><b>작성자:&nbsp; </b></td>
	
			<td>&nbsp;<%=name %>&nbsp;&nbsp;</td>

			<td><b>비밀번호:&nbsp; </b></td><td><input type="text" name="password" id="password" maxlength="15" style=" width : 200px; height : 30px;" ></td>

			<td><b>&nbsp;다녀온 활동:&nbsp;</b></td><td><input type="text" name="play" id="play" maxlength="20" style=" width :200px; height : 30px;" ></td>
		</tr>
</table>






<br>
  
		<table align="center">
		<tr>
		<td><b>제    목: &nbsp;</b>
		</td>			
		<td>
			<input type="text" id="title" name="title" maxlength="30" style=" width :650px; height : 30px;" >
		</td>
		</tr>

		</table>		
      
     
      <hr width=100%>
	  <br> 
	  <br>
 
 
	<tr>	
		<td>
			<div style="text-align:center">		
			<textarea name = "content"  placeholder="글 내용"  style=" width : 1000px; height : 500px;" ><%=content %></textarea>
		</td>					
	</tr>
			</div>
 
</form>

 


 
 
 
 	<table align="center">
		<tr><td>파일첨부:</td>
	<td>
		<div style="text-align:left"><input type="file" >
	</td>
		</div>
	</table>
 

 
 </div>
  
 
 
 	<div class ="box2">
 		<div id="relative2">
			<a href="javascript:editCheck();" ><button type="button" class="btn">수정</a></button>
	</div>


	<div id="relative3">
		<a href="javascript:history.back(-1)" ><button type="button" class="btn">취소</a></button>
	</div>

 
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
 <br>
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
	<button type="button" class="btn btn-default"><a href="#">TOP</a>
	</button>


	<br>
<br>
	</tr>
		</td>

	</table>
</div>
</div>
</div>

</body>
</html>