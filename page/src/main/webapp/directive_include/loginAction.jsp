<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  form 태그 : 서버에 페이지를 요청 (form안에 있는 요소들을 파라메터로 가져감) -->

   
	<%
	// name 속성의 값을 매개값으로 넘겨주면 value 속성의 값을 반환합니다. 
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		if("abc".equals(id) && "123".equals(pw)){
			// 페이지를 적어뒀기 때문에 다른 페이지를 다시 요청해서 그 결과를 받아서 보여주는 것 = sendRedirect
	%>	
		<script>alert("로그인 성공")</script>
		
	<%
			response.sendRedirect("login.jsp?name=" +id);
	%>
			
	<%	
		} else{
			out.print("로그인 실패");
		}
		
	%>
	
</body>
</html>