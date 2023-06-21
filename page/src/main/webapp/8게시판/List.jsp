<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="dao.NewBoarderDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Second 게시판</title>
</head>
<body>
<%@ include file ="../6Session/Link.jsp" %>
<%
	// 검색 조건
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWorld");
	
	/*
		parameter는 String 타입으로 받아오는 것
	*/
	String pageNo = request.getParameter("pageNo") == null ? "1" : request.getParameter("pageNo");

	Criteria criteria = new Criteria(searchField, searchWord, pageNo);

	NewBoarderDao nbo = new NewBoarderDao();
	//List<Board> list = nbo.getList(criteria);
	List<Board> list = nbo.getListPage(criteria);
	
	// 총 건수  출력
	int totalCnt = nbo.getTotalCnt(criteria);
%>

    <h2>목록 보기(List)</h2>
    
    <!-- 검색폼 --> 
    <form method="get" name ="searchForm">  
    <table border="1" width="90%">
    <input type="text" name ='pageNo' value ='<%=pageNo %>'>
    <tr>

        <td align="center" height ="50px" style = 'background-color: skyblue;'>
            <select name="searchField" > 
                <option value="title"<%=(criteria.getSearchField().equals("title"))? "selected" : ""%>>제목</option> 
                <option value="content"<%=(criteria.getSearchField().equals("content"))? "selected" : ""%>>내용</option>
                <option value="ID" <%=(criteria.getSearchField().equals("ID"))? "selected" : ""%>>작성자</option>
            </select>
            <input type="text" name="searchWorld" height ="50px" value ="<%=(criteria.getSearchWorld() == null)?"":criteria.getSearchWorld() %>" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    총 건수 :<%= totalCnt %>건
    
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width ="10%" >번호</th>
            <th width ="10%" >제목</th>
            <th width ="10%" >내용</th>
            <th width ="10%" >작성자</th>
            <th width ="10%" >작성일</th>
            <th width ="10%" >조회수</th>
        </tr>
        <!-- 목록의 내용 --> 
	<%
		if(list.isEmpty()){
	%>
		<tr>
			<td colspan = '4'>게시물이 없습니다.</td>
		</tr>		
	<% } else{
		for(Board board : list){
	%>
        <tr align="center">
            <td><%=board.getNum()%></td>  <!--게시물 번호-->
            <td align="left"><a href ="View.jsp?num=<%=board.getNum() %>&pageNo=<%=pageNo%>"><%=board.getTitle() %></a>  <!--제목(+ 하이퍼링크)-->
            </td>
            <td align="left"><%=board.getContent()%>  <!--제목(+ 하이퍼링크)-->
            </td>
            <td align="center"><%=board.getId()%></td>          <!--작성자 아이디-->
            <td align="center"><%=board.getPostdate()%></td>    <!--작성일-->
            <td align="center"><%=board.getVisitcount()%></td>  <!--조회수-->
        </tr>
	<%	} 
 	}
    %>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <%
    	if(session.getAttribute("UserId") != null && !"".equals(session.getAttribute("UserId"))){
    	
    %>
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='../8게시판/Write.jsp'">글쓰기</button></td>
        </tr>
    </table>
    <% } %>
    
    <!--  
    	페이지블럭 생성 시작 
    	  - 총 건수 (totalCnt) 
    	  - 쿼리수정 (총 건수를 구하는 쿼리 메서드  -getTotalCnt) 
    	  - form의 이름을 searchForm으로 지정 
    	  - pageNo 필드를 생성
     -->
   <%
   		PageDto pageDto = new PageDto(totalCnt, criteria);
   %>
<table border="1" width="90%">
	<tr>
        <td align="center">
            <%@ include file = "../6Session/PageNav.jsp" %>
        </td>
        </tr>
</table>
</body>
</html>
