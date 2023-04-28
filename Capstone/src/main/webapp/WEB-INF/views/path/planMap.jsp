<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="pathVO" value="${planMap.pathVO }"/>
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
<link rel="stylesheet" href="${contextPath}/resources/css/path.css" />
<link rel="stylesheet" href="${contextPath}/resources/css/detail.css" />
<!-- <link rel="stylesheet" href="${contextPath}/resources/css/path.css" > --> 
<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<style>
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:22%;margin:10px 0 10px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.9);z-index: 1;font-size:12px;border-radius: 10px;}
a{text-decoration:none; color:white;}
.liii {
		list-style: none;
		border-width: 1px;
		border-style: solid;
		border-color: red;
		padding : 10px;
}
.dateD{
	font-size:30px;
	font-weight:400px;
	font-family: 'Nanum Pen Script', fantasy;
	margin-left:80%;
}
.titleD{
  margin-bottom: 12px;
  text-align: center;
  font-family: 'Nanum Pen Script', fantasy;
  font-size:65px;
}
</style>
<script type="text/javascript">
	function add_path(latitude ,longitude, placeName) {
	
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/path/addPlan.do?articleNO="+${articleNO},
			data : {
				
				latitude:latitude,
				longitude:longitude,
				placeName:placeName
			},
			success : function(data, textStatus) {
				//$("#sortable").children().remove();
				 //$("#sortable").html(data);
				 $('#list').load(location.href+' #list');
			},
			error : function(request, status, error, data) {
				 alert("status : " + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error+"ddd " + data);
			},
			complete : function(data, textStatus) {
				
			}
		}); //end ajax	var regNO=Number(regNO);
	}
	
	function delete_map(regNO) {
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/path/removeMap.do",
			data : {
				regNO : regNO
			},
			success : function(data, textStatus) {
				//$("#sortable").children().remove();
				 //$("#sortable").html(data);
				 $('#list').load(location.href+' #list');
			},
			error : function(data, textStatus) {
				alert("에러가 발생했습니다."+data);
			},
			complete : function(data, textStatus) {
				
			}
		}); //end ajax	var regNO=Number(regNO);
	}
	
	
</script>
</head>
<body>
<br>

      <h1 align="center" class="titleD">${pathVO.title}</h1>
	<br>
	<div class="dateD">${pathVO.s_date} ~ ${pathVO.e_date}</div>
	
		<div class="map_wrap">
		<div id="map" style="width:100%;height:100%;position:absolute;overflow:hidden;"></div>
			<div id="menu_wrap" class="bg_white">
				<div class="option">
				    <div>
					    <form onsubmit="searchPlaces(); return false;">
	                    키워드 : <input type="text" value="천안" id="keyword" size="17"> 
	                    <button type="submit">검색하기</button> 
	                </form> 
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
			</div>
		</div>
		
		<br>
		<!-- <form name="articleForm" method="post"   action="${contextPath}/path/addNewMap.do" > -->
		
	  <div id="list">
		<ul id="sortable">
		<c:choose>
			<c:when test="${empty mapMap.mapList}">
	
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${mapMap.mapList}" varStatus="cnt">
	     			 <!--<c:set var="regNO" value="${mapMap.mapList[cnt.count-1].regNO}" /> -->
	     			
				        <li class="item mouse-effect stagger-item">
				          <div class="num">${cnt.count}</div>
				            <div class="title">${item.placeName } 
				            </div>
				            <div class="deleteB">
				            <input class="delete_button" type="submit" id="삭제" value="삭제" onClick=" delete_map('${regNO}')"></div>
				        </li>
			     </c:forEach>
			 </c:otherwise>
		</c:choose>
	   	</ul>
	 </div>
		
		<input class="da" type="submit" value="동선 확인" onClick="location.href='${contextPath}/path/detail.do?articleNO=${articleNO}'">
		<input class="db" type="submit" value="목록창" onClick="location.href='${contextPath}/path/path.do'">
<!-- 	</form>  -->
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=b4687789a7700428ccb729bdaf4ac246&libraries=services"></script>
	<script type="text/javascript">
	//마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({ zindex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	        
	     // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();

	        for (var i=0; i<data.length; i++) {
	            displayMarker(data[i], i);    
	            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
	        }       

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT && data=='입력하세요') {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	//////////////////////
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
				
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	        
	    	// 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, place) {
	            kakao.maps.event.addListener(marker, 'click', function() {
	            	displayMarker(place,i);
	            });
	   
	            kakao.maps.event.addListener(marker, 'click', function() { 
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	            	displayMarker(place,i);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';   
	     
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	// 지도에 마커를 표시하는 함수입니다
function displayMarker(place, i) {
		var placePosition = new kakao.maps.LatLng(place.y, place.x),
        marker = addMarker(placePosition, i);
	
		
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {

    	var content = '<div style="padding:5px;font-size:12px;">' + place.place_name +'</div>';
        	content += '<input type="hidden" id="lat" value='+place.x+'>';
    	content += '<input type="hidden" id="long" value='+place.y+'>';
    	content += '<input type="hidden" id="name" value='+place.place_name+'>';
    	//content += '<input type="hidden" id="articleNO" value="articleNO">';
    	content += '<input type="submit" id="저장" onClick=" add_path(latitude, longitude, placeName)">';
    
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
        
      	
        latitude=document.getElementById("lat").value;
        longitude=document.getElementById("long").value;
        placeName=document.getElementById("name").value;
    });
	
}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

</script>


</body>
</html>