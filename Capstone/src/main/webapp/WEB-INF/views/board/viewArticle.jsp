<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
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
<style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
    /* .zoom {
	  width: 40%;
	  height: auto;
	  margin: 0 auto;
	  transform: scale(1.0);
      transition: transform .5s; 
	}
	
	.zoom:hover {
	  transform: scale(2.0);
	  transition: .5s; 
	}
	.box{text-align: center;}*/
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "get");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
	 
 </script>
</head>
<body>

<div class="board_wrap">
        <div class="board_title">
            <strong>게시판</strong>
            <p>여러분의 이야기를 나눠보세요^^</p>
        </div>
   <div class="board_list_wrap">
  <div class="board_view">
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  	<div class="title"> 
  				<dl>
  					<dt style="font-size: 30px;">제목</dt>
                    	<dd><input type=text value="${article.title }"  name="title" class="titleq" id="i_title" disabled /></dd>
                </dl>
                </div>
                <div class="info">
                   <dl>
                        <dt>번호</dt>
                        <dd><input class="introq" type="text"  value="${article.articleNO }"  disabled />
   		 					<input type="hidden" name="articleNO" value="${article.articleNO}"  />
    					</dd>
                    </dl>
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input class="introq" type=text value="${article.member_id }" name="writer"  disabled /></dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd><input class="introq" type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled /></dd>
                    </dl> 
                </div>
                <br>
                <div class="cont" style="font-size : 30px;">
                   <textarea class="Atextarea" rows="20" cols="60"  name="content"  id="i_content"  disabled >${article.content }</textarea>
                </div>
                <c:choose>
                <c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
                	<div class="box">
                	<input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
		    		<img width="40%" height="auto" src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" class="zoom" id="preview"/><br>
		    		</div>
		    		<input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
    			</c:when>
    			<c:otherwise>
    				<input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    				<input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
    			</c:otherwise>
    			</c:choose>
            <div class="bt_wrap">
            <div id="tr_btn_modify">
	            <input class="dd" type=button value="등록하기"   onClick="fn_modify_article(frmArticle)"  >
	            <input class="dw" type=button value="취소"  onClick="location.href='${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}'">
            </div> 
            
            	<div id="tr_btn"><c:if test="${memberInfo.member_id == article.member_id}">
		      		<input class="dd" type=button value="수정하기" onClick="fn_enable(this.form)">
		      		<input class="dw" type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.articleNO})">
	    			</c:if><input class="dd"  type=button value="게시판목록"  onClick="location.href='${contextPath}/board/listArticles.do'">
	    	 	</div>
	    	 
	    	 
	    </div>
	</form>
	</div> 
 </div>
 </div>
</body>
</html>