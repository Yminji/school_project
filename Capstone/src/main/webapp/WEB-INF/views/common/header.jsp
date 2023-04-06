<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
	   <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    
</head>
<body>
	<script type="text/javascript">
	    const toggleBtn = document.querySelector(".navbar__toogleBtn");
		const menu = document.querySelector(".navbar__menu");
	
		toggleBtn.addEventListener('click', () => {
		    menu.classList.toggle('active');
		    
		});
    </script>
	<nav class="navbar">
    <div class="navbar__logo">
        <i class="fa-solid fa-face-smile"></i>
        <a href="${contextPath}/main/main.do"> 축제통해 여행가자 </a>
    </div>
    
    <ul class="navbar__menu">
    	<c:choose>
    		<c:when test="${isLogOn == true and not empty memberInfo }">
    			<li><a href="${contextPath}/fstvl/fstvlList.do">축제</a>
    			<li><a href="${contextPath}/board/listArticles.do">게시판</a></li>
		        <li><a href="${contextPath}/mypage/mypageMain.do">마이페이지</a></li>
		        <li><a href="${contextPath}/member/logout.do">로그아웃</a></li>
		    </c:when>
		    <c:otherwise>
		    	<li><a href="${contextPath}/fstvl/fstvlList.do">축제</a>
		    	<li><a href="${contextPath}/board/listArticles.do">게시판</a></li>
		    	<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
		        <li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
		        
		    </c:otherwise>
	    </c:choose>

    </ul>

    <a href="#" class="navbar__toogleBtn">
        <i class="fa-solid fa-bars"></i>

    </a>

 </nav>
</body>
</html>