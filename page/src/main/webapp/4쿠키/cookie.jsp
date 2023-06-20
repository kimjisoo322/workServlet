<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	cookie
	 : 클라이언트의 상태 정보를 클라이언트 pc에 저장! 
	   로그인 아이디를 저장하거나, 팝업창을 제어하는데 주로 사용됨
	   요청 시 요청헤더에 쿠키정보를 포함하여 요청한다.
	   -3000개까지 생성 가능 
	   -하나의 호스트 또는 도메인당 50개까지 생성 가능
	   -쿠기 하나당 최대 크기 : 4096byte
	   
	 [쿠키의 속성]
	   도메인 : 쿠키를 적용할 도메인
	   경로 : 쿠리를 적용할 경로
	   유지기간 : 쿠기를 유지할 기간
 -->
 
 <h1> 1. 쿠키 설정 </h1>
 <%
 
 	/*
 		쿠키설정 
 		new Cookie(이름, 값); 
  		 이름 : 쿠키를 구별하는 이름
  		 값  : 쿠키에 저장할 실제 데이터 
 	*/
//Cookie(String name, String value)  name                     value
 	Cookie cookie = new Cookie("myCookie", URLEncoder.encode("쿠키정쿠키", "utf-8"));
  //쿠키가 적용될 경로를 지정 (하위경로까지 사용가능)
  //request.getContextPath() : request객체로부터 컨텍스트 루트 경로 조회 -> 웹애플리케이션 전체에서 쿠키를 사용하겠다는 의미
  	cookie.setPath(request.getContextPath());

  //쿠키가 유지될 기간을 조단위로 지정. (3600 = 1시간)
  cookie.setMaxAge(3600);		 
  // 생성된 쿠키를 응답 객체에 추가 
  response.addCookie(cookie);
  
 %>
 <h2> 2. 페이지 이동 후 쿠키 값 확인하기 </h2>
 <a href = "CookieResult.jsp"> 쿠키값 확인하기</a>
 
</body>
</html>






