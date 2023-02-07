<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON TEST</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" >
	$(function(){
		getJson();
	});
	
	//json 데이터 읽어오는 함수
	function getJson(){
		//festivalData.json에서 데이터 가져와 function(data)로 처리 후 data에 저장
		$.getJSON("json/festivalData.json", function(data){
			$.each(data, function(key, value){ //data 가져와서 key, value 나눠서 저장
				if(key == "DESCRIPTION"){ //키가 description 일때
					$("table").attr("border", "1");
				
					$("thead").append(
						"<tr>" +
						"<th>" + val.fstlNm+"</th>" +
						"<th>" + val.opar + "</th>" +
						"<th>" + val.fstvlStartDate + "</th>" +
						"<th>" + val.fstvlEndData + "</th>" +
						"<th>" + val.fstvlCo +"</th>" +
						"<th>" + val.phoneNumber +"</th>" + 
						"<th>" + val.homepageUrl +"</th>" +
						"<th>" + val.relateInfo + "</th>" + 
						"<th>" + val.rdnmadr+"</th>" +
						"<th>" + val.lnmadr + "</th>" + 
						"</tr>"
					);
				}else{
					var list = val; //배열 정의
					for(var i = 0; i < list.length; i++){
						var str = list[i]; //list 배열 안에 있는 하나의 json 데이터 저장
						$("tbody").append()
							"<tr>" + 
							"<td>" + str.
						);
					}
				}
			})
		})
		
	})
</script>
</head>
<body>
	<table border = "1">
		<thead>
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>