<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="detailList" value="${pathMap.detailList}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/plan.css">
<link rel="stylesheet" href="${contextPath}/resources/css/path.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/detail.css" />
<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
a{text-decoration:none; color: white;}
</style>
</head>
<body>
	 <br>
      <h1 align="center" class="title stagger-item">여행 1</h1>
	<br>

	 <div class="map_wrap">
		<div id="map" style="width:94%;height:100%;position:absolute;left:50px;right:50px;overflow:hidden;"></div>
		<div id="pagination"></div>
	</div>
	<div>
	<ul class="list">
	<c:choose>
		<c:when test="${empty planList}">
			<li class="item mouse-effect stagger-item">
				  <li class="item mouse-effect stagger-item">
		          <div class="num">1</div>
		          <div class="infos">
		            <div class="title">카카오</div>
		            <div class="desc">날짜</div>
		          </div>
		        </li> 
			
				  <li class="item mouse-effect stagger-item">
		          <div class="num">2</div>
		          <div class="infos">
		            <div class="title">제주공항</div>
		            <div class="desc">날짜</div>
		          </div>
		        </li> 
			
				  <li class="item mouse-effect stagger-item">
		          <div class="num">3</div>
		          <div class="infos">
		            <div class="title">테마파크</div>
		            <div class="desc">날짜</div>
		          </div>
		        </li> 
			
				  <li class="item mouse-effect stagger-item">
		          <div class="num">4</div>
		          <div class="infos">
		            <div class="title">수목원</div>
		            <div class="desc">날짜</div>
		          </div>
		        </li> 
			</li>
		</c:when>
		<c:otherwise>
			<c:forEach var="item" items="${planList}"> -->
     			<!-- <a href="${contextPath}/path/plan.do" style="color: black"> -->
		        <li class="item mouse-effect stagger-item">
		          <div class="num">1</div>
		          <div class="infos">
		            <div class="title">동선1</div>
		            <div class="desc">동선제목1</div>
		          </div>
		        </li> 
		      <!--</a>  -->
		     </c:forEach>
		 </c:otherwise>
	</c:choose>
   	</ul>
   	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4687789a7700428ccb729bdaf4ac246&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = {
        center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level : 9
    // 지도의 확대 레벨
    };
 
    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
 
    // 마커를 표시할 위치와 title 객체 배열입니다 
    var positions = [ {
        title : "카카오",
        latlng : new kakao.maps.LatLng(33.450705, 126.570677)
    }, {
        title : "제주공항",
        latlng : new kakao.maps.LatLng(33.5066211, 126.492810)
    }, {
        title : "테마파크",
        latlng : new kakao.maps.LatLng(33.2906595, 126.322529)
    }, {
        title : "수목원",
        latlng : new kakao.maps.LatLng(33.4696849, 126.493305)
    } ];
 
    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
 
    for (var i = 0; i < positions.length; i++) {
 
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new daum.maps.Size(24, 35);
 
        // 마커 이미지를 생성합니다    
        var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
 
        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title,
            image : markerImage
        // 마커 이미지 
        });
    }
 
    var linePath;
    var lineLine = new daum.maps.Polyline();
    var distance;
 
    for (var i = 0; i < positions.length; i++) {
        if (i != 0) {
            linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
        }
        ;
        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
 
        var drawLine = new daum.maps.Polyline({
            map : map, // 선을 표시할 지도입니다 
            path : linePath,
            strokeWeight : 3, // 선의 두께입니다 
            strokeColor : '#db4040', // 선의 색깔입니다
            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
        });
 
        distance = Math.round(lineLine.getLength());
        displayCircleDot(positions[i].latlng, distance);
         
    }
 
    function displayCircleDot(position, distance) {
        if (distance > 0) {
            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
            var distanceOverlay = new daum.maps.CustomOverlay(
                    {
                        content : '<div class="dotOverlay">거리 <span class="number">'
                                + distance + '</span>m</div>',
                        position : position,
                        yAnchor : 1,
                        zIndex : 2
                    });
 
            // 지도에 표시합니다
            distanceOverlay.setMap(map);
        }
    } 
</script>
    <!--
    <div class="map">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3190.184088169138!2d127.14191127293417!3d36.90986271568326!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357b2f1fdafa02e9%3A0xc540b983501b1521!2z64Ko7ISc7Jq464yA7ZWZ6rWQ!5e0!3m2!1sko!2skr!4v1676060364131!5m2!1sko!2skr" 
      width="600" height="450" style="border: 1px solid black;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>  -->
</body>
</html>