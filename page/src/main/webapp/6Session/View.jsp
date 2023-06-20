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
<% 
	BoardDao bdao = new BoardDao();

	String pageNo = (request.getParameter("pageNo") == null) ? "1" : request.getParameter("pageNo");

	// 조회수 증가 
	bdao.updateVisit(request.getParameter("num"));
	
	// 게시글 1건을 조회한 후 board 객체에 담아서 반환
	Board board= bdao.selectOne(request.getParameter("num"));
	
 	if(board == null){
		JSFunction.alertBack("게시글이 존재하지 않습니다.", out);
		// 게시글이 존재하지 않으면 더이상 실행 할 필요가 없어서 return 
		return;
	} 
%> 
<script>
	function deletePost(){
		var result = confirm("삭제 하시겠습니까?");
		
		if(result){
			location.href ="DeleteProcess.jsp?num=<%=board.getNum()%>"
		}
	}
</script>
</head>
<body>

<jsp:include page="Link.jsp" />
<h2> 상세보기 </h2>
	<table border ='1' width = "90%">
		<tr>
			<td>번호</td>
			 <td align ="center"><%= board.getNum() %></td>
			<td>작성자</td>
			 <td align ="center"><%= board.getId() %></td>
		</tr>
		
		<tr>
			<td>작성일</td>
			<td align ="center"><%= board.getPostdate() %></td>
			<td>조회수</td>
			 <td align ="center"><%= board.getVisitcount() %></td>
		</tr>
		
		<tr>
			<td >제목</td>
			<td colspan = "3" align ="center"><%= board.getTitle()%></td>
		</tr>
		
		<tr>
			<td>내용</td>
			 <td colspan = "3" align ="center" height = "100px"><%= board.getContent() %></td>
		</tr>
		
		<tr>
			<td colspan = '4' align = "center">
			
				<button type="button" onclick="location.href='Board.jsp?pageNo=<%=pageNo%>'">
                    목록 보기</button>
                <%
                	     if(session.getAttribute("UserId") != null){
                 %>

                  <button type="button" onclick="location.href='EditLocation.jsp?num=<%=board.getNum()%>&pageNo=<%=pageNo%>'">수정하기</button>
                  <button type="button" onclick="deletePost()">삭제하기</button>
                	    	 
               <%  }  else {
               }
                %>
			</td>
		</tr>

	</table>
	
	
</body>
</html>