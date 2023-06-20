<%@page import="org.apache.catalina.util.URLEncoder"%>
<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키, HTTP 헤더, 컨텍스트 초기화 매개변수 출력하기</title>
</head>
<body>
<h2>쿠키, HTTP 헤더, 컨텍스트 초기화 매개변수 출력하기</h2>
<%
/*
	쿠키, 헤더값을 읽을 수 있는 내장객체를 제공
	
	cookie : 쿠키를 읽을 때 사용
	header : 헤더 정보를 읽을 때 사용
	initParam : web.xml 에 설정한 컨텍스트 초기화 매개변수를 읽을 때 사용
	pageContext : JSP의 pageContext 객체와 동일한 역할 
*/
%>
<%
	// 쿠키 생성
	// 요청 시점에 header 영역에 담아감 -> 첫번째 요청에서 생성된 쿠키정보를 클라이언트에 전달 -> 클라이언트 영역에 쿠키 생성됨! 
	// 두번째 요청때부터 쿠키 값을 가져가서 정보를 출력할 수 있는 것 
	CookieManager.makeCookie(response,"ELCookie","쿠키먹고싶다", 10);

%>
	<h3>쿠키 값 읽기</h3>
	<li> ${cookie.ELCookie.value} </li>

	<h2>HTTP 헤더 읽기</h2>
	<ul>
		<li>host :  ${header.host}</li>
		<li>user-agent : ${header['user-agent']}</li>
		<li>cookie : ${header.cookie} </li>
	</ul>
	
	<h3> 컨텍스트 초기화 매개변수 </h3>
	<li>${initParam.INIT_PARAM }</li>
	<li>${initParam.OracleDriver }</li>
	
	
	<h3>컨텍스트 루트 경로 읽기</h3>
	<li>${pageContext.request.contextPath}</li>


</body>
</html>