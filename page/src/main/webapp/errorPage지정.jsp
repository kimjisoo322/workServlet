<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage = "errorPage.jsp"%>
    <!-- errorPage : 오류가 발생 시 보여줄 페이지를 지정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 현재 페이지에서 오류가 발생했을 때 (만들어둔) 오류페이지로 이동하도록 / 에러페이지를 지정 -->
<% 
	// 사용자의 요청을 담고있는 내장 객체: request 
	int age = Integer.parseInt(request.getParameter("age"));

	// 화면에 출력
	out.print("당신의 나이는" + age + "입니다.");
	
%>

</body>
</html>
