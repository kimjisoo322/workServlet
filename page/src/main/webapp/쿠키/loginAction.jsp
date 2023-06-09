<%@page import="util.CookieManager"%>
<%@page import="java.net.URLEncoder"%>
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
		// name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환 합니다.
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		// 아이디 저장 체크박스
		String saveYN = request.getParameter("save_check");
		out.print(saveYN);
		
		// 아이디 저장하기 체크박스에 체크가 되었다면 쿠키에 아이디를 저장.
		// 문자열로 비교하면 null 체크안해됨
		if("Y".equals(saveYN)){
			
			// 쿠키 메서드 
			// cookiemanager를 이용해 쿠키를 생성하고 응답객체에 담아준다. 
			CookieManager.makeCookie(response, "userid", id, 3600);
			
		
			
			// 쿠키 생성해서 reponse에 담아주기 
			// id는 userid, 사용자 아이디
			/*
			Cookie cookie= new Cookie("userid",id);
			
			// 유지기간 설정	
			cookie.setPath(request.getContextPath());	
			cookie.setMaxAge(3600);
			
			//응답객체에 담기
			response.addCookie(cookie);
			*/
		}
		
		
		if("abc".equals(id)
				&& "123".equals(pw)){
			
			out.print("로그인 성공");
			response.sendRedirect("login.jsp?name="+id);
	%>

			<h1>로그인 성공</h1>
	<%
		} else {
			out.print("로그인 실패");
		}
	%>
	
</body>
</html>



















