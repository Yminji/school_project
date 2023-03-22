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
	    location.href=loginForm+'?action=/board/addBoard.do';
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
                    <div class="count">조회</div>
                </div>
                <c:choose>
                	<c:when test="${boardList == null }">
                		<div>
					            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
					        </div>
					  </c:when>
					  <c:when test="${boardList != null }">
                		<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
			                <div>
			                    <div class="num">${articleNum.count}</div>
			                    <div class="title"><a href="${contextPath}/board/viewBoard.do?articleNO=${article.articleNO}" style="color:black;">${article.title}</a></div>
			                    <div class="writer">${article.member_id}</div>
			                    <div class="date">${article.writeDate}</div>
			                    <div class="count">33</div>
			                </div>
			             </c:forEach>
			        </c:when>
			    </c:choose>
                <div>
                    <div class="num">4</div>
                    <div class="title"><a href="${contextPath}/board/viewBoard.do" style="color:black;"> 제목이들어감</a></div>
                    <div class="writer">홍길동</div>
                    <div class="date">2023.1.4</div>
                    <div class="count">8</div>
                </div>
                <div>
                    <div class="num">3</div>
                    <div class="title"><a href="${contextPath}/board/viewBoard.do" style="color:black;"> 제목이들어감</a></div>
                    <div class="writer">홍길동</div>
                    <div class="date">2023.1.4</div>
                    <div class="count">54</div>
                </div>
                <div>
                    <div class="num">2</div>
                    <div class="title"><a href="${contextPath}/board/viewBoard.do" style="color:black;"> 제목이들어감</a></div>
                    <div class="writer">홍길동</div>
                    <div class="date">2023.1.4</div>
                    <div class="count">123</div>
                </div>
                <div>
                    <div class="num">1</div>
                    <div class="title"><a href="${contextPath}/board/viewBoard.do" style="color:black;"> 제목이들어감</a></div>
                    <div class="writer">홍길동</div>
                    <div class="date">2023.1.4</div>
                    <div class="count">47</div>
                </div>
        
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>

                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>

            </div>
            <div class="bt_wrap">
                <a href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/addBoard.do', 
                                                    '${contextPath}/member/loginForm.do')" class="on">등록</a>
                <a href="${contextPath}/board/editBoard.do" class="on">수정</a>>
            </div>
        </div>
    </div>
</body>
</html>