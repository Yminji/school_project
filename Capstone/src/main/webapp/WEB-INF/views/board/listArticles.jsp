<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="articlesList" value="${articlesMap.articlesList}"/>
<c:set var="totArticles" value="${articlesMap.totArticles }"/>
<c:set var="section" value="${articlesMap.section }"/>
<c:set var="pageNum" value="${articlesMap.pageNum }"/>
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
	<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
	<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>  
 <style>
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:30px;}
  </style>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script>
<body>
	<div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>여러분의 이야기를 나눠보세요^^</p>
        </div>

        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                   
                </div>
                <c:choose>
					  <c:when test="${empty articlesList}" > 
					         <p align="center">
					            <b><span style="font-size:30px;">등록된 글이 없습니다.</span></b>
					        </p>
					  </c:when>
					  <c:otherwise>
					    <c:forEach var="article" items="${articlesList }" varStatus="articleNum" >
		                <div>
		                    <div class="num">${articleNum.count }</div>
		                    <div class="title" id="oo"><a href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}" style="color:black;"> ${article.title }</a></div>
		                    <div class="writer">${article.member_id }</div>
		                    <div class="date">${article.writeDate }</div>
		                </div>
               			</c:forEach>
			     	</c:otherwise>
			    </c:choose>
            </div>
            <div class="board_page">
            <c:if test="${totArticles != null }" >
      <c:choose>
        <c:when test="${totArticles >10 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${section >1 && page==1 }">
	          <a class="num" href="${contextPath }/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }" style="color:black;">&nbsp; pre </a>
	         </c:if>
	          <a class="num" href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}" style="color:black;">${(section-1)*10 +page } </a>
	         <c:if test="${page ==10 }">
	          <a class="num" href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}" style="color:black;">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totArticles ==10 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a class="num"  href="#" style="color:black;">${page } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totArticles< 10 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totArticles/10 +1}" step="1" >
	         <c:choose>
	           <c:when test="${page==pageNum }">
	            <a class="num"  href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}" style="color:black;">${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a class="num"  href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}" style="color:black;">${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
            <div class="bt_wrap">
                <a class="on"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
	                                                    '${contextPath}/member/loginForm.do')" style="color:black;">글쓰기</a>
            </div>
        </div>
        </div>
    </div>
</body>
</html>