<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="fstvl" value="${fstvlMap.fstvlVO }"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet" /> 
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/animation.css" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="stylesheet" href="${contextPath}/resources/css/fstvlDetail.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function add_bookmark(fstvl_id) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/bookmark/addFstvlInBookMark.do",
			data : {
				fstvl_id:fstvl_id
				
			},
			success : function(data, textStatus) {
				//alert(data);
			//	$('#message').append(data);
				if(data.trim()=='add_success'){
					alert("북마크에 저장되었습니다.");	
				}else if(data.trim()=='already_existed'){
					alert("이미 북마크에 저장되어 있습니다.");	
				}
				
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
			}
		}); //end ajax	
	}
</script>

</head>
<body>
<div class="fontG bodyrang">
	<div class="text-area">
      <h1>${fstvl.fstvlNm}</h1>
    </div>
	<a href="javascript:add_bookmark('${fstvlMap.fstvlVO.fstvl_id }')"><img class="bookmark"src="${contextPath}/resources/img/icon/bookmark.svg" alt="" /></a>
    <section>
      <div class="detail_img">
        <a href="${fstvl.homepageUrl}"> <img class="detailimg" src="${contextPath}/resources/img/festival_test.jpg" alt="" /></a>
       
      </div>
      <dl>
        <dt>일시</dt>
        <dd>${fstvl.fstvlStartDate} ~ ${fstvl.fstvlEndDate }</dd>
        <dt>개최장소</dt>
        <dd>${fstvl.opar}</dd>
        <dt>도로명주소</dt>
        <dd>${fstvl.rdnmadr}</dd>
        <dt>지번주소</dt>
        <dd>${fstvl.lnmadr}</dd>
        <dt>주관기관</dt>
        <dd>${fstvl.mnst}</dd>
        <dt>주최기관</dt>
        <dd>${fstvl.auspclnstt}</dd>
        <dt>후원기관</dt>
        <dd>${fstvl.suprtlnstt}</dd>
        <dt>전화번호</dt>
        <dd>${fstvl.phoneNumber}</dd>
        <dt>홈페이지</dt>
        <dd><a href="${fstvl.homepageUrl}" style="color:black;">${fstvl.homepageUrl}</a></dd>
      </dl>
    </section>
    <div class="content">
      ${fstvl.fstvlCo}
    </div>
	<br><br>
    <h1 class="way">오시는 길</h1><br>
    <div class="map_wrap">
		<div id="map" style="width:100%;height:85%;position:absolute;left:6%;overflow:hidden;"></div>
		<div id="pagination"></div>
</div>
	</div><br>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4687789a7700428ccb729bdaf4ac246&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(${fstvl.latitude}, ${fstvl.longitude}), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${fstvl.latitude}, ${fstvl.longitude}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:5px;">${fstvl.fstvlNm} <br><a href="https://map.kakao.com/link/map/${fstvl.opar},${fstvl.latitude}, ${fstvl.longitude}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${fstvl.opar},${fstvl.latitude}, ${fstvl.longitude}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(${fstvl.latitude}, ${fstvl.longitude}); //인포윈도우 표시 위치입니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	</script>
   <!--  <div class="map">
      <center>
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.294671610935!2d126.97456675059104!3d37.57167833149275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2eb421c44ad%3A0xe955a50c118085f8!2z6rSR7ZmU66y46rSR7J6l!5e0!3m2!1sko!2skr!4v1676454834251!5m2!1sko!2skr"
          width="600"
          height="450"
          style="border: 0"
          allowfullscreen=""
          loading="lazy"
          referrerpolicy="no-referrer-when-downgrade"
        ></iframe>
      </center>
      >
    </div> -->
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn }"/>