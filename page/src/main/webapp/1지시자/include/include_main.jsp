<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 외부파일 불러오기
	반복되는 부분을 별도의 파일에 작성해두고 필요한 페이지에서 include 지시어로 포함 
-->


<!-- 
<%! %> 전역변수 (선언부) => 내장객체 사용불가능

내장객체 사용 가능한 곳
<% %> _service(request, response){}
<%= %> 표현식 
 -->

<%@ include file ="include_header.jsp" %>

오늘 날짜: <%= today%>
<br>내일 날짜: <%= tomorrow %>
</body>
</html>