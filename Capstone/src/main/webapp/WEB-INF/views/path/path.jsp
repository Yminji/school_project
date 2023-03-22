<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function delete_path(regNO){
		var regNO=Number(regNO);
		var formObj=document.createElement("form");
		var i_cart = document.createElement("input");
		i_cart.name="regNO";
		i_cart.value=regNO;
		
		formObj.appendChild(i_cart);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/path/removePath.do";
	    formObj.submit();
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
        <h1 class="title stagger-item">동선</h1>
      </div> 
    </div>

    <ul class="list">
    <input class="add_button" type="button" value="여행 동선 추가하기" onClick="location.href='${contextPath}/path/plan.do'">
    	<c:choose>
    		<c:when test="${empty pathList}">
    			
    			<!-- <li>저장된 동선이 없습니다.</li> -->
    			<a href="${contextPath}/path/detail.do" style="color: black">
		        <li class="item mouse-effect stagger-item">
		          <div class="num">1</div>
		          <div class="infos">
		            <div class="title">제주도</div>
		            <div class="desc">2022/03/11 ~ 2022/03/29</div>
		          </div>
		          <input type="submit" value="수정" onClick="location.href='${contextPath}/path/plan.do'" style="margin-left:70%">
			      <input type="submit" value="삭제" onClick="javascript:delete_path('${item.regNO};')" style="margin-left:10px">
		        </li>
		      </a>
    		</c:when>
    		<c:otherwise>
		        <li class="item mouse-effect stagger-item">
		        	<c:forEach var="item" items="${pathList}" varStatus="cnt">
		        		<c:set var="regNO" value="${pathList[cnt.count-1].regNO}"/>
			          	<div class="num">${item.regNO}</div>
			          	<div class="infos">
			            	<a href="${contextPath}/path/detail.do?regNO=${item.regNO}" style="color: black">
			            		<div class="title">${item.title}</div>
			              	</a>	
			            <div class="desc">2023-01-02 ~ 2023-01-14</div>
			          	</div>
			          	<input type="submit" value="수정" onClick="location.href='${contextPath}/path/plan.do?regNO=${item.regNO}'" style="margin-left:70%">
			            <input type="submit" value="삭제" onClick="javascript:delete_path('${item.regNO};')" style="margin-left:10px">
			         </c:forEach>
			     </li>
		      	
		     <!--  <a href="${contextPath}/path/detail.do" style="color: black">
		        <li class="item mouse-effect stagger-item">
		          <div class="num">2</div>
		          <div class="infos">
		            <div class="title">동선2</div>
		            <div class="desc">동선제목2</div>
		          </div>
		        </li>
		      </a>
		      <a href="${contextPath}/path/detail.do" style="color: black">
		        <li class="item mouse-effect stagger-item">
		          <div class="num">3</div>
		          <div class="infos">
		            <div class="title">동선3</div>
		            <div class="desc">동선제목3</div>
		          </div>
		        </li>
      </a>--> 
      		</c:otherwise>
      	</c:choose>
    </ul>
</body>
</html>