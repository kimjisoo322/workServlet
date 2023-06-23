<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> MVC 모델 2 게시판 - 목록보기(list)</h2>


<!--  검색폼 -->
<form name ="searchForm">
	<input type="text" name ='pageNo' value ="${param.pageNo }"></input>
	<table border ='1' width ="90%">
		<tr>
		<td align = "center">
			<select name ="searchField">
				<option value = "title"${param.searchField eq "title" ? "selected" : ""}>제목</option>
				<option value = "name"${param.searchField eq "name" ? "selected" : ""}>작성자</option>
			</select>
			
			<input type="text" name = "searchWord" value = "${param.searchWord}" ></input>
			<input type ="submit" value ="검색하기">
		</td>
		</tr>
		
	</table>
</form> 

<c:set var = "totalCnt" value = "${totalCnt}"></c:set>
총 건수: ${totalCnt} 

<a href = "../mvcboard/list.do">ListController 바로가기</a>

<c:set var="fileList" value="${requestScope.list }"></c:set>

<table border = '
1' width = "90%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
		<th>첨부</th>

	</tr>
	
	<c:forEach items = "${fileList}" var = "mvcDto">
	
	<c:if test="${empty fileList}">
		<tr>
			<td colspan = "6" align = "center"> 등록된 게시물이 없습니다. </td>
		</tr>
	</c:if>
	<c:if test="${not empty fileList}">
		<tr>
		<td>${mvcDto.idx }</td>
		<td>
		<a href="../mvcboard/view.do?idx=${mvcDto.idx }">
		${mvcDto.title }</a></td>
		<td>${mvcDto.name }</td>
		<td>${mvcDto.visitcount }</td>
		<td>${mvcDto.postdate }</td>
		<td></td>
		</tr>
	</c:if>
	</c:forEach>
	</table>

<!--  글쓰기 버튼 + 페이징 처리-->
<table border ='1' width ="90%">
	<tr>
		<td align ="center">
		<%@include file ="PageNav.jsp"%>
			</td>
		
		<td align = "center">
		<input type ="submit" value ="글쓰기" onclick ="location.href ='../mvcboard/write.do'">
		</td>
	</tr>
</table>

</body>
</html>