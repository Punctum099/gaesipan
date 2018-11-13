<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

 
  
   
	#relative2
	{
	width:100px;
	height:50px;
	background-color:#ffffff;
	position:relative;
	top:60px;
	right:5px;
	left:850px;
}

   
	#relative3
	{
	width:100px;
	height:50px;
	background-color:#ffffff;
	position:relative;
	top:10px;
	right:5px;
	left:940px;
}




	
    
  </style>


 <script language = "javascript"> // 자바 스크립트 시작

function writeCheck()
  {
   var form = document.writeform;
   
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
   
   if( !form.play.value )
	{	
		alert( "다녀온 활동을 적어주세요");
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
 			<button class="btn" onClick="searchCheck();">
 				<i class="fa fa-search">

 				</i>
 			</button>
		
 				</div>
			</div>
	 </FORM>
			</td>
		</tr>

	</table>

 		
 		
 	</div>	
 		
 		
 	    
	<div class="box2">
  
     	 <div style="text-align:center"><h1><b>WRITE</b><span style = " font-size:0.5em;">::생생한 후기를 들려주세요!</span></h1></div>
  
  <br>
	
	<hr width=53% >	
		<form method="post" action="write_ok.jsp" name="writeform">
			<table align="center">
				<div id="a">
	<tr>
		<td><b>작성자:</b></td>
	</div>
		<td><input type="text" name="name" maxlength="10" style=" width :180px; height : 30px;"></td>

		<td><b>&nbsp;&nbsp;비밀번호 :</b></td><td><input type="text" name="password" maxlength="15" style=" width : 180px; height : 30px;" ></td>

		<td><b>&nbsp;&nbsp;다녀온 활동 :</b></td><td><input type="text" name="play" maxlength="20" style=" width :180px; height : 30px;" ></td>
	</tr>
			</table>







<br>
  
	<table align="center">
		<div id="a"><tr><td><b>제    목 : </b></td></div>
			<td><input type="text" name="title" maxlength="30" style=" width :740px; height : 30px;" ></td>


	</table>		

     
      <hr width=53%>
	  <br> 
	  <br>

	<tr>
		<td>
			<div style="text-align:center">
			<textarea placeholder="글 내용(1500자)" id="content" name="content" style=" width : 1000px; height : 500px;" ></textarea>	
			</div>
		</td>
	</tr>	
</form>
 


 


 
 
 
 	<table align="center">
			<tr>
				<td>파일첨부:</td>				
			<td>
	<div style="text-align:left"><input type="file" >
			</td>
				</div>
	</table>
 
 
 


  	<div id="relative2">	
		<button type="button" class="btn" onClick="location.href='javascript:writeCheck();'">글등록</button></div>


	<div id="relative3">
		<button type="button" class="btn" onClick="location.href='javascript:history.back(-1);'">취소</button></div>


	<div class="container">
		<div style="text-align:right">
	</div>
</div>


 
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