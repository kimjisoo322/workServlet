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
<!-- 로그인 실패 : 메세지 처리 
     로그인 성공 : 박스를 보여주지 않고 alert 로그인에 성공하였습니다. abc님 환영합니다.
-->
<%
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
	
		out.print("id : " + id  + "<br>");
		out.print("pw : " + pw + "<br>" );
	
	
		// 아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		out.print(saveYN);
		
		out.print("saveYN: " + saveYN);
		// 체크박스가 체크되었을 경우, 아이디를 쿠키에 저장
		if(saveYN != null && "Y".equals(saveYN)){
			out.print("쿠키 생성실행중입니다.");
			CookieManager.makeCookie(response, "userid", id, 60*60*27*7);
		}
		// 만약 아이디가 abc , 비밀번호가 123이면 로그인 성공
		// id != null && id.equals("abc") : 이 경우는 id가 널이 아니면을 작성해주고 써야함! 
		if("abc".equals(id)&& "123".equals(pw)){
		// 로그인 성공

		out.print("로그인을 성공하였습니다.");
		
		// 세션에 저장
		session.setAttribute("id", id);
		
		// 요청할 페이지 정보 
		response.sendRedirect("gogreen.jsp");
	}else{
		// 로그인 실패
		out.print("로그인에 실패하였습니다.");
		// 요청할 페이지 정보 
		//response.sendRedirect("gogreen.jsp?loginErr=Y");
	}
%>
</body>
</html>