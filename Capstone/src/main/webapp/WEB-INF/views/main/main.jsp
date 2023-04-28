<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/slide.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>  
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
		const toggleBtn = document.querySelector(".navbar__toogleBtn");
		const menu = document.querySelector(".navbar__menu");
	
		toggleBtn.addEventListener('click', () => {
		    menu.classList.toggle('active');
		    
		});
	</script>
	<style type="text/css">
	#suggest{
		display:none; position: absolute; left: 830px; top:80px; border: 0.1px  solid #87cb42; z-index:3;font-weight: bold;background-color:#ffffff; 		
	}
	</style>
</head>
<div class="small-tomato">
		</div>
<body>
<video muted autoplay loop id="bgvid">
	    <source src="${contextPath}/resources/img/video5.mp4" type="video/mp4" style="width:100%; height:auto;">
	</video>

	<div class="container">
	
        <form name="frmSearch" action="${contextPath}/fstvl/searchFstvl.do" class="box">
            <h1> 
                무엇을 찾으시나요? </h1>
            <input name="searchWord" type = "text" placeholder="입력하세요" onKeyUp="keywordSearch()" >
            <input type = "submit" name="search" value = "검색">
        </form>
        
    </div>
     <div id="suggest">
        <div id="suggestList"></div>
   </div>
    <script>
    	var counter = 1;
		    setInterval(function(){
		    document.getElementById('radio'+counter).checked = true;
		    counter++;
		    if(counter > 4)
		        counter = 1;
		}, 3000)
    </script>
    
    <!-- <nav>
    <div class="slide_box">
        <div class="slider">
            <div class="slides">
                <input type="radio" name="radio-btn" id="radio1">
                <input type="radio" name="radio-btn" id="radio2">
                <input type="radio" name="radio-btn" id="radio3">
                <input type="radio" name="radio-btn" id="radio4">
                
                <div class="slide first">
                    <img src="${contextPath}/resources/img/a1.jpg" alt="">
                </div>
                
                <div class="slide">
                    <img src="${contextPath}/resources/img/a2.jpg" alt="">
                </div>
                
                <div class="slide">
                    <img src="${contextPath}/resources/img/a3.jpg" alt="">
                </div>
                
                <div class="slide">      
                    <img src="${contextPath}/resources/img/a4.jpg" alt="">
                </div> -->
  <!--<img src="${contextPath}/resources/img/fstvl/${item.fstvlNm}.png" alt="">  -->
               <!--  <div class="navigation-auto">
                    <div class="auto-btn1"></div>
                    <div class="auto-btn2"></div>
                    <div class="auto-btn3"></div>
                    <div class="auto-btn4"></div>
                </div>
            </div>
  
            <div class="navigation-manual">
                <label for="radio1" class="manual-btn"></label>
                <label for="radio2" class="manual-btn"></label>
                <label for="radio3" class="manual-btn"></label>
                <label for="radio4" class="manual-btn"></label>
            </div>
        </div>
    </div>
 </nav>    --> 
</body>
</html>