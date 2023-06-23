<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="FileUpload.FileDto"%>
<%@page import="FileUpload.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dto.PageDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 *** </title>
</head>
<body>
<h2> DB에 등록된 파일 목록 보기 </h2>
 <a href= "FileUpload.jsp"> 파일등록하기</a>

<%-- <%
	out.print("req : " + request.getAttribute("list"));
	
%>
<p>req : ${requestScope.list }</p> --%>

<a href="${pageContext.request.contextPath}/12파일업로드/FielServlet"> FielServlet 바로가기</a>

<c:set var="fileList" value="${requestScope.list }"></c:set>

<table border ="1" >
	<tr>
		<th>No</th>
		<th>작성자</th>
		<th>제목</th>
		<th>카테고리</th>
		<th>원본 파일명</th>
		<th>저장된 파일명</th>
		<th>작성일</th>
		<th> </th>
	</tr>
	
	<c:forEach items="${fileList }" var = "fileDto">
	<c:if test="${empty fileList }">
		<tr>
			<td colspan ="7" align ="center"> 등록된 게시물이 없습니다. </td>
		</tr>
		
	</c:if>
	<c:if test="${not empty fileList }">
		<tr>
				
		<td align ="center">${fileDto.idx}</td>
		<td align ="center">${fileDto.name }</td>
		<td align ="center">${fileDto.title }</td>
		<td align ="center">${fileDto.cate }</td>
		<td align ="center">${fileDto.ofile }</td>
		<td align ="center">${fileDto.sfile }</td>
		<td align ="center">${fileDto.postdate }</td>
		<td align ="center">
		<a href ="Download.jsp?oName=${fileDto.ofile}&sName=${fileDto.sfile}">다운로드</a>
		</td>
		</tr>			
</c:if>
	</c:forEach>
</table>
	
	    <!--  
    	페이지블럭 생성 시작 
    	  - 총 건수 (totalCnt) 
    	  - 쿼리수정 (총 건수를 구하는 쿼리 메서드  -getTotalCnt) 
    	  - form의 이름을 searchForm으로 지정 
    	  - pageNo 필드를 생성
     -->
   <%
   		Criteria criteria = new Criteria();
   		PageDto pageDto = new PageDto(10, criteria);
   %>
<table border="1" width="100%" >
	<tr>
        <td align="center">
            <%@ include file = "../6Session/PageNav.jsp" %>
        </td>
        </tr>
</table>
</body>
</html>
