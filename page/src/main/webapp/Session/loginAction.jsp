<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.CookieManager"%>
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
		String pass = request.getParameter("userpw");
		String saveCheck = request.getParameter("saveCheck");
		
		// 체크박스가 체크되었을경우, 아이디를 쿠키에 저장 합니다.
		if(saveCheck != null && saveCheck.equals("Y")){
			out.print("쿠키 생성");
			CookieManager.makeCookie(response, "userId", id, 60*60*24*7);
		}
		
	/*
		MemberDao.login() : 아이디 비밀번호가 일치하는 사원이 잇으면 Member객체를 반환하고 없으면 null 반환
	*/		
		Member member = new Member();
		MemberDao dao = new MemberDao();
		Member loginMember = dao.login(id, pass);

		if (loginMember != null) {
    		// 아이디와 비밀번호가 일치하는 멤버가 있을 경우
    		member = loginMember;
    		session.setAttribute("member", member); // 세션에 멤버 저장
    		response.sendRedirect("login.jsp?name=" + id);
		} else {
   			 // 아이디와 비밀번호가 일치하는 멤버가 없을 경우
   			 response.sendRedirect("login.jsp?loginErr=Y");
		}

	%>
	
	
</body>
</html>