<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*" %>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<html>
  <title></title>
  <meta charset="utf-8">
  <style>
 
   
   
    header {
      background-color:#87CEFA;
      color: white;
      padding: 20px;
    }


    footer {
      background-color:#87CEFA;
      color: white;
      padding: 20px;
    }
    
  </style>
<script language = "javascript">
  
  function deleteCheck()
  {
   var form = document.deleteform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return false;
   }
  
   form.submit();
  } 

</script>

<%
	int idx=Integer.parseInt(request.getParameter("idx"));
	
%>
<body>
  <br> <br><br>  <br>
          <br>
          
<form method="post" action="check_delete_ok.jsp?idx=<%=idx%>" name="deleteform">
	<table align="center" border="1">
		<tr>
			<td align="center"><b>비밀번호를 입력하세요</b></td>
		</tr>
		<tr>
			<td><input type="text" name="password" maxlength="15" style=" width : 200px; height : 30px;" ></td>
		</tr>
	</table>
<br>


<div class="container">
<div style="text-align:center">
<button type="button" class="btn" onClick="location.href='javascript:deleteCheck();'" >확인<div style="text-align:right"></button>
<button type="button" class="btn" onClick="location.href='javascript:self.close()'" >취소</button></div>
</div>
</div>

</form>
 <br><br><br><br><br>
   





</body>
</html>