<%@page import="dao.NewBoarderDao"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../Session/isLogin.jsp"></jsp:include>
<%
	
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = (session.getAttribute("UserId") == null)? "":(String)session.getAttribute("UserId");
	
	String pageNo = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");
	
	NewBoarderDao nbo = new NewBoarderDao();
	Board board = new Board();

	board.setTitle(title);
	board.setContent(content);
	board.setNum(num);
	board.setId(id);
	
	int res = nbo.updatePost(board);
	
	if(res > 0){
		JSFunction.alertLocation("게시글 수정 완료되었습니다.", "../8게시판/View.jsp?num="+board.getNum()+"&pageNo="+pageNo, out);
	}else{
		JSFunction.alertBack("게시글 수정 오류", out);
	}
%>

</body>
</html>