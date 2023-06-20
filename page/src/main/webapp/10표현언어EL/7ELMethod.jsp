<%@page import="util.CookieManager"%>
<%@page import="el.myElClass"%>
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
	myElClass myClass = new myElClass();
	pageContext.setAttribute("myClass", myClass);
	pageContext.setAttribute("response", response);
	
%>
<h3> 영역에 저장 후 메서드 호출하기 </h3>
	990322-2124575 => ${myClass.getGender("990322-2124575") }<br>
	990322-2124575 => ${myClass.getGender("990322-1124575") }<br>
	
<h3> 정적메서드 호출하기</h3>
구구단  ${myClass.showGugudan(7)}	

<h3> 정적메서드 호출하기 -쿠키생성하기 </h3>
${CookieManager.makeCookie(response, "ELCookie", "EL좋아융", 10)}
${cookie.ELCookie.value}

</body>
</html>