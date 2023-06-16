<%@page import="dto.Criteria"%>
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
<%
	NewBoarderDao nbo = new NewBoarderDao();
	
	nbo.updateVisitCount(request.getParameter("num")); //조회수 증가
	 
	Board board= nbo.selectOne(request.getParameter("num"));  //상세보기 
	
	//String pageNo = request.getParameter("pageNo");
	
	if(board == null){
		JSFunction.alertBack("존재하지 않는 게시물입니다.", out);
		return;
	}
%>
<script>
 // 삭제하기 버튼을 누르면 delPost() 함수 실행 -> 삭제하냐고 물어보기 
	function delPost(){
		var res =confirm("정말로 삭제하시겠습니까?");
	if(res){
		location.href = "DeleteAction.jsp?num=<%=board.getNum()%>"
	}	
 }
</script>
</head>
<body>

<jsp:include page="../Session/Link.jsp"></jsp:include>
<h2>회원제 게시판 - 상세 보기(View)</h2>

    <table border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%=board.getNum() %></td>
            <td>작성자</td>
            <td><%=board.getId() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%=board.getPostdate() %></td>
            <td>조회수</td>
            <td><%=board.getVisitcount() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%=board.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100"><%=board.getContent() %>
            </td> 
        </tr>
        <% 
        	if(session.getAttribute("member") != null && !"".equals("member")){
        %>
        <tr>
            <td colspan="4" align="center">
            
                <%
                	String pageNo = (request.getParameter("pageNo") == null) ? "1" : request.getParameter("pageNo");
                %>
                <button type="button" onclick = "location.href ='Edit.jsp?num=<%=board.getNum()%>&pageNo=<%=pageNo%>'">수정하기</button>
                <button type="button" onclick = "delPost()">삭제하기</button> 
                <button type="button" onclick = "location.href ='List.jsp?pageNo=<%=pageNo%>'">목록보기</button>
            </td>
        </tr>
        <% } else { %>
        <% } %>
    </table>

</body>
</html>
