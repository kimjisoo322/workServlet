<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go(page){
		document.searchForm.pageNo.value=page;
		document.searchForm.submit();
	}
</script>
</head>
<body>
<!--  PageDto를 영역에 저장  -->
<%--    <%
   		PageDto pageDto = new PageDto(300, new Criteria(1));
   %> --%>
	<c:set var = "pageDto" value ="<%=pageDto%>"></c:set>
	
	<c:if test="${pageDto.prev}">
	  <input type="button" value="<<" onclick="go(1)">
	</c:if>
	
		<!-- 이전버튼 -->
	<c:if test="${pageDto.prev }">
		<input type='button' value='<' onclick='go(${pageDto.startNo-1})'>
	</c:if>
	
	<!-- 페이지번호 출력 -->
	<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
		<input type='button' value='${i }' onclick='go(${i})'>
	</c:forEach>
	
	<!-- 다음버튼 -->
	<c:if test="${pageDto.next }">
		<input type='button' value='>' onclick='go(${pageDto.endNo+1})'>		
	</c:if>

	
	<c:if test="${pageDto.next}">
	  <input type="button" value=">>" onclick="go(${pageDto.realEnd + 1})">
	</c:if>

<%-- <%
	
	if(pageDto.isPrev()){
		out.print("<input type='button' value='<<' onclick='go(1)'>");
	}
	
	if(pageDto.isPrev()){
		out.print("<input type='button' value='<' onclick='go("+(pageDto.getStartNo()-1)+")'>");
	}
	
	for (int i = pageDto.getStartNo(); i <= pageDto.getEndNo(); i++){
		out.print("<input type='button' value= '"+i+"' onclick = 'go("+i+")' >" );	
	}
	
	if(pageDto.isNext()){
		out.print("<input type='button' value='>' onclick ='go("+(pageDto.getEndNo()+1)+")'>");
	}
	
	if(pageDto.isNext()){
		out.print("<input type='button' value='>>' onclick ='go("+(pageDto.getRealEnd()+1)+")'>");
	}
%> --%>

</body>
</html>