<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, concert.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 순위</title>
	<%@ include file="../fix/styleC.jsp" %>
</head>
<body>
	<%@ include file="../fix/header.jsp" %>
	
	<div id="content">
	
	
	<table align="center">
		<tr align="center">
			<th width="2%"><b>순위</b></th>
			<th width="10%"><b>해시태그</b></th>
			<th width="7%"><b>제목</b></th>
			<th width="1%"><b>링크</b></th>
		</tr>
		
		<c:forEach var="co" items="${Concert.concertList}" varStatus="status">
			<tr align="center">
				<td bgcolor="#87CEEB">${status.count}</td>
				<td bgcolor="#DCDCDC">${co.tag}</td>
				<td bgcolor="#87CEEB">
					<input id="check-btn" type="checkbox" checked="on"/>
					<label for="check-btn">${co.title}</label>
					<img class="my_img" src="../image/concertI/콘서트${status.count}.jpg">
				</td>
				<td bgcolor="#FOE68C"><a href="${co.link}">${co.link}</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="aside">
		<table align="center">
			<tr align="center">
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/concert/springConcert.do">봄</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/concert/summerConcert.do">여름</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/concert/fallConcert.do">가을</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/concert/winterConcert.do">겨울</a></td>
		</tr>
		</table>
		<table align="center">
			<tr align="center">
				<td width="1%" bgcolor="#FFDAB9">순위</td>
				<td width="4%" bgcolor="#FFDAB9">제목</td>
			</tr>
		<c:forEach var="wi" items="${Concert.winterList}" varStatus="status">
			<tr align="center">
				<td>${status.count}</td>
				<td><a href="${wi.address}">${wi.title}</a></td>
			</tr>
		</c:forEach>
	
	</table>
		
	</div>
</body>
</html>