<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="java.util.List"%>
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
<%
	BoardDao bdao = new BoardDao();
	List<Board> list = bdao.getList();

	int totalCnt = bdao.getTotalCnt();
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	// 검색어가 null이 아니면 검색 기능을 추가!! 
	out.print(searchWord);
	out.print(searchField);
	
%>

<jsp:include page="Link.jsp" />

<!--  ~님 환영합니다 출력 -->
<%
	String name = "";
	if(session.getAttribute("member") != null) {
		Member member =(Member)session.getAttribute("member");	
		name = member.getName();
%>		 
	<h2><u><%= name%></u>님 환영합니다.</h2> <h3> 원하시는 목록을 선택해주세요 :)</h3>
<% }%>


<h4> < 목록보기(List) > </h4>

총건수 : <%=totalCnt %>

<form>
	<table border ='1' width ="90%">
		<tr>
		<td align = "center">
			<select name ="searchField">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
			</select>
			
			<input type="text" name = "searchWord" value ="<%=searchWord%>">
			<input type ="submit" value ="검색하기">
		</td>
		</tr>
		
	</table>
</form>

<!-- 게시판 목록 보여주기 -->
<table border = '1' width ="90%">
	<tr>
		<td>게시판</td>
	</tr>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
		if(list.isEmpty()){
	%>
		<tr>
			<td colspan ="5" align ="center"> 등록된게시물이 없습니다.</td>
		</tr>
	<%
		} else{
	for(Board board : list) {
	%>
        <tr>
            <td><%= board.getNum() %></td>
            <td><%= board.getTitle()%></td>
            <td><%= board.getContent() %></td>
            <td><%= board.getId() %></td>
            <td><%= board.getPostdate() %></td>
            <td><%= board.getVisicount() %></td>
        </tr>
        
	<% }%>	
	<% }%>
</table>
	
<!--  글쓰기 버튼 -->
<table border ='1' width ="90%">
	<tr>
		<td align = "right">
		<input type ="submit" value ="글쓰기">
		</td>
	</tr>
</table>


</body>
</html>