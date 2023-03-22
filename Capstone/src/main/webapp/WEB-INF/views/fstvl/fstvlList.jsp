<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="fstvl" value="${fstvlList.fstvlVO }"/>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/fes_list.css" />
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/searchFstvl.css" />
</head>
<body>
<br>
<form name="frmSearch" class="green_window" action="${contextPath}/fstvl/searchFstvl.do">
        <input name="searchWord" class="input_text" type = "text" onKeyUp="keywordSearch()" required>
        <input type="submit" class="sch_smit" value="search">
    </form>
<c:forEach var="item" items="${listFstvl}" varStatus="cnt">
<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">
    <div class="card">
            <!-- 카드 헤더 -->
            <div class="card-header" >
            <div class="image">	<img src="${contextPath}/resources/img/fstvl/${item.fstvlNm}.png" style="width:100%; height:100%;"></div>
                <div class = "card-header-is_closed" > 
                    <div class = "card-header-text" > ${item.fstvlStartDate} </div > 
                    <div class = "card-header-number" > ~${item.fstvlEndDate} </div > 
                </div >
            </div>
            <!--  카드 바디 -->
            <div class="card-body">
                <!--  카드 바디 헤더 -->
                <div class="card-body-header">
                    <h1></h1>
                    <p class="card-body-hashtag, titleGG">${item.fstvlNm}</p>
                </div>
                <p class="card-body-description">
                <h1 align="justify" class="text">${item.fstvlCo }</h1>
                </p>
                <!--  카드 바디 본문 -->
                <!--  카드 바디 푸터 -->
                <div class="card-body-footer">
                    <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
                    <i class="reg_date"> ${item.opar} </i>
                </div>
            </div>
        </div>
  </a>
  </c:forEach>
  
</body>
</html>