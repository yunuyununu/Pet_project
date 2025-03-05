<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type">
<title>로그인 | Pet Shop</title>
<meta name="keywords" content="">
<meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
<meta name="description" content="">
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900%7CQuicksand:400,700%7CQuestrial" rel="stylesheet">
<link href="/resources/static/css/default2.css" rel="stylesheet" type="text/css" media="all">
<link href="/resources/static/css/fonts.css" rel="stylesheet" type="text/css" media="all">
<script src="http://code.jquery.com/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="/resources/static/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script>
function login(){
	var userid = $("#m_id").val();
	var userpw = $("#m_passwd").val();
	
	if(userid == ""){
		alert("아이디를 입력하세요.");
		$("#m_id").focus(); //입력포커스 이동
		return false; //함수 종료
	}
	if(userpw == ""){
		alert("비밀번호를 입력하세요.");
		$("#m_passwd").focus();
		return false;
	}
	//폼 내부의 데이터를 전송할 주소
	document.loginForm.action="/user/login/login.do";
	//제출
	document.loginForm.submit();
}
function join(){
	location.href = '/user/member/join';
}
</script>
</head>
<body>

<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo" align="center">
			<h1><a href="/">Pet Shop</a></h1>
		</div>
		
	</div>
</div>

<div class="container">
  <div class="row">
    <div class="col-3"></div>
    <div class="col-6">
      <h3 class="text-bold" align="center">로그인</h3>
      <form name="loginForm" method="post">
	<!-- action="/user/login/login.do" -->
		<div>
			<table align="center" style="border-collapse:separate; border-spacing: 10px 10px;">
					<tr>
						<td>아이디</td>
						<td><input type="text" name="m_id" id="m_id" class="form-control" placeholder="아이디를 입력하세요"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="m_passwd" id="m_passwd" class="form-control" placeholder="비밀번호를 입력하세요"></td>
					</tr>
					<tr>
						<td>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    아이디 저장
							  </label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button" value="회원가입" class="btn btn-outline-secondary" onclick="join()">
						<input type="button" value="로그인" class="btn btn-outline-success" onclick="login()"></td>
					</tr>
					<c:if test="${message == 'failure'}">
					    <script>
					            alert("아이디 또는 비밀번호가 틀렸습니다.");
					    </script>
					</c:if>
				</table>
		</div>
	</form>
    </div>
    <div class="col-3"></div>
  </div>
</div>

</body>
</html>