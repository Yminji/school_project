<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="pathList" value="${pathMap.pathList}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"
</script>
 	<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
    <link rel="stylesheet" href="${contextPath}/resources/css/path.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/animation.css" />
    <style>
	a{text-decoration:none;}
    </style>
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>  
	<script type="text/javascript">
	function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	
	function openPlan(){
		var popupWidth = 600;
		var popupHeight = 500;

		var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
		var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
		window.name = "ParentForm";
		
		openWin = window.open("${contextPath}/path/plan.do", "childForm", "width="+popupWidth+", height="+popupHeight+",left="+popupX+",top="+popupY+", resizabale=no, scrollbars=no, location=no");
		
	}
	</script>
</head>
<body>
	<!-- <nav class="goMyPage">
      <a href="${contextPath}/mypage/mypageMain.do">
        <img src="${contextPath}/resources/img/icon/home.svg" />
      </a>
    </nav> -->  
    <br>
    <div class="featured">
      <div class="text-area">
        <h1 class="title stagger-item" style="font-weight:bold;">여행 계획표</h1>
      </div> 
    </div>

    <ul class="list">
    <!--  <input class="add_button" type="button" value="여행 동선 추가하기" onClick="location.href='${contextPath}/path/plan.do'">-->
    <input class="add_button" type="button" value="여행 계획하기" onClick="openPlan()"> 
     <br><br>
		<c:forEach var="item" items="${articlesList}" varStatus="cnt">
		   <li class="item mouse-effect stagger-item">
		   <c:set var="articleNO" value="${articlesList[cnt.count-1].articleNO}"/>
			  <div class="num">${cnt.count}</div>
			  <div class="infos">
			       <a href="${contextPath}/path/detail.do?articleNO=${item.articleNO}" style="color: black">
			            <div class="title">${item.title}</div>
			       </a>	
			  <div class="desc">${item.s_date} ~ ${item.e_date }</div>
			  </div>
			  <input class="dd" type="submit" value="수정하기" onClick="location.href='${contextPath}/path/planMap.do?articleNO=${item.articleNO}'" style="margin-left:68%">
			  <input class="dd" type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/path/removeArticle.do', ${item.articleNO})" style="margin-left:10px">
			</li>
		 </c:forEach>
    </ul>
</body>
</html>