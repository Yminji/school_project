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
	    obj.action="${contextPath}/board/listBoard.do";
	    obj.submit();
	  }
	  
	  var cnt=1;
	  function fn_addFile(){
		  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
		  cnt++;
	  }  
	</script>
</head>
<body>
 <form name="addBoard" method="post"   action="${contextPath}/board/addBoard.do"   enctype="multipart/form-data">
	<div class="board_wrtie_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="title" placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                      <dt>글쓴이</dt>
                      <dd><input type="text" value="${member_id }"></dd>
                    </dl>
                    <dl>
                        <dt>비밀번호</dt>
                        <dd><input type="password" placeholder="비밀번호 입력"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea name="content"  rows="10" cols="65" maxlength="4000" placeholder="내용 입력"></textarea>
                </div>
        
            </div>
          
            <div class="bt_wrap">
                <input type="submit" value="글쓰기" />
                <a href="${contextPath}/board/listBoard.do" class="on">취소</a>>
            </div>
        </div>
</form>
</body>
</html>