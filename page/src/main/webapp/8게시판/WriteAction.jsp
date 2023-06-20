<%@page import="dto.Board"%>
<%@page import="dao.NewBoarderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file = "../6Session/isLogin.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content =  request.getParameter("content");
	
	// 아이디가 세션 만료되면 로그아웃되기 때문에 아이디가 null이면 공백처리
	String id = (session.getAttribute("UserId") == null)? "" : (String)session.getAttribute("UserId");
	
	
	NewBoarderDao nbo = new NewBoarderDao();
	Board board = new Board();
	
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	
	int res = nbo.insert(board);
	
	if(res > 0){
		JSFunction.alertLocation("게시글 등록 성공!", "List.jsp", out);
	}else{
		JSFunction.alertBack("게시글 등록 실패, 관리자 확인", out);
	}
%>
</body>
</html>