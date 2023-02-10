<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<nav class="navbar">

    <div class="navbar__logo">
       
        <i class="fa-solid fa-face-smile"></i>
        <a href="${contextPath}/main/main.do"> 축제통해 여행가자 </a>
    </div>
    
    <ul class="navbar__menu">
        <li><a href="${contextPath}/member/login.do">로그인</a></li>
        <li><a href="${contextPath}/member/addMember.do">회원가입</a></li>
        <li><a href="게시판/게시판.html">게시판</a></li>

    </ul>

    <a href="#" class="navbar__toogleBtn">
        <i class="fa-solid fa-bars"></i>

    </a>

 </nav>
</body>
</html>