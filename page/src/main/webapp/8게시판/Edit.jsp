<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoarderDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>

</head>
<body>

<h2>회원제 게시판 - 수정하기(Edit)</h2>

<%
	NewBoarderDao nbo = new NewBoarderDao();
/*
		num가 오려면, view 페이지에서 수정하기 버튼을 눌렀을 때 num가 파라메터로 있어야 가져올 수 있음 
*/
	Board board = nbo.selectOne(request.getParameter("num"));
	if(board == null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		return;		
	}
%>
<form action = "EditAction.jsp">
	<input type = "text" name = "num" value = <%=board.getNum() %>></input>
	    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
           
                <input type="text" name="title" value="<%=board.getTitle()%>" style="width: 90%;"/>
              
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%=board.getContent()%></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <%
                	String pageNo = (request.getParameter("pageNo") == null) ? "1" : request.getParameter("pageNo");
                %>
                <button type="button" onclick="location.href='List.jsp?pageNo=<%=pageNo%>'">목록 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>