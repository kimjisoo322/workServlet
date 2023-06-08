<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  sessionId를 발급 -> 응답객의 쿠키에 담아서 웹브라우저로 전송
       				 -> 웹 브라우저는 응답을 받아서 쿠키에 저장 -> 서버에 요청시 쿠키정보를 담아서 요청 
       				 
       사용자가 웹브라우저를 열고 서버에 접근해서 웹브라우저를 닫을 때까지 
       요청하는 모든 페이지는 세션객체를 공유할 수 있다. 
       회원인증 후 로그인 상태를 유지하는 처리에 사용됨 
        (로그인 상태에서 웹브라우저를 닫으면 로그아웃이 되는 이유이다.) 
       웹브라우저를 닫았다가 다시 열면 세션객체에 저장된 값이 사라지는 것을 확인할 수 있다. -->
       
<%	
	/*
		브라우저를 닫았다가 새로 열면 쿠키에 저장된 세션ID값이 변경되므로 세션이 유지되지 않는다
	*/
	session.setAttribute("person", new Person("정국", 31));
	
	// 리스트로 담아보기 
	ArrayList<String> list = new ArrayList<String>();
	list.add("list");
	list.add("set");
	list.add("map");
	
	session.setAttribute("list", list);
%>
<h2> 페이지 이동된 후 session 영역의 속성 읽기 </h2>
<a href = "SessionLocation.jsp">SessionLocation.jsp 바로가기</a><br>
<a href = "Sessioninvalidate.jsp">Sessioninvalidate.jsp.jsp 바로가기</a>
</body>
</html>