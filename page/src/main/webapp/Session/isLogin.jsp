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
	<%
		if(session.getAttribute("UserId") == null){
			JSFunction.alertLocation("로그인 후 이용가능한 페이지입니다.", "LoginForm.jsp", out);
		}
	%>
</body>
</html>