<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<form action="sign_in.do" method="post">

    ID <input type="text" name="id" placeholder="아이디를 입력해주세요."><br/>
    PW <input type="password" name="password" placeholder="비밀번호를 입력해주세요."><br/>
    PW 확인 <input type="password" name="passwordCheck" placeholder="비밀번호를 확인해주세요."><br/>
      별명 <input type="text" name="nickname" placeholder="별명을 입력해주세요."><br/>
	이름 <input type="text" name="name" placeholder="이름을 입력해주세요."><br/>
	이메일 <input type="text" name="email" placeholder="이메일을 입력해주세요."><br/>
 
      성별
    <input type="radio" name="sex" value="male" checked>남자
    <input type="radio" name="sex" value="female">여자<br/>
 
	전화번호<input type="tel" name="Tel" placeholder="전화번호를 입력해주세요."><br/>
	생년월일<input type="date" name="birthday" placeholder="생년월일을 입력해주세요."><br/>
    <input type="submit" value="확인">
    <input type="reset" value="취소">
</form>

</body>
</html>