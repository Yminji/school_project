<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, festival.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 순위</title>
	<%@ include file="../fix/styleC.jsp" %>
</head>
<body>
	<%@ include file="../fix/header.jsp" %>
	
	<div id="content">
	
	
	<table align="center">
		<tr align="center">
			<th width="2%"><b>순위</b></th>
			<th width="10%"><b>해시태그</b></th>
			<th width="6%"><b>제목</b></th>
			<th width="2%"><b>링크</b></th>
		</tr>
		
		<c:forEach var="fe" items="${Festival.festivalList}" varStatus="status">
			<tr align="center">
				<td bgcolor="#87CEEB">${status.count}</td>
				<td bgcolor="#DCDCDC">${fe.tag}</td>
				<td bgcolor="#87CEEB">
					<input id="check-btn" type="checkbox" checked="on"/>
					<label for="check-btn">${fe.title}</label>
					<img class="my_img" src="../image/festival/축제${status.count}.jpg">
				</td>
				<td bgcolor="#FOE68C"><a href="${fe.link}">${fe.link}</a></td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="aside">
		<table align="center">
			<tr align="center">
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/festival/springFestival.do">봄</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/festival/summerFestival.do">여름</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/festival/fallFestival.do">가을</a></td>
			<td width="2%" bgcolor="#48D1CC"><a href="${contextPath}/festival/winterFestival.do">겨울</a></td>
		</tr>
			<tr align="center">
				<td bgcolor="#FFDAB9">번호</td>
				<td bgcolor="#FFDAB9">제목</td>
				<td bgcolor="#FFDAB9">월</td>
				<td bgcolor="#FFDAB9">누적 수</td>
			</tr>
		<c:forEach var="sp" items="${Festival.winterList}">
			<tr align="center">
				<td>${sp.no}</td>
				<td>${sp.title}</td>
				<td>${sp.mon}</td>
				<td>${sp.ydt}</td>
			</tr>
		</c:forEach>
	
	</table>
		
	</div>
</body>
</html>