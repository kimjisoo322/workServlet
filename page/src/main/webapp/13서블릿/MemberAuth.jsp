<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC 패턴으로 회원 인증하기 </h2>
	
	<P>${authMessage}</P>
	<!--  ?속성=값 &연결
	
		${pageContext.request.contextPath }/13서블릿/ = ./ -->
	<a href= "./MemberAuth?id=suzisu&pass=1234">test로그인</a>

</body>
</html>