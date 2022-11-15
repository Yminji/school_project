<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8"); %> 
<% response.setContentType("text/html; charset=utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mainN{
			font-size:42px;
			text-align:center;
			font-weight:bolder;
			font-family: fantasy;
		}
		ul{
			margin : 0;
			padding : 0;
			display : flex;
			justify-content: space-evenly;
		}
		li{
			list-style-type:none;
			float:lefㄴt;
			border : 0px solid black;
			background: #FFFF00;
			width:25%;
			height:100%
			line-height:50px;
			text-align: center;
		}
		a{
			display:block;
			padding:8px 27px;
			text-transform: uppercase;
			text-decoration:none;
			color: #000000;
			transition:all 0.3s ease-in-out;
		}
		.orange:hover{
			color: #000000;
			background: #FF9900;
		}
</style>
</head>
<body>

	<header>
		<p style="text-align:right; color:red; font-weight:bold;">Update<br> 2022/11/10 </p>
		<p class="mainN"><a href="${contextPath}/festival/listFestival.do">IC 랭크</a></p>
	
		<ul>
			<li><a href="${contextPath}/festival/listFestival.do"  class="orange"><b>축제</b></a></li>
			<li><a href="${contextPath}/concert/listConcert.do" class="orange"><b>콘서트</b></a></li>
			<li><a href="${contextPath}/movie/listMovie.do" class="orange"><b>영화</b></a></li>
			<li><a href="${contextPath}/musical/listMusical.do" class="orange"><b>뮤지컬</b></a></li>
			<li><a href="${contextPath}/board/listArticles.do"  class="orange"><b>게시판</b></a></li>
		</ul>
		<br>
	</header>
</body>
</html>