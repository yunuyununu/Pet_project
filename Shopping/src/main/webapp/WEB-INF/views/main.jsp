<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a>DB 연결 및 화면로딩 확인</a>
	<table border="1">
		<tr>
			<td>${map.dto.userid}</td>
			<td>${map.dto.passwd}</td>
			<td>${map.dto.name}</td>
			<td>${map.dto.email}</td>
			<td>${map.dto.join_date}</td>
			<td>${message}</td>
		</tr>
	</table>
</body>
</html>