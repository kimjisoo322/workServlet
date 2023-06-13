<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	Session : 클라이언트의 상태 정보를 저장, 로그인 기능 구현하는데 사용됨 
	 
	 http 통신은 요청과 응답으로 구성되어 있다. 
	 클라이언트에서 서버로 페이지를 요청을 하면 서버는 페이지를 응답해주고 통신은 종료되는 것
	 
	 서버는 어떻게 로그인 상태를 유지시켜줄까? 
	  - 클라이언트에서 웹브라우저로 서버에 최초로 접근시 
	  -> 웹 서버는 웹브라우저에게 세션아이디를 발급 
	  -> 세션 아이디는 쿠키로 생성되어 응답 객체의 쿠키에 담겨 클라이언트로 전송 
	   	  개발자 도구의 쿠키를 확인해보면 JSESSIONID라는 값이 입력되어 있다. = 여기 저장된 값이 세션 아이디 ! 
	   	  (웹 브라우져를 새로 열고 서버에 접근시 쿠키에 저장된 셔센ID값이 변경된것을 확인할 수 있음)
	   	  
	   	  
	  세션의 유지시간 : (로그인하고 시간 지나면 다시 로그인하겠냐고 요청 받는게 세션의 유지시간과 관련) 
	  
	  - 클라이언트가 유지시간내 요청이 없는 경우 해당 세션은 서버에서 제거됨. 
	  - 유지시간 만료되기 전 새로운 요청이 들어오면 유지시간 연장.
 -->
 <%
 	
 	//session.setMaxInactiveInterval(10);
 
 	// long 타입 -> 날짜 형식으로 포맷
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
 	long creationTime =  session.getCreationTime(); // 최초 요청(세션생성) 시각
 	// long타입을 -> 날짜 형식의 타입으로 바꾸고 -> 출력 형식을 시간으로 출력하게끔 String타입으로 반환 
 	String creationTimeStr = sdf.format(new Date(creationTime));
 	
 	
 	long lastTime = session.getLastAccessedTime();// 마지막 요청 시각
 	String lastTimeStr = sdf.format(new Date(lastTime));
 	
  %>
  <h2> Session 설정 확인 </h2>
  
  <ul>
  	<li>최초 요청 시각 : <%=creationTimeStr %></li>
  	<li>마지막 요청 시각 : <%=lastTimeStr %></li>
  	<li>세션 아이디 : <%=session.getId() %></li>
  	<li>세션 유지시간 : <%=session.getMaxInactiveInterval() %></li>
  </ul>
  
</body>
</html>