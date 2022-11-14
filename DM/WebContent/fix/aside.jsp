<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, festival.*"  isELIgnored="false"%>
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
</head>
<body>
	<table align="center">
			<tr align="center">
			<td bgcolor="#48D1CC"><a href="#">봄</a></td>
			<td bgcolor="#48D1CC"><a href="#">여름</a></td>
			<td bgcolor="#48D1CC"><a href="#">가을</a></td>
			<td bgcolor="#48D1CC"><a href="#">겨울</a></td>
		</tr>
			<tr align="center">
				<td bgcolor="#FFDAB9">번호</td>
				<td bgcolor="#FFDAB9">제목</td>
				<td bgcolor="#FFDAB9">월</td>
				<td bgcolor="#FFDAB9">누적 수</td>
			</tr>
		<c:forEach var="sp" items="${springFestival.springList}">
			<tr align="center">
				<td>${sp.no}</td>
				<td>${sp.title}</td>
				<td>${sp.mon}</td>
				<td>${sp.ydt}</td>
			</tr>
		</c:forEach>
	
	</table>
</body>
</html>