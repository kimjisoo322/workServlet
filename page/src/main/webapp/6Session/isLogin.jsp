<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  세션이 만료되었을 경우 아이디가 없으면 로그인 하라고 로그인 페이지를 보여줌 -->
	<%
		if(session.getAttribute("UserId") == null){
			JSFunction.alertLocation("로그인 후 이용가능한 페이지입니다.", "/0607page/Session/LoginForm.jsp", out);
		}
	%>
</body>
</html>