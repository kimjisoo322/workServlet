<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function go(page){
		location.href = "PageNav.jsp?pageNo="+page;
	}
</script>
</head>
<body>
<!-- 
	1. PageDto 객체를 가지고 페이지 블럭을 생성 
		- 페이지블럭의 시작번호
		- 페이지블럭의 끝번호 
		- 게시물의 끝 페이지 번호 
		- 이전/다음 버튼을 출력할지 여부 
 -->
<%
	// 총게시물수, 검색조건(페이지번호, 페이지당게시물수, 검색어, 검색조건)
	
	// 페이지 번호를 받아서 페이지 번호가 null이면 1을 아니면 숫자를 받음 (pageNo는 정수형으로 변환)
	int pageNo = request.getParameter("pageNo") ==null ? 1 :Integer.parseInt(request.getParameter("pageNo"));	
	
	
// ** totalCnt , pageNo 세팅 필수 ** 
	Criteria criteria = new Criteria(pageNo);
	int totalCnt = 300;
	
	// 객체에 초기화된 값을 통해 페이지 블럭을 보여줌 
	PageDto pageDto = new PageDto(totalCnt,criteria);
	
	//시작 페이지번호가 1보다 큰 경우 이전버튼을 출력
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
