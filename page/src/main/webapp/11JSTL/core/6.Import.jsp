<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	import : 외부파일을 현재 위치에 삽입
		url : 외부파일의 파일 경로
		scope : 영역
		var : 변수명 (변수명을 사용하면 선언과 삽입을 분리)
		
	외부파일에 매개변수 넣기
	 -url의 쿼리스트링으로 전달
	 -c:param 태그 이용

 -->
 <c:import url="/6Session/Link.jsp" var ="link">
 	<c:param name="user_param2" value="헤더영역"></c:param>
 </c:import>
	
	<h4> 다른 문서 삽입하기 </h4>
	${link}
	
	<h4> iframe을 이용한 외부자원 삽입하기 </h4>

	<iframe src = "${pageContext.request.contextPath}/11JSTL/inc/GoldPage.jsp" style= "width:100%; height:100px;"></iframe>
	 
	<c:set var ="iTag">
		i 태그는 <i> 기울임 </i> 을 표현
	</c:set>
	
	${iTag}
	<h4> out 태그 기본사용</h4>
	<c:out value="${iTag}"></c:out>
	
	<h4>escapeXml 속성</h4>
	<!--  HTML 태그를 해석하여 마크업이 적용된 상태로 출력  -->
	<c:out value="${iTag}" escapeXml = "false"></c:out>
	
	<h4> default 속성</h4>
	<c:out value="${param.name}" default = "이름없음"/>
	<c:out value="" default = "빈 문자열도 값입니다."></c:out>
	
	<h4>redirect</h4>
	<!--  requst변수를 requset영역에 선언함 -->
	<!-- 하지만, OtherPape.jsp 에서 저장되는 값은 출력되지 않음을 알 수 있다 
	 why?   "  request 영역이 공유되지 않음 = redirect "  -->
	<c:set var="requestVar" value= "리퀘스트영역!" scope="request"></c:set>
	
<%-- 	<c:redirect url="/11JSTL/inc/OtherPage.jsp">
		<c:param name="param1" value = "출판사"></c:param>
		<c:param name="param2" value = "골든래빗"></c:param>
	</c:redirect>
	 --%>
	<h4> url 태그를 이용해서 링크 걸기 </h4>
	<!-- 
		c:url
			 - 지정한 경로와 매개변수를 이용해서 컨텍스트 루트를 포함한 url을 생성
			   a 태그의 href 속성이나 form태그의 action 속성에 이용할 수 있음
	 
	 	value : 경로 
	 	  var : 변수명
	 -->
	<a href="${pageContext.request.contextPath}/11JSTL/inc/OtherPage.jsp">페이지바로가기</a><br>
	
	<c:url value = "/11JSTL/inc/OtherPage.jsp" var="url"></c:url>
	<a href="${url }">url 태그를 이용한 바로가기 </a>
	
	<form action="${url}">
		<button>전송</button>
	</form>
	
	<h4> 예외처리 </h4>
	<!-- c : catch 태그 
	 			예외가 발생하면 지정한 변수에 에러메세지가 저장되어 전달 -->
	<%
		int num1 = 100;
	%>
	<c:catch var = "eMessage">
	<%
		int res = num1/0;
	%>
	</c:catch>
	예외내용 : ${eMessage }
	
	<h4> EL 에서의 예외</h4>
	<c:set var ="num2" value = "200"></c:set>
	<c:catch var = "eMessage">
	${ "일" + num2 }
	</c:catch>
	${eMessage }
</body>
</html>









