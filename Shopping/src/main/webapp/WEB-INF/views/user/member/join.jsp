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
//아이디 중복 체크
 $(document).ready(function() {
	$("#idCheckBtn").click(function(){
		var mId = $("#m_id").val();
		
		if(mId.length < 4){
			$("#idCheckMessage").text("아이디는 4자 이상이어야 합니다.").css("color","red");
			return;
		}
		
		$.ajax({
			type:"POST",
			url : "/user/member/id_check.do",
			data: { m_id: mId },
			success : function(response) {
				if(response == 1){
					$("#idCheckMessage").text("사용 불가").css("color","red");
				} else {
					$("#idCheckMessage").text("사용 가능").css("color","green");
				}
			}
		});
	});
 });
//회원가입
function join(){
	var mId = $("#m_id").val();
	var mPw = $("#m_passwd").val();
	var mTel = $("#m_tel").val();
	var mEmail = $("#m_email").val();
	var mBirth = $("#m_birth").val();
	
	if(mId == ""){
		alert("아이디를 입력하세요.");
		$("#m_id").focus(); //입력포커스 이동
		return false; //함수 종료
	}
	if(mPw == ""){
		alert("비밀번호를 입력하세요.");
		$("#m_passwd").focus();
		return false;
	}
	if(mBirth == ""){
		alert("생년월일을 입력하세요.");
		$("#m_birth").focus();
		return false;
	}
	if(mTel == ""){
		alert("전화번호를 입력하세요.");
		$("#m_tel").focus();
		return false;
	}
	if(mEmail == ""){
		alert("이메일을 입력하세요.");
		$("#m_email").focus();
		return false;
	}
	//폼 내부의 데이터를 전송할 주소
	document.join.action="/user/member/join.do";
	//제출
	document.join.submit();
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
    <div class="col-4"></div>
    <div class="col-4" align="center">
      <h3 class="text-bold">회원가입</h3>
      <form name="join" method="post">
	<!-- action="/user/login/login.do" -->
		<div>
			<table width="450px" style="border-collapse:separate; border-spacing: 10px 10px;">
					<tr>
						<td>이름</td>
						<td><input type="text" name="m_name" id="m_name" class="form-control" placeholder="이름"></td>
						<td></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="m_id" id="m_id" class="form-control" placeholder="아이디"></td>
						<td><input type="button" value="중복확인" id="idCheckBtn" class="btn btn-light"></td>
					</tr>
					<tr>
						<td></td>
						<td><span id="idCheckMessage"></span></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="m_passwd" id="m_passwd" class="form-control" placeholder="영문/숫자/특수문자 혼합 8~20자"></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="m_passwd" id="m_passwd" class="form-control" placeholder="비밀번호를 한번 더 입력하세요."></td>
						<td></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="number" name="m_birth" id="m_birth" class="form-control" placeholder="주민번호 앞자리"></td>
						<td></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="m_tel" id="m_tel" class="form-control" placeholder="전화번호"></td>
						<td></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="m_email" id="m_email" class="form-control" placeholder="ex)abcd@gmail.com"></td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    (필수) 본인은 만 14세 이상입니다.
							  </label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    (필수) 이용약관
							  </label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    (필수) 개인정보수집 및 이용동의
							  </label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
							  <label class="form-check-label" for="flexCheckDefault">
							    (선택) 개인정보 마케팅 활용 동의
							  </label>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="center">
						<input type="button" value="회원가입" class="btn btn-outline-success" onclick="join()"></td>
					</tr>
				</table>
		</div>
	</form>
    </div>
    <div class="col-4">
    </div>
  </div>
</div>

</body>
</html>