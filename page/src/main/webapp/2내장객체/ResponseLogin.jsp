<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pwd");
	
	out.print("id : " + id  + "<br>");
	out.print("pw : " + pw + "<br>" );
	
	// 만약 아이디가 abc , 비밀번호가 123이면 로그인 성공
	
	// id != null && id.equals("abc") : 이 경우는 id가 널이 아니면을 작성해주고 써야함! 
	if("abc".equals(id)&& "123".equals(pw)){
		// 로그인 성공
		out.print("로그인을 성공하였습니다.");
		// 요청할 페이지 정보 
		response.sendRedirect("ResponseWelcome.jsp");
	}else{
		// 로그인 실패
		//﻿ -> 사용자로부터 전달받은 request객체가 공유되므로 아이디를 출력할 수 있다.(redirect시 null)
		out.print("로그인 실패");
		RequestDispatcher rd = request.getRequestDispatcher("ResponseMain.jsp?loginErr=Y");
		rd.forward(request, response);
	
		// 요청할 페이지 정보 
		//response.sendRedirect("ResponseMain.jsp?loginErr=Y");
	}
%>
</body>
</html>