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
	try{
	// 사용자의 요청을 담고있는 내장 객체: request 
	// (getParameter) 사용자가 넘겨준 파라메터(정보)를 읽어옴  -> 오류 발생 (string 타입)
	// jsp의 출력은 out.print
	int age = Integer.parseInt(request.getParameter("age"));
	out.print("당신의 나이는" + age + "입니다.");
	} catch(Exception e){
		// 오류 메세지 작성1 
		out.print("예외발생 : " + e.getMessage());	
%>
	<!-- 오류메세지 작성2 -->
	<h1>오류가 발생하였습니다. <p>관리자에게 문의해주세요.</p> <%=e.getMessage() %></h1>
<%
	}
%>
</body>
</html>
