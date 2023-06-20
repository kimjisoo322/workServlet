<%@page import="dto.PageDto"%>
<%@page import="dto.Criteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%

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
%>
</body>
</html>