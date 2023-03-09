<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<head>
<meta charset="UTF-8">

</head>
<body>
	<div id="carousel_inner">
			<ul id="carousel_ul">
			<c:choose>
			   <c:when test="${ empty fstvlsList  }" >
			        <li>
					<div id="book">
						<a><h1>찾는 축제가 없습니다.</h1></a>
					  </div>
				</li> 
			   </c:when>
			   <c:otherwise>
			    <c:forEach var="item" items="${fstvlsList }" >
			     <li>
					<div id="book">
						<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">
						<img width="75" alt="" src="${contextPath}/resources/img/a4.jpg">
						</a>
						<div class="sort">[Festival]</div>
						<div class="title">
							<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">
							  ${item.fstvlNm}
							</a>
						</div>
						<div class="writer">${item.fstvlStartDate} | ${item.fstvlEndDate}</div>
					</div>
				</li>
				</c:forEach> 
				<li>
				</li> 
			   </c:otherwise>
			 </c:choose>
			 
			</ul>
		</div>
</body>
</html>