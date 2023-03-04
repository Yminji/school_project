<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/slide.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
	<!-- <script src="/main_slide/slide.js"></script> -->
</head>
	<video muted autoplay loop id="bgvid">
	    <source src="${contextPath}/resources/img/this.mp4" type="video/mp4">
	</video>
<body>

	<div class="container">
	
        <form action="#" class="box">
            <h1> 
                무엇을 찾으시나요? </h1>
            <input type = "text" placeholder="입력하세요" >
            <input type = "submit" value = "검색">
        </form>
        
    </div>
    <nav>
    <div class="slide_box">
        <div class="slider">
            <div class="slides">
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                
                <div class="slide first">
                    <img src="${contextPath}/resources/img/a1.jpg" alt="">
                </div>
                
                <div class="slide">
                    <img src="${contextPath}/resources/img/a2.jpg" alt="">
                </div>
                
                <div class="slide">
                    <img src="${contextPath}/resources/img/a3.jpg" alt="">
                </div>
                
                <div class="slide">      
                    <img src="${contextPath}/resources/img/a4.jpg" alt="">
                </div>
  
                <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
            </div>
  
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>
            </div>
        </div>
    </div>
 </nav>    
</body>
</html>