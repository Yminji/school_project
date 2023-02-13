<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function fn_overlapped(){
		var _id = $("#_member_id").val();
		if(_id==''){
			alert("ID를 입력하세요");
			return;
		}
		$.ajax({
			type:"post",
			asyn:false,
			url:"${contextPath}/member/overlapped.do",
			dataType:"text",
			data:{id:_id},
			success:function(data, textStatus){
				if(data=='false'){
					alert("사용할 수 있는 ID입니다.");
					$('#btnOverlapped').prop("disabled", true);
					$('#_member_id').prop("disabled", true);
					$('#member_id').val(_id);
				}else{
					alert("사용할 수 없는 ID입니다.");
				}
			},
			error:function(data, textStatus){
				alert("에러가 발생했습니다.");
			},
			complete:function(data, textStatus){
				
			}
		});
	}
</script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${contextPath}/resources/css/memberForm.css">

    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <title>사이트</title>
    <script src="https://kit.fontawesome.com/3b62b241c8.js" crossorigin="anonymous"></script>
</head>
<body>
	<h3>필수입력사항</h3>
	<form action="${contextPath}/member/memberForm.do" method="post">
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input type="text" name="_member_id" id="_member_id" size="20"/>
							<input type="hidden" name="member_id" id="member_id"/>
							
							<input type="button"  id="btnOverlapped" value="중복확인" onClick="fn_overlapped()" />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td><input name="member_pw" type="password" size="20"/></td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">이름</td>
						<td><input name="member_name" type="text" size="20"/></td>
					</tr>
 				</tbody>
			</table>
		</div>
		<div class="clear">
		<br><br>
		<table align=center>
			<tr>
				<td>
					<input type="submit" value="회원가입">
					<input type="reset"  value="다시입력">
				</td>
			</tr>
		</table>
		</div>
	</form>
</body>
</html>