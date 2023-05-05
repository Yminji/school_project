<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="member_id" value="${memberMap.member_id}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${contextPath}/resources/css/myPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/animation.css"/>
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
	<script type="text/javascript">
	function deleteMemberId(member_id){
		var id=String(member_id);
		var formObj=document.createElement("form");
		var i_id = document.createElement("input");
		i_id.name="id";
		i_id.value=id;
		
		formObj.appendChild(i_id);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/member/removeMember.do";
	    formObj.submit();
	}     
	</script>
</head>
<body>
	
    <div class="beader">
      <div class="thumb-wrapper stagger-item">
        <a href=""
          ><img class="thumb" src="${contextPath}/resources/img/icon/human.svg"
        /></a>
      </div>

      <div class="text-area">
        <h2 class="greeting stagger-item">${member_id}</h2>
       
      </div>
	<button onClick="location.href='${contextPath}/member/logout.do'">로그아웃</button>
    </div>
<br><br>
    <ul class="list">
      <a href="${contextPath}/path/path.do">
      <li class="item mouse-effect stagger-item">
      <div class="left">
          <img src="${contextPath}/resources/img/icon/path.svg" />
          <div class="name" style="color:black;"> 동선 </div>
          </div>
        <div class="right"><img src="${contextPath}/resources/img/icon/right_arrow.svg" /></div>
      </li></a>

      <a href="${contextPath}/bookmark/bookMarkList.do">
	      <li class="item mouse-effect stagger-item">
	        <div class="left">
	          <img src="${contextPath}/resources/img/icon/bookmark.svg" />
	          <div class="name" style="color:black;">즐겨찾기</div>
	        </div>
	        <div class="right"><img src="${contextPath}/resources/img/icon/right_arrow.svg" /></div>
	      </li>  
      </a>
      
      <a href="javascript:deleteMemberId('${member_id}');">
      		<li class="item mouse-effect stagger-item">
	      		<div class="left">
		          <img src="${contextPath}/resources/img/icon/exit.png" width="24px"/>
		          <div class="name" style="color:black;">회원탈퇴</div>
		        </div>
		        <div class="right"><img src="${contextPath}/resources/img/icon/right_arrow.svg"/></div>
	      </li>  
      </a>
     </ul>
</body>
</html>