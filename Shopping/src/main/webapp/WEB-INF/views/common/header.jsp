<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
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
function logout(){
	if(confirm("로그아웃 하시겠습니까?")){
		location.href = '/user/login/logout.do';
	}
}
</script>
</head>
<body>

<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/">Pet Shop</a></h1>
		</div>
		<div id="menu">
			<ul><li class="current_page_item"><a href="/" accesskey="1" title="">Homepage</a></li>
				<li><a href="#" accesskey="2" title="">Products</a></li>
				<li><a href="#" accesskey="3" title="">About Us</a></li>
				<li><a href="#" accesskey="4" title="">Board</a></li>
				<li><a href="#" accesskey="5" title="">Contact Us</a></li>
				<!-- 로그아웃 상태일 때 -->
				<c:choose>
					<c:when test="${sessionScope.m_id == null}">
						<li><a href="/loginpage" accesskey="6" >login</a></li>
					</c:when>
				</c:choose>
				<!-- 로그인 상태일 때 -->
				<c:choose>
					<c:when test="${sessionScope.m_id != null}">
						<li><a accesskey="6" onclick="logout()" style="cursor:pointer;">logout</a></li>
					</c:when>
				</c:choose>
			</ul></div>
	</div>
</div>

</body>
</html>