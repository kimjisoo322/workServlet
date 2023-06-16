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
<jsp:include page="Link.jsp" />
<jsp:include page="isLogin.jsp"></jsp:include>
<%
	/* request.setCharacterEncoding("utf-8"); */

	//1. 폼값을 입력받아서 DTO 객체 생성
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	 // 사용자가 로그아웃을 하지않았더라도 일정시간이 경과되면 세션이 제거되어 오류가 발생할 수 있음 > 아이디를 못찾아서 null 
	 // jsp 파일이 컴파일 실행하다가 오류발생 !  
	String id = (session.getAttribute("UserId")==null) ? "" : session.getAttribute("UserId").toString();
	
	BoardDao bdao = new BoardDao();
	Board board = new Board();

	// 2. DTO 객체를 생성 > 처음에는 비어있어서 set으로 넣어줌 
	board.setTitle(title);
	board.setContent(content);
	board.setNum(num);
	board.setId(id);

	int upres = bdao.update(board);
	
	// 3. 수정성공 : 리스트 페이지로 이동 / 실패 : 메세지 처리
	if(upres > 0){
		JSFunction.alertLocation("게시글이 수정되었습니다.", "View.jsp?num=" + board.getNum() , out);
		} else{
			JSFunction.alertBack("수정 중 오류가 발생하였습니다.", out);
	 	} 

 	%>
</body>
</html>