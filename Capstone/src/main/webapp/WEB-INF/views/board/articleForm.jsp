<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<html>
<head>
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css" />
	<link rel="stylesheet" href="${contextPath}/resources/css/media.css" />
	<script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/main.css">
	<script type="text/javascript">
	   
	 function readURL(input) {
	      if (input.files && input.files[0]) {
		      var reader = new FileReader();
		      reader.onload = function (e) {
		        $('#preview').attr('src', e.target.result);
	          }
	         reader.readAsDataURL(input.files[0]);
	      }
	  }  
	  function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
	  }
	  
	  var cnt=1;
	  function fn_addFile(){
		  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
		  cnt++;
	  }  
	</script>
	 <title>글쓰기창</title>
	</head>
	<body>
	<div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>여러분의 이야기를 나눠보세요^^</p>
        </div>
	  <form name="articleForm" method="post"   action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
	    <div class="board_wrtie_wrap">
            <div class="board_view">
                <div class="title">
                    <dl>
                        <dt style="font-size: 30px;">제목</dt>
                        <dd><input type="text" class="titleq" name="title" placeholder="제목 입력"/></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                      <dt>글쓴이</dt>
                      <dd><input type="text" class="introq"  value="${memberInfo.member_id }" readonly></dd>
                    </dl>
                </div>
                <br>
                <div class="cont">
                    <textarea class="Atextarea" name="content" rows="10" cols="65" maxlength="4000"></textarea>
                </div>
        		<div class="imageFile">
        			<input type="file" name="imageFileName"  onchange="readURL(this);" />
        			<img  id="preview" src="#"   width=200 height=200/>
        		</div>
            </div>
          
            <div class="bt_wrap">
                <input class="dd" type="submit" value="동록" />
		       <input class="dw" type=button value="취소"onClick="location.href='${contextPath}/board/listArticles.do'" />
            </div>
        </div>
	  </form>
	  </div>
	</body>
	</html>