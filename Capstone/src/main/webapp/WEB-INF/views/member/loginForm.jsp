<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/loginForm.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
    
	<c:if test='${not empty message}'>
	<script>
		window.onload=function(){
			result();
		}
		function result(){
			alert("아이디나 비밀번호가 틀립니다. 다시 로그인해주세요.");
		}
	</script>
	</c:if>
</head>
<body>
	 <div class = "login-form">
    <h1 align="center">로그인</h1> <br>
    <form action="${contextPath}/member/loginForm.do" method="post">
        아이디 <input type="text" name="member_id" class="text-field" 
        autocomplete = "off" required> 
        비밀번호 <input type="password" name="member_pw" class="text-field" 
        autocomplete = "off" required>
        <input type="submit" value="로그인" class="submit-btn">
        <input type="submit" value="회원가입" class="submit-btn" onclick="location.href='${contextPath}/member/memberForm.do'">
    </form>
 </div>
</body>
</html>