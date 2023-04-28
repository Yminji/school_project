<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysDate"><fmt:formatDate value="${now}" pattern="yyyy-mm-dd" /></c:set> 

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/plan.css">
<!-- <link rel="stylesheet" href="${contextPath}/resources/css/path.css" > --> 
<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/pop.css" />
<style>
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:22%;margin:10px 0 10px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.9);z-index: 1;font-size:12px;border-radius: 10px;}
a{text-decoration:none; color:white;}
.pop-btn:hover{
	background-color:orange;
}
</style>
</head>
<body>
<br>
		
		
	<div class="popup-new" >
	<div class="popup-wrap" id="popup">
		<div class="popup">
			<div class="popup-head">
				<span class="head-title" style="font-weight:bold;">TOUR PLAN</span>
			</div>
			<div class="popup-body">
				<div class="body-content">
					<div class="body-contentbox">
						<form name="articleForm" method="post"   action="${contextPath}/path/addNewArticle.do" >
							
							<h1 style="font-weight:bold;">제목 : <input type="text" name="title"></h1>
							<br>
							<label for="date" style="font-weight:bold; font-size:20px;">시작일 :
								<input type = "date" name="s_date" max="2040-12-31" min="2000-01-01" value="${sysDate }">
							</label>
							  
							<label for="date" style="font-weight:bold; font-size:20px;">종료일 :
								<input type = "date" name="e_date" max="2040-12-31" min="2000-01-01" value="${sysDate }">
							</label>
							<br><br>
							<h1 style="font-weight:bold;">설명 : </h1><textarea name="intro" rows="3" cols="57" maxlength="30"></textarea>
							<br><br><br><br>
							<div class="popup-foot" >
							<input class="pop-btn confirm" id="confirm" type="submit" value="저장" style="font-weight:bold;">
							<input  class="pop-btn close" id="close" type="button" value="취소" onClick="openWin = window.close();" style="font-weight:bold;">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</body>
	</html>