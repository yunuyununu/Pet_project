<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="/resources/static/css/bootstrap.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
html, body {
	height: 100%;
}

* {
	font-family: "Noto Sans Korean", sans-serif;
	font-weight: 400;
	font-style: normal;
}
Header {  
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  
  height: 75px;
  padding: 1rem;
  color: white;
  background: #6699CC;
  font-weight: bold;
  font-size: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.form-signin{
    max-width: 350px;
    position: absolute;
    width: 100%;
    padding-top: 10px;
    height: 200px;
    top: 400px; /* 전체 높이 위에서부터 절반 */
    left: 50%; /* 전체 넓이 왼쪽에서부터 절반 */
    transform: translate(-50%, -50%); /* 해당 요소의 높이, 넓이의 절반만큼 돌아가기 */
  	border: 1px solid white;
  	box-shadow: 0 2px 5px rgba(0,0,0,.25);
  }
table {
  border-spacing: 5px;
  border-collapse: separate;
  line-height: 120%;
}
</style>
<script>
function login(){
		//태그.val() : 태그에 입력된 값
		//태그.val("값") : 태그의 값을 변경
		var adminId = $("#a_id").val();
		var adminPw = $("#a_passwd").val();
		
		if(adminId == ""){
			alert("아이디를 입력하세요.");
			$("#a_id").focus(); //입력포커스 이동
			return false; //함수 종료
		}
		if(adminPw == ""){
			alert("비밀번호를 입력하세요.");
			$("#a_passwd").focus();
			return false;
		}
		
		//폼 내부의 데이터를 전송할 주소
		document.form1.action="/admin/adlogin.do";
		//제출
		document.form1.submit();
	}
</script>
</head>
<body>

<header>
	<nav>
		<div class="container-fluid">
			<a class="navbar-brand">
				<a>Management System</a>
			</a>
		</div>
	</nav>
		<div align="right" style="position: static;">
			<a class="navbar-brand" href="/">
				<input type="button" value="홈페이지" class="btn btn-outline-light">
			</a>
		</div>
</header>
<div id="body-wrapper">
	<div id="body-content">
		<main id="login" class="form-signin">
		<h2 align="center">Manager Login</h2>
			<form name="form1" method="post">
				<table align="center">
					<tr>
						<td width="100px">아이디</td>
						<td width="170px"><input name="a_id" id="a_id" class="form-control"></td>
					</tr>
					<tr>
						<td width="100px">비밀번호</td>
						<td width="170px"><input type="password" name="a_passwd" id="a_passwd" class="form-control"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" id="btnlogin" value="로그인" class="btn btn-dark" onclick="login()">						
						</td>
					</tr>
					<c:if test="${message == 'failure'}">
					    <script>
					            alert("로그인 실패");
					    </script>
					</c:if>
				</table>
			</form>
		</main>
	</div>
</div>
</body>
</html>