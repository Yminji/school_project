<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="fstvl" value="${fstvlMap.fstvlVO }"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/main.css" />
<link rel="stylesheet" type="text/css" media="screen" href="${contextPath}/resources/css/animation.css" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link rel="stylesheet" href="${contextPath}/resources/css/fstvlDetail.css" />
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet" />    
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
					//imagePopup('open', '.layer01');	
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
	<div class="text-area">
      <h1>${fstvl.fstvlNm}</h1>
    </div>
	<a href="https://www.seoularirangfestival.com/intro_aboutfestival"><img class="bookmark"src="${contextPath}/resources/img/icon/bookmark.svg" alt="" /></a>
    <section>
      <div class="detail_img">
        <a href="https://www.seoularirangfestival.com/intro_aboutfestival"><img class="detailimg" src="${contextPath}/resources/img/festival_test.jpg" alt="" /></a>
      </div>
      <dl>
        <dt>일시</dt>
        <dd>${fstvl.fstvlStartDate} ~ ${fstvl.fstvlEndDate }</dd>
        <dt>장소</dt>
        <dd>${fstvl.opar}</dd>
        <dt>주최</dt>
        <dd>서울특별시, (사)서울아리랑페스티벌조직위원회</dd>
        <dt>후원</dt>
        <dd>문화체육관광부, 문화재청, 한국문화예술위원회, 한국관광공사, 제과전문그룹 크라운-해태</dd>
      </dl>
    </section>
    <div class="content">
      아리랑의 유네스코 인류무형문화유산 등재를 기념해 2013년부터 서울특별시와 (사)서울아리랑페스티벌조직위원회 공동주최로 매년 10월 서울 광화문광장 일대에서 여는 도심 속
      복합문화예술축제입니다. 해마다 음악 · 무용 · 시각예술 등으로 아리랑의 예술적 영역을 확장하며 시대정신에 맞는 문화콘텐츠를 만들어 내는 서울의 대표 축제로 자리매김했습니다.
      2019서울아리랑페스티벌은 조선시대 궁중문화와 서민문화가 한데 어우러졌던 광화문의 역사적 의미를 담아 ‘광화문, 아리랑을 잇다’를 주제로 펼쳐집니다. 궁중정재와 국내외 최고의
      아티스트들로 구성된 아리랑슈퍼밴드가 선사하는 개막공연. 개성파 뮤지션들의 대표곡과 자신들의 감성으로 재편곡한 아리랑을 선보이는 광화문뮤직페스티벌. 전통공연예술의 맥을
      이어가는 연희프로그램을 비롯해 전국의 모든 아리랑 보존회가 처음으로 광화문광장에 모여 한마음 한뜻으로 만드는 축제의 하이라이트 판놀이길놀이 등 다채로운 프로그램을 선보입니다.
    </div>

    <h1 class="way">오시는 길</h1>
    <div class="map">
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
    </div>
</body>
</html>