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

	String num = request.getParameter("num");
	
	BoardDao bdao = new BoardDao();
	
	int res = bdao.delete(num);
	
	if(res > 0) {
		JSFunction.alertLocation("게시글이 삭제 완료되었습니다.", "Board.jsp", out);
	}else{
		JSFunction.alertBack("게시글 삭제 중 오류 발생!", out);
	}
	
%>
</body>
</html>