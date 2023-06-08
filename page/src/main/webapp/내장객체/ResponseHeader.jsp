<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Collection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	/*
		response 객체는 응답 헤더에 정보를 추가하는 기능을 제공
		add.. () : 응답 헤더 추가
		set.. () : 응답 헤더 수정
	*/
	//ResponseMain의 HTTP 응답 헤더 설정
	String add_date = request.getParameter("add_date");
	String add_int = request.getParameter("add_int");
	String add_str = request.getParameter("add_str");
	response.addHeader("str",add_str);
	response.addIntHeader("int", Integer.parseInt(add_int));
	/*
		문자열을 날짜형식으로 변환 
		날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00" /><br /> 
	*/
	SimpleDateFormat s = new SimpleDateFormat("yyyy-mm-dd HH:mm");
	s.parse(add_date).getTime();
	response.addDateHeader("date", s.parse(add_date).getTime());
	
	Collection<String> headerNames = response.getHeaderNames();
	for(String hName: headerNames){
		String hValue = response.getHeader(hName);
%>
	<li><%= hName %>:<%= hValue %></li>
<%

	}

%>



</body>
</html>