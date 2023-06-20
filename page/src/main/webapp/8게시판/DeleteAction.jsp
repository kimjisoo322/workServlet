<%@page import="common.JSFunction"%>
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
<jsp:include page="../6Session/isLogin.jsp"></jsp:include>
<%
	String num = request.getParameter("num");
	NewBoarderDao nbo = new NewBoarderDao();
	
	int res = nbo.deletePost(num);
	
	if(res > 0){
		JSFunction.alertLocation("게시글 삭제가 완료되었습니다.", "../8게시판/List.jsp", out);
	}else{
		JSFunction.alertBack("게시글 삭제 오류발생! ", out);
	}
%>
</body>
</html>