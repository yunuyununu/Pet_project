<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type">
<title>Insert title here</title>
<meta name="keywords" content="">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="description" content="">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900%7CQuicksand:400,700%7CQuestrial" rel="stylesheet">
<link href="/resources/static/css/default.css" rel="stylesheet" type="text/css" media="all">
<link href="/resources/static/css/fonts.css" rel="stylesheet" type="text/css" media="all">

<script>
$(document).ready(function(){
	$("#btnLogin").click(function(){
		//태그.val() : 태그에 입력된 값
		//태그.val("값") : 태그의 값을 변경
		var adminId = $("#a_id").val();
		var adminPw = $("#a_passwd").val();
		if(adminId == ""){
			alert("아이디를 입력하세요.");
			$("#a_id").focus(); //입력포커스 이동
			return; //함수 종료
		}
		if(adminPw == ""){
			alert("비밀번호를 입력하세요.");
			$("#a_passwd").focus(); //입력포커스 이동
			return; //함수 종료
		}
		//폼 내부의 데이터를 전송할 주소
		document.form1.action="/admin/login.do";
		//제출
		document.form1.submit();
	})
})
</script>

</head>
<body>
<h2>관리자 로그인</h2>
	<form name="form1" method="post">
		<table border="1" width="400px">
			<tr>
				<td>아이디</td>
				<td><input name="a_id" id="a_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="a_passwd" id="a_passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="btnLogin"></button>
					<c:if test="${msg == 'failure'}">
						<div style="color: red">
							아이디 또는 비밀번호가 일치하지 않습니다.
						</div>
					</c:if>
				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>