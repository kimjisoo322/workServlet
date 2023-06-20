<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키를 활용한 팝업창 제어</h2>
	
	<%
		// 하루동안 팝업창이 열리지 않도록 쿠키 생성 
		 // -> 만들어놓은 쿠키 메서드 활용 (CookieManager.makeCookie) 
		CookieManager.makeCookie(response, "PopupClose", "Y", 60*60*24);
		 // 팝업을 클릭하고 
		//response.sendRedirect("PopupMain1.jsp");
	%>
</body>
</html>