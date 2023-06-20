<%@page import="dto.Member"%>
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
		// request 영역에 객체 생성 -> foward 영역에서 출력

		// 객체를 생성해서 memberObj에 저장 > 꺼낼 때 사용 
		request.setAttribute("memberObj", new Member("JK", "", "정국", "2023-06-19"));
		request.setAttribute("stringObj", "문자열");
		pageContext.setAttribute("stringObj", "문자열");
		request.setAttribute("integerObj", new Integer(77));
		
	%>
	<h2> 객체 매개변수 </h2>
	<jsp:forward page="ObjectParamResult.jsp">
		<jsp:param value="10" name="firstNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>

</body>
</html>