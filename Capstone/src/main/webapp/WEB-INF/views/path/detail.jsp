<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="pathVO" value="${planMap.pathVO }"/>
<c:set var="mapVO" value="${planMap.mapVO}"/>
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
      <h1 align="center" class="titleD">${pathVO.title}</h1>
      <div class="intro">${pathVO.intro }</div>
	<br>
	<div class="dateD">
	${pathVO.s_date} ~ 
	${pathVO.e_date}
	</div>
	 <div class="map_wrap">
		<div id="map" style="width:100%;height:100%;position:absolute;overflow:hidden;"></div>
		
	</div>
	<div>
	<ul class="list">
		<c:forEach var="item" items="${mapVO}" varStatus="cnt">
		    <li class="item mouse-effect stagger-item">
		       <div class="num">${cnt.count}</div>
		       <div class="infos">
		       <div class="title">${item.placeName}</div>
		       <div class="desc"></div>
		       </div>
		    </li> 
		     </c:forEach>
		</ul>
   	</div>
   	<input class="da" type="submit" value="수정" onClick="location.href='${contextPath}/path/planMap.do?articleNO=${articleNO}'" style="margin-left:70%">
   	<input class="db" type="submit" value="목록창" onClick="location.href='${contextPath}/path/path.do'">
   
   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4687789a7700428ccb729bdaf4ac246&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    
	    mapOption = {
	        center : new daum.maps.LatLng(${mapVO[0].longitude}, ${mapVO[0].latitude}), // 지도의 중심좌표
	        level : 12
	    // 지도의 확대 레벨
	    };
    /*mapOption = {
            center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level : 9
        // 지도의 확대 레벨
        };*/
    
    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
    var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
 
    /* 마커를 표시할 위치와 title 객체 배열입니다 
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
    } ];*/
    
    var positions = [ 
    	<c:forEach var="item" items="${mapVO}" varStatus="cnt">
    	{
    	title : "${item.placeName}",
    	latlng : new kakao.maps.LatLng(${item.longitude}, ${item.latitude})
    	}
    	<c:if test="${fn:length(mapVO) != cnt.count}">,</c:if>
 		</c:forEach>
 	];
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
        };
        
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
        displayCircleDot(i+1, positions[i].title,positions[i].latlng, distance);
         
    }
 
    function displayCircleDot(i, title, position, distance) {

        if (distance > 0) {
        	var walkkTime = distance / 67 | 0;
            var walkHour = '', walkMin = '';
            
            if (walkkTime > 60) {
                walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
            }
            walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

            // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
            var bycicleTime = distance / 227 | 0;
            var bycicleHour = '', bycicleMin = '';

            // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
            if (bycicleTime > 60) {
                bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
            }
            bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
            
            
            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
            var distanceOverlay = new daum.maps.CustomOverlay(
                    {
                    	
                        content : '<div class="dotOverlay"><span class="title11">'+i+'. '+title+'</span><br>거리 <span class="number">'
                                + distance + '</span>m<br>'+'도보 <span class="label"> '+walkHour+walkMin +'</span><br>'
                                +'<span class="label">자전거</span>' + bycicleHour + bycicleMin+'</div>',
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