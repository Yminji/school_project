<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/media.css" />
	<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>여러분의 이야기를 나눠보세요^^</p>
        </div>

        <div class="board_list_wrap">
            <div class="board_view">
                <div class="title">
                    <strong>글 제목</strong>
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd>1</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd>홍길동</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2023.1.6</dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd>47</dd>
                    </dl>
                </div>
                <div class="cont">
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                    글 내용이 들어갑니다<br>
                </div>
        
            </div>
            
            <div class="bt_wrap">
                <a href="${contextPath}/board/listBoard.do" class="on">목록</a>
            
                <a href="${contextPath}/board/editBoard.do" class="on">수정</a>>
            </div>
        </div>
    </div>
</body>
</html>