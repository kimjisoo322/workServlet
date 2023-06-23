<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
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
<title>First 게시판</title>
</head>
<body>

<%
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	String pageNo = request.getParameter("pageNo");
	
	Criteria criteria = new Criteria(searchField, searchWord, pageNo);
	
	BoardDao bdao = new BoardDao();
	List<Board> list = bdao.getListPage(criteria);
	
	
	// 검색어를 입력하게 되면 상단에 보여줌 
	if(searchField != null){
	out.print("입력하신 검색어는 : " + searchWord + "입니다." + "<br>");
	}
	
	// 총 건수  출력
	int totalCnt = bdao.getTotalCnt(criteria);
	 
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

총건수 : <%=totalCnt %>건 

<!--  검색폼 -->
<form name ="searchForm">
	<table border ='1' width ="90%">
	<input type ='text' name = 'pageNo' value='<%=criteria.getPageNo()%>'>
		<tr>
		<td align = "center">
			<select name ="searchField">
				<option value = "title">제목</option>
				<option value = "content">내용</option>
				<option value = "ID">작성자</option>
			</select>
			
			<input type="text" name = "searchWord" value ="<%=(criteria.getSearchWorld() == null)?"":criteria.getSearchWorld() %>">
			<input type ="submit" value ="검색하기">
		</td>
		</tr>
		
	</table>
</form>

<!-- 게시판 목록 보여주기 -->
<table border = '1' width ="90%">

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
            <td align ="center"><%= board.getNum() %></td>
            <td align ="center"><a href = "View.jsp?num=<%= board.getNum() %>&pageNo=<%=criteria.getPageNo()%>"><%= board.getTitle()%></a></td>
            <td align ="center"><%= board.getContent() %></td>
            <td align ="center"><%= board.getId() %></td>
            <td align ="center"><%= board.getPostdate() %></td>
            <td align ="center"><%= board.getVisitcount() %></td>
        </tr>
        
	<% }%>	
	<% }%>
</table>
	
<!--  로그인한 사람만 글쓰기 버튼을 클릭할 수 있음 -->
<%
	if(session.getAttribute("member") != null){
%>

<!--  글쓰기 버튼 -->
<table border ='1' width ="90%">
	<tr>
		<td align = "right">
		<input type ="submit" value ="글쓰기" onclick ="location.href = 'Write.jsp'">
			
		</td>
	</tr>
</table>
<%} %>

<%
	PageDto pageDto = new PageDto(totalCnt,criteria);
%>
<table border ='1' width ="90%">
	<tr>
		<td align = "center">
			<%@include file ="../6Session/PageNav.jsp"%>
		</td>
	</tr>
</table>

</body>
</html>