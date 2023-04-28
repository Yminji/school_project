<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="listFstvl" value="${fstvlMap.articlesList}"/>
<c:set var="totArticles" value="${fstvlMap.totArticles }"/>
<c:set var="section" value="${fstvlMap.section }"/>
<c:set var="pageNum" value="${fstvlMap.pageNum }"/>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./css/owl.theme.default.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${contextPath}/resources/css/searchFstvl.css" />
     <link rel="stylesheet" href="${contextPath}/resources/css/fes_list.css" />
   
</head>
<body>
<br><br>
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
  
  
  <div class="fstvl_page">
            <c:if test="${totArticles != null }" >
      <c:choose>
        <c:when test="${totArticles >9 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${section >1 && page==1 }">
	          <a class="num" href="${contextPath }/fstvl/fstvlList.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
	         </c:if>
	          <a class="num" href="${contextPath }/fstvl/fstvlList.do?section=${section}&pageNum=${page}"> ${(section-1)*10 +page }  </a>
	         <c:if test="${page ==10 }">
	          <a class="num" href="${contextPath }/fstvl/fstvlList.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totArticles ==9 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a class="num"  href="#"> ${page } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totArticles< 9 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totArticles/10 +1}" step="1" >
	         <c:choose>
	           <c:when test="${page==pageNum }">
	            <a class="num"  href="${contextPath }/fstvl/fstvlList.do?section=${section}&pageNum=${page}" >${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a class="num"  href="${contextPath }/fstvl/fstvlList.do?section=${section}&pageNum=${page}" >${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
    </div>
    <br><br>
</body>
</html>