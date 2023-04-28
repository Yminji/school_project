<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="mybookMarkList" value="${bookMarkMap.bookMarkList}"/>
<c:set var="myFstvlList" value="${bookMarkMap.fstvlList }"/>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
	></script>
     <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    
    <link rel="stylesheet" href="${contextPath}/resources/css/favorits.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/animation.css"/> 
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>  
	<script type="text/javascript">
	function delete_fstvl(regNO){
		var regNO=Number(regNO);
		var formObj=document.createElement("form");
		var i_cart = document.createElement("input");
		i_cart.name="regNO";
		i_cart.value=regNO;
		
		formObj.appendChild(i_cart);
	    document.body.appendChild(formObj); 
	    formObj.method="post";
	    formObj.action="${contextPath}/bookmark/removeBookMarkFstvl.do";
	    formObj.submit();
	}     
	</script>
</head>
<body>

<div class="bodyrange">

   
      <h1 class="titleD">저장한 축제</h1>

    <hr style="border: solid 0.0625rem #f2f2f2; width: 50%" />
	
    <!-- 축제카드 -->
    <form name="bookMark">
	    <c:choose>
	    	<c:when test="${empty mybookMarkList}">
	    		<tr>
	    			<td colspan=8 class="fixed">
	    				<strong>저장된 즐겨찾기가 없습니다.</strong>
	    			</td>
	    		</tr>
	    	</c:when>
	    	<c:otherwise>
	    	<div class="row stagger-item">
	    		<c:forEach var="item" items="${myFstvlList}" varStatus="cnt">
	    		 <c:set var="regNO" value="${mybookMarkList[cnt.count-1].regNO}" />
	    		 <div class="col-12 col-md-6 col-lg-4" style="float:left;">
		          <div class="card">
		            <img src="${contextPath}/resources/img/fstvl/${item.fstvlNm}.png" class="card-img-top" alt="..." style="width:470px; height:450px;"/>
		            <div class="card-body"> 
		            	<div id="text">
		            		<h5 class="card-title">
		              		<a class= "text" href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">${item.fstvlNm}</a>
		              		</h5>
		              	</div>
		              	
		              	<a href="javascript:delete_fstvl('${regNO}');" class="btn btn-primary">삭제하기</a>
		              	
		            </div>
		          </div>
		           </div>
		          </c:forEach>
		          </div>
		       </c:otherwise>
		   </c:choose>
		   </form>
        </div>

</body>
</html>