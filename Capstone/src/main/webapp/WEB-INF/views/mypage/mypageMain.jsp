<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="member_name" value="${memberVO.member_name}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <link rel="stylesheet" href="myPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link
      rel="stylesheet"
      type="text/css"
      media="screen"
      href="animation.css"
    />
<script src="main.js"></script>
<title>마이페이지</title>
</head>
<body>


	<button onClick="location.href='${contextPath}/member/logout.do'">로그아웃</button>
    <header>
      <div class="thumb-wrapper stagger-item">
        <a href=""
          ><img class="thumb" src="img/icon/human.svg"
        /></a>
      </div>

      <div class="text-area">
        <h2 class="greeting stagger-item">${member_name}</h2>
       
      </div>

      <div class="mail mouse-effect stagger-item">
        <a href="/">test@gmail.com</a>
      </div>
    </header>

    <ul class="list">
      <a href="path.html">
      <li class="item mouse-effect stagger-item">
          <img src="img/icon/path.svg" />
          <div class="name">동선</div>
        </div>
        <div class="right"><img src="img/icon/right_arrow.svg" /></div>
      </li></a>

      <a href="${contextPath}/bookmark/bookMarkList.do">
	      <li class="item mouse-effect stagger-item">
	        <div class="left">
	          <img src="img/icon/bookmark.svg" />
	          <div class="name">즐겨찾기</div>
	        </div>
	        <div class="right"><img src="img/icon/right_arrow.svg" /></div>
	      </li>  
      </a>
</body>
</html>