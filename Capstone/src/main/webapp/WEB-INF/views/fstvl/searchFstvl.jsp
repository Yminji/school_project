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
<script type="text/javascript">
		var loopSearch = true;
		function keywordSearch(){
			if(loopSearch==false)
				return;
			var value=document.frmSearch.searchWord.value;
			$.ajax({
				type:"get",
				async:true,
				url:"${conetxtPath}/fstvl/keywordSearch.do",
				data:{keyword:value},
				success:function(data, textStatus){
					var jsonInfo = JSON.parse(data);
					displayResult(jsonInfo),
				},
				error:function(data, textStatus){
					alert("에러가 발생했습니다."+data);
				},
				complete:function(data,textStatus){
					
				}
			});
		}
		function displayResult(jsonInfo){
			var count = jsonInfo.keyword.length;
			if(count > 0) {
			    var html = '';
			    for(var i in jsonInfo.keyword){
				   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
			    }
			    var listView = document.getElementById("suggestList");
			    listView.innerHTML = html;
			    show('suggest');
			}else{
			    hide('suggest');
			} 
		}
		function select(selectedKeyword) {
			 document.frmSearch.searchWord.value=selectedKeyword;
			 loopSearch = false;
			 hide('suggest');
		}
		function show(elementId) {
			 var element = document.getElementById(elementId);
			 if(element) {
			  element.style.display = 'block';
			 }
			}
		
		function hide(elementId){
		   var element = document.getElementById(elementId);
		   if(element){
			  element.style.display = 'none';
		   }
		}
	</script>
<style>
	</style>
<head>
<link rel="stylesheet" href="./css/owl.carousel.min.css" />
    <link rel="stylesheet" href="./css/owl.theme.default.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${contextPath}/resources/css/fes_list.css" />
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/searchFstvl.css">

</head>
<body>
<br>
	<form name="frmSearch" class="green_window" action="${contextPath}/fstvl/searchFstvl.do">
        <input name="searchWord" class="input_text" type = "text" onKeyUp="keywordSearch()" required>
        <input type="submit" class="sch_smit" value="search">
    </form>

			<c:choose>
			   <c:when test="${ empty fstvlsList  }" >
			        <li>
					<div id="book">
						<h1>찾는 축제가 없습니다.</h1>
					  </div>
					</li> 
			   </c:when>
			   <c:otherwise>
			   <c:forEach var="item" items="${fstvlsList}">
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
					                <h1 align="justify" class="text">${item.fstvlCo}</h1>
					             </p>
					                <!--  카드 바디 본문 -->
					                <!--  카드 바디 푸터 -->
					                <div class="card-body-footer">
					                    <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
					                    <i class="reg_date">${item.opar}</i>
					                </div>
				            </div>
				        </div>
				  </a>
				</c:forEach>
			  <!-- <c:forEach var="item" items="${fstvlsList}" >
			   			<ul style="list-style:none;">
						  <li class="litt">
						    <div class="album-item">
						      <div class="album-cover">
						      	<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">
									<img width="100%" height="100%" alt="" src="${contextPath}/resources/img/fstvl/${item.fstvlNm}.png">
								</a>
						      </div>
						      <div class="album-info">
						        <p class="album-title">
						        	<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}" style="color:black;">
										${item.fstvlNm}
									</a>
						        </p>
						        <p class="album-date">${item.fstvlStartDate} | ${item.fstvlEndDate}</p>
						      </div>
						    </div>
						  </li>
						</ul>
			   			 <a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}">
						<img width="100" alt="" src="${contextPath}/resources/img/fstvl/${item.fstvlNm}.png">
						</a>
						<a href="${contextPath}/fstvl/fstvlDetail.do?fstvl_id=${item.fstvl_id}" style="color:black;">
							  ${item.fstvlNm}
						</a>
						<div class="writer" style="color:black;">${item.fstvlStartDate} | ${item.fstvlEndDate}</div>
			   		</div> 
			   </c:forEach>-->
			</c:otherwise>
		</c:choose>
</body>
</html>