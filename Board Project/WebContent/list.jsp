<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./images/font-awesome.min.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%> 

<meta charset="utf-8">

<style>
  
  
  @import url(https://fonts.googleapis.com/css?family=Varela+Round);



	.box2 {
  display: inline-block;
  width: 1000px;
  height: 100px;
  margin-left: 450px;
  align:center;
  
}
	

.btn1 {
    background-color: #2196F3;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    outline: none;
}

.dropdown {
    position: absolute;
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f1f1f1;
    min-width: 160px;
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
    display: block;
}

.btn1:hover, .dropdown:hover .btn1 {
    background-color: #0b7dda;
}



.slides {
	align: center;
    padding: 0px;
    width: 800px;
    height: 500px;
    display: block;
    margin: 20 auto;
    position: relative;
}

.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
	align: center;
    top: 0;
    opacity: 0;
    width: 800px;
    height: 500px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {
    width: 200px;
    height: 100%;
    display: none;
    position: absolute;

	  opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 380px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover + .nav label { opacity: 0.5; }

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block; }

.nav-dots {
	width: 100%;
	bottom: 9px;
	height: 11px;
	display: block;
	position: absolute;
	text-align: center;
}

.nav-dots .nav-dot {
	top: -5px;
	width: 11px;
	height: 11px;
	margin: 0 4px;
	position: relative;
	border-radius: 100%;
	display: inline-block;
	background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4{
	background: rgba(0, 0, 0, 0.8);
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
	height:20px;
	background-color:#ffffff;
	position:relative;
	top:0px;
	right:5px;
	left:475px;
}


		#relative8
	{
	width:300px;
	height:70px;
	position:relative;
	top:0px;
	right:20px;
	left:320px;
}
	
	
	
    
  </style>




<%

request.setCharacterEncoding("utf-8");

String DB_URL = "jdbc:mysql://localhost:3306/board?useSSL=true&useUnicode=true&characterEncoding=UTF-8";  //디비와 연결결할 때 쓰일 디비 주소와, 아이디, 패스워드를 넣어 놓는다.
String DB_USER = "root";
String DB_PASSWORD= "1234";
int total = 0;		//총 게시글의 개수를 넣어줄 변수
int c_total = 0;	//각각의 게시글에 있는 댓글의 개수를 넣어줄 변수

final int ROWSIZE = 10; // 한페이지에 보일 게시물 수 
final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

int pg = 1; //기본 페이지값

if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때 
	pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
} 


int allPage = 0; // 전체 페이지수 

int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6) 
int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)
int idx=0;
String op;		//검색 옵션을 넣어줄 변수
op = request.getParameter("op");
if(op==null){	//만약 op가 null이면 null대신 공백을 넣어줌 (Null Exeception 에러 방지)
	op="";
}
String search="";		//검색어를 넣어줄 변수
search=request.getParameter("search");

Connection conn;  	//디비와 연결할 때 쓰일 Connection
Statement stmt;		//반환된 결과를 가져오게 할 작업 영역을 제공

try {
 Class.forName("com.mysql.jdbc.Driver"); 		//jdbc 드라이버 로딩

 
 conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);  
 stmt = conn.createStatement();
 Statement stmt1 = conn.createStatement();
	String sql = "";
	ResultSet rs=null;

if(op.equals("title")){
	 String sqlCount = "SELECT COUNT(*) FROM board WHERE TITLE LIKE '%"+ search +"%'";  //만약 검색 옵션이 있다면 옵션에 맞게 글들을 SELECT한다.
		rs = stmt.executeQuery(sqlCount);
}else if(op.equals("content")){
	String sqlCount = "SELECT COUNT(*) FROM board WHERE CONTENT LIKE '%"+ search +"%'";  //만약 검색 옵션이 있다면 옵션에 맞게 글들을 SELECT한다.
		rs = stmt.executeQuery(sqlCount);
}else if(op.equals("title_content")){
	String sqlCount = "SELECT COUNT(*) FROM board WHERE CONTENT LIKE '%"+ search +"%' OR TITLE LIKE '%"+ search +"%'";  //만약 검색 옵션이 있다면 옵션에 맞게 글들을 SELECT한다.
		rs = stmt.executeQuery(sqlCount);
}else{
 String sqlCount = "SELECT COUNT(*) FROM board";  //만약 검색 옵션이 없다면 검색이 아닌 일반적인 리스트창을 띄워야 함으로 WHERE은 걸지 않는다.
	rs = stmt.executeQuery(sqlCount);
}
	




	if(rs.next()){		//글이 있으면 total에 글의 갯수만큼 숫자를 넣어줌. 위에서 검색 옵션이 있을 경우 검색 결과에 해당되는 게시글들의 개수가 들어간다.
		total = rs.getInt(1);
	}
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if(endPage > allPage) {
		endPage = allPage;
	}
	
	int limit = (pg-1)*10; //LIMIT 옵션을 사용할 때 쓰일 변수 (한 페이지당 글을 10개씩 출력할 것이기 때문에 *10을 해준다.)
	
	if(op.equals("title")){  //만약 검색 옵션에 title(제목)이 들어갔다면 제목에 검색어가 포함된 글들을 보여준다.
		String sqlList = "SELECT NUM, NAME, TITLE, TIME, HIT, INDENT from board where TITLE LIKE '%"+ search +"%' ORDER BY NUM desc LIMIT " + limit + ",10 ";
		rs = stmt.executeQuery(sqlList);
	}else if(op.equals("content")){	//만약 검색 옵션에 content(내용)가 들어갔다면 내용에 검색어가 포함된 글들을 보여준다.
		String sqlList = "SELECT NUM, NAME, TITLE, TIME, HIT, INDENT from board where CONTENT LIKE '%"+ search +"%' ORDER BY NUM desc LIMIT " + limit + ",10 ";
		rs = stmt.executeQuery(sqlList);
	}else if(op.equals("title_content")){	//만약 검색 옵션에 title_content(제목,내용)가 들어갔다면 제목 또는 내용에 검색어가 포함된 글들을 보여준다.
		String sqlList = "SELECT NUM, NAME, TITLE, TIME, HIT, INDENT from board where CONTENT LIKE '%"+ search +"%' OR TITLE LIKE '%"+ search +"%' ORDER BY NUM desc LIMIT " + limit + ",10 ";
		rs = stmt.executeQuery(sqlList);
	}else{	//검색 옵션이 위에 3개가 아닐 경우(검색 옵션이 없을 경우) WHERE절 없이 모든 글들을 10개씩 보여준다.
		String sqlList = "SELECT NUM, NAME, TITLE, TIME, HIT, INDENT from board ORDER BY NUM desc LIMIT " + limit + ",10 ";
		rs = stmt.executeQuery(sqlList);
	}
	PreparedStatement pstmt = null;
	


%>

<html>

  <head><title></title></head>

<meta charset="utf-8">
<body>
	<div class="box2">
		<table align="center" border="1">

		<tr>
			<td  bgcolor=#e5e5e5 width="1000" height="30"></td>
		</tr>
			
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
 
  <ASIDE style='float: center;'>  <!-- 검색 옵션을 고르는 부분 -->
      <SELECT name="op" style='height:25px; width: 100px;'> 
     	<OPTION value='title'>제목</OPTION>
        <OPTION value='content'>내용</OPTION>
        <OPTION value='title_content'>제목+내용</OPTION>
      </SELECT>  
   </ASIDE> 
	</div>	

 		<div style= "float: left; height: auto; width: 200px; margin: 30px 0px -36px 170px;">
			<input type="text" name="search" >  <!-- 검색어를 입력하는 부분 -->
		</div>

 		<div style= "float: left; height: auto; width: 50px; margin: 12px 0px -10px 380px;">
 		<div class="btn-group btn-group-sm" >
 			<button class="btn" onClick="searchCheck();" type="button">
 				<i class="fa fa-search" >

 				</i>
 			</button>
		
 		</div>
		</div>
	 </form>
			</td>
		</tr>

	</table>



<br>
<br>

	<ul class="slides">
    	<input type="radio" name="radio-btn" id="img-1" checked />
    		<li class="slide-container">
				<div class="slide">
					<img src="img/123.jpg" />
        		</div>
				<div class="nav">
			<label for="img-4" class="prev">&#x2039;</label>
			<label for="img-2" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-2" />
    <li class="slide-container">
        <div class="slide">
          <img src="img/111.png" />
        </div>
		<div class="nav">
			<label for="img-1" class="prev">&#x2039;</label>
			<label for="img-3" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-3" />
    <li class="slide-container">
        <div class="slide">
          <img src="img/222.jpg" />
        </div>
		<div class="nav">
			<label for="img-2" class="prev">&#x2039;</label>
			<label for="img-4" class="next">&#x203a;</label>
		</div>
    </li>

    <input type="radio" name="radio-btn" id="img-4" />
    <li class="slide-container">
        <div class="slide">
          <img src="img/333.jpg" />
        </div>
		<div class="nav">
			<label for="img-3" class="prev">&#x2039;</label>
			<label for="img-1" class="next">&#x203a;</label>
		</div>
    </li>

  

    <li class="nav-dots">
      <label for="img-1" class="nav-dot" id="img-dot-1"></label>
      <label for="img-2" class="nav-dot" id="img-dot-2"></label>
      <label for="img-3" class="nav-dot" id="img-dot-3"></label>
      <label for="img-4" class="nav-dot" id="img-dot-4"></label>
   
    </li>
</ul>

<br>
<%if(op!=""){  //검색 결과를 출력할 때(op이 공백이 아니므로 검색 옵션이 있다는 뜻) 검색어의 대한 결과입니다. 를 출력	%>
<table align="center">
	<tr>
		<td><h3>[ ' <%=search %> ' 의 대한 검색 결과입니다. ]</h2> 
	</tr>
</table>
<%} %>


<br>



<table align="center"  height="50" width="1000" >
				<thead>
					<tr>
						<th td height="30" width="30" style="background-color: #eeeeee; text-align: center;">번호</th>
						<th td height="30" width="100" style="background-color: #eeeeee; text-align: center;">제목</th>
						<th td height="30" width="50" style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th td height="30" width="50" style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th td height="30" width="30" style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
				<%
	if(total==0 && op=="") {  	//검색이 아닌 일반 리스트일 때(op이 공백이므로 검색 옵션이 없다는 뜻) 게시글의 수가 0이면 등록된 글이 없습니다. 출력
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	}else if(total==0 && op!=""){ 	//검색했을 때(op가 공백이 아니므로 검색 옵션이 있다는 뜻) 게시글의 수가 0이면 검색된 글이 없습니다. 출력  			%>	
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
		 	   <td colspan="6">검색된 글이 없습니다.</td>
		 	  </tr>
	<%	}else {	
	 						//글이 있으면 글의 제목,작성자,작성 시간 등 정보를 변수들 안에 넣어 둠
		while(rs.next()) {
			idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
			int indent = rs.getInt(6);
			
			
			String sqlCount2 ="SELECT COUNT(*) FROM comment where b_idx="+idx;	  
			pstmt = conn.prepareStatement(sqlCount2);
			ResultSet rs2 = pstmt.executeQuery(sqlCount2);
			
			if(rs2.next()){	//여기서부터 리스트 출력
				c_total = rs2.getInt(1);
				}	
		
%>
				<tr>
						<td height="30" width="30" align="center"> <h6><%=idx %></h6></td>
					<%
						if(c_total==0){	//게시글의 댓글 개수가 0개일 경우 제목만 표시해줌
					%>
						<td height="30" width="100" align="center"><a href="view.jsp?idx=<%=idx%>"><h6><%=title %></h6> </a></td>   <!-- 해당 글에 댓글이 없을 경우 그냥 제목만 출력 -->
					<%}else{	//게시글의 댓글 개수가 1개 이상일 경우 밑에서 출력해줌.		%>	
						<td height="30" width="20" align="center"><a href="view.jsp?idx=<%=idx%>"><h6><%=title %></a>&nbsp;&nbsp;[<%=c_total %>]</h6> </td> <!-- 해당 글에 댓글이 있을 경우 제목 옆에 댓글 갯수도 출력 -->	
					<%} %>	
						
						
						<td height="30" width="50" align="center"><h6><%=name %></h6></td>
						<td height="30" width="50" align="center"><h6><%=time %></h6></td>
						<td height="30" width="30" align="center"><h6><%=hit %></h6></td>
					</tr>
				<%
					}
	 			}
				if(rs!=null && rs.isClosed()==false){rs.close();}
				if(stmt!=null && stmt.isClosed()==false){stmt.close();}
				if(conn!=null && conn.isClosed()==false){conn.close();}
				if(pstmt!=null && pstmt.isClosed()==false){pstmt.close();}
			}catch(SQLException e) {
				out.println(e.getMessage());
			}
			%>
	 			
				</tbody>
			</table>

   
<br>
 
		<div class="box2">
			<div id="relative2">
<%
	if(op==""){	//일반적인 리스트에서는 글쓰기 버튼으로 보인다.			%>
		<button type="button" class="btn" onClick="location.href='write.jsp'">Write</button>
<%}else{	//검색 결과 일 때는 일반 리스트로 돌아가는 버튼으로 보인다.		%> 
		<button type="button" class="btn" onClick="location.href='list.jsp'">목록</button>
<%} %>

		</div>
	</div>

	<table  align="center">
  		 <tr>
   			<td>
		<%
			if(pg>BLOCK) { //BLOCK은 위에서 5로 선언했기 때문에 만약 페이지가 5를 넘어가면 페이지 부분에 화살표모양이 생긴다.
		%>
			[<a href="list.jsp?pg=1&op=<%=op%>&search=<%=search%>">◀◀</a>] <!-- 1페이지로 돌아간다. -->
			[<a href="list.jsp?pg=<%=startPage-1%>&op=<%=op%>&search=<%=search%>">◀</a>]  <!-- 페이지를 한칸 내려준다. -->
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>  <!-- 스타트 페이지와 현재 페이지가 같으면 스타트페이지에 밑줄과 글씨 굵게 옵션을 준다. -->
		<%
				}else{
		%>
					[<a href="list.jsp?pg=<%=i %>&op=<%=op%>&search=<%=search%>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="list.jsp?pg=<%=endPage+1%>&op=<%=op%>&search=<%=search%>">▶</a>]
			[<a href="list.jsp?pg=<%=allPage%>&op=<%=op%>&search=<%=search%>">▶▶</a>]
		<%
			}
		%>
			</td>
   		</tr>
</table>
<br>
<br> 
   
   
   

<table align="center">

	<hr width ="100%">
		
		<tr>
		
 			<td bgcolor=#ffffff width="1000" height="80" align="center">
 				<h2>당신의 경험을 공유해 주세요.<i class="fas fa-edit"></i></h2>
 
			<hr width ="100%">
		
			</td>
		</tr> 

</table>



	<table align="center">

 		<td  bgcolor=#ffffff width="500"  align="left">
 
 
			 <td  bgcolor=#ffffff width="500"  align="left">
 		<h3>문의하기 </h3> 
<br> 
<br> 
			<input type="text" name="title" maxlength="30" style=" width :130px; height : 30px;" placeholder="NAME">
				<input type="text" name="title" maxlength="30" style=" width :365px; height : 30px;" placeholder="EMAIL">
<br>
<br>
					<input type="text" name="title" maxlength="30" style=" width :500px; height : 150px;" placeholder="MESSAGE">


<br>
<br>



		<div id="relative8">
			<button class="btn" style="width:100pt;height:30pt;">SUBMIT
		</button>

		<div class="dropdown" >


  		<button class="btn" >
    		<i class="fa fa-caret-down"></i>
		</button>
 
 

 
 
  	<div class="dropdown-content" >
 		<button class="btn" >
    		<a href="#">
    			<input value="Success" type="button" onClick="myFunction();">
    		</a>
    		<a href="#">
    			<input value="Input Error" type="button" onClick="myFunction1();">
    		</a>

	</button>

  			</div>
		</div>
	</div>
</div>

<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "Thank you We will reply soon.";
}

function myFunction1() {
	  document.getElementById("demo").innerHTML = "Thank you We will reply soon.";
	}

</script>


<p id="demo"></p>

 
 
 
 
 
 
 
 
 
 	</td>
 </td>
 
 
 	<div style="text-align: center">
	 	
 		
 			<tr>
 			
 			
			
			</tr>
 		
 		
 			</table>
		</td>
	</td>
</table>

<div> 
 
 
   
   
   
   <br>
   <br>


	<table align="center">
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