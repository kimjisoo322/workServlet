<%@page import="common.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file = "isLogin.jsp" %>


<!--  insert : 1. 입력값을 받아서 (박스에 담고 2. insert메서드 호출 > db에 게시글을 등록하고 결과를 숫자로 변환
               3. 등록성공 : 리스트 페이지로 이동 / 실패 : 메세지 처리  -->
<%
	request.setCharacterEncoding("utf-8");

	//1. 폼값을 입력받아서 DTO 객체 생성
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	 // 사용자가 로그아웃을 하지않았더라도 일정시간이 경과되면 세션이 제거되어 오류가 발생할 수 있음 > 아이디를 못찾아서 null 
	 // jsp 파일이 컴파일 실행하다가 오류발생 !  
	String id = (session.getAttribute("UserId")==null) ? "" : session.getAttribute("UserId").toString();
	
	Board board = new Board();
	BoardDao bdao = new BoardDao();

	// 2. DTO 객체를 생성 > 처음에는 비어있어서 set으로 넣어줌 
	board.setTitle(title);
	board.setContent(content);
	board.setId(id);
	
	int res = bdao.insert(board);
	
	// 3. 등록성공 : 리스트 페이지로 이동 / 실패 : 메세지 처리
	if(res > 0){
		JSFunction.alertLocation("게시글이 등록되었습니다. (공통로직호출)", "Board.jsp", out);

	} else{
		JSFunction.alertBack("등록 중 오류가 발생하였습니다. (공통로직호출)", out);
 	} 
 	%>
</body>
</html>