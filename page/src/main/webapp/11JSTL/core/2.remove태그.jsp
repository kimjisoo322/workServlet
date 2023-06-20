<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> C : remove 태그</title>
</head>
<body>

<%
	/*
	 remove
		설정한 변수를 제거. removeAttribute(  ) 메서드와 동일한 기능 
		   -> 어떤 영역에 지정되어있는 변수를 삭제할 수 있음 
	*/
%>

<!--  변수 선언 -->
<c:set var ="scopeVar" value ="PageValue" />
<c:set var ="scopeVar" value ="RequestValue" scope ="request"/>
<c:set var ="scopeVar" value ="SessionValue" scope ="session"/>
<c:set var ="scopeVar" value ="AppValue" scope ="application"/>

<!-- 출력 -->
<ul>
	<li>PageValue 삭제 전 : ${scopeVar}</li>
	<li>RequestValue 삭제 전: ${requestScope.scopeVar }</li>
	<li>SessionValue 삭제 전 : ${sessionScope.scopeVar }</li>
	<li>AppValue 삭제 전 : ${applicationScope.scopeVar }</li>
</ul>
<!--  삭제하기  -->

<h4> session 영역에서 삭제하기 </h4>
<c:remove var="scopeVar" scope="session"/>
	<ul>
		<li>SessionValue 삭제 후 : ${sessionScope.scopeVar }</li>	
	</ul>

<h4> 영역을 지정하지 않고 삭제하기 </h4>
<c:remove var="scopeVar"/>
<ul>
	<li>PageValue 삭제 후: ${scopeVar}</li>
	<li>RequestValue 삭제 후: ${requestScope.scopeVar }</li>
	<li>SessionValue 삭제 후 : ${sessionScope.scopeVar }</li>
	<li>AppValue 삭제 후: ${applicationScope.scopeVar }</li>
</ul>
</body>
</html>









