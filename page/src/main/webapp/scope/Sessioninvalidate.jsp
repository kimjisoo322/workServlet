<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션 무효화 
	// 세션의 기본 유효시간은 30분 
	session.invalidate();
%>
세션이 무효화되었습니다.
<a href = "SessionLocation.jsp">SessionLocation.jsp 바로가기</a>

<!-- 
(결과)
session에 저장된 person 없음
session에 저장된 list 없음
 = 세션이 무효화되었기때문에 더이상 값을 읽어올 수 없어서 
 -->
</body>
</html>