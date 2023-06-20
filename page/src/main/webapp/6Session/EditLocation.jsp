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

	<%
		BoardDao bdao = new BoardDao();
		
		// 게시글 1건을 조회한 후 board 객체에 담아서 반환
		Board board= bdao.selectOne(request.getParameter("num"));
		
	 	if(board == null){
			JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
			// 게시글이 존재하지 않으면 더이상 실행 할 필요가 없어서 return 
			return;
		}
	 	
    	String pageNo = (request.getParameter("pageNo") == null) ? "1" : request.getParameter("pageNo");
   
	%>
<h2> 수정하기 </h2>

	
<form name="writeFrm" method="post" action="EditProcess.jsp?num=<%=board.getNum()%>&pageNo=<%=pageNo%>">
	<input type = "text" name = "num" value =<%=board.getNum()%>></input>
	<table border ='1' width = "90%">
	
		<tr>
			<td >제목</td>
			<td colspan = "3">
			<input type="text" name="title"  value = "<%=board.getTitle()%>" style="width: 99%; height: 100px;"/>
			</td>
			
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan = "3">
			<textarea name="content" style="width: 99%; height: 100px;"><%=board.getContent()%>
			</textarea>
			</td>
			
		</tr>
		
		<tr>
            <td colspan="4" align="center">
                <button type="submit">수정 하기</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='Board.jsp?num=<%=board.getNum()%>&pageNo=<%=pageNo%>'">
                    목록 보기</button>
    	  </td>
        </tr>

	</table>
</form>
</body>
</html>