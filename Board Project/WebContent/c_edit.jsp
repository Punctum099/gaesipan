<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script language = "javascript">
  
  function c_editCheck()
  {
   var form = document.c_editform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return false;
   }
   
   if( !form.content.value )
   {
    alert( "내용을 적어주세요" );
    form.content.focus();
    return false;
   }
  
   form.submit();
  } 

</script>


<html>
  <title></title>
  <meta charset="utf-8">

<body>

<%
	int c_idx=Integer.parseInt(request.getParameter("c_idx"));
	
%>
    
  
  <br>
    <br>
      <br>
        <br>
          <br>
          
<form method="post" action="c_edit_ok.jsp?c_idx=<%=c_idx %>" name="c_editform">
<table align="center";>
<tr><td align="center"><h2><b>댓글수정</h2></b>
<hr>

</td></tr>





<tr>
<td>비밀번호<b>:</b>&nbsp;<input type="text" name="password"  style=" width : 150px; height : 30px;" ></td>
</tr>

<td><textarea placeholder="댓글 내용" id="comment" name="content" style=" width : 600px; height : 100px;" ></textarea></td>
	 
</table>

      <br>


<div class="container">
<div style="text-align:center"><a>
<button type="button" class="btn" onClick="javascript:c_editCheck();">수정<div style="text-align:right">
<a href="main.jsp" ><button type="button" class="btn" onClick="javascript:self.close()">창닫기</button></button>
</div>
</div>
</form>

  <br>
    <br>
      <br>
        <br>
          <br>
          









</body>
</html>