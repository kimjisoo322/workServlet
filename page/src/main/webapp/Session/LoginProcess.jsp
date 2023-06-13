<%@page import="java.util.List"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Link.jsp" />
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	
	MemberDao dao = new MemberDao();
	Member member = dao.login(id, pw);
	
	if(member != null){
		// 로그인 성공 -> 세션에 member객체를 저장
		session.setAttribute("UserId", member.getId());
		session.setAttribute("member", member);
		
		//로그인에 성공하면 board에 있는 게시물을 보여줘! ! 
		response.sendRedirect("Board.jsp");
	} else {
		// 로그인 실패 -> loginForm 페이지로 이동, 오류메세지 출력
		request.setAttribute("LoginErrMsg"
									, "아이디,비밀번호가 일치하지 않습니다.");
		
		// LoginForm.jsp로 이동
		// request영역을 공유하기 위해 forward 사용
		request.getRequestDispatcher("LoginForm.jsp")
									.forward(request, response);
	}


%>



</body>
</html>














