<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  TLD(Tag Library Descriptor)
	     : jsp에서 사용되는 커스텀태그나 JSTL의 태그들에 대한 설정파일
	      위치) WEB-INF폴더 하위에 작성해야 인식이 가능하다! 
	   
	   prefix : EL에서 사용할 접두어
	   uri : TLD 파일의 경로 

 -->
 
 <%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
 
 <%@ taglib prefix= "myCookie" uri = "/WEB-INF/MyTagLib.tld" %>
<h3> TLD 파일에 등록 후 정적메서드 호출하기</h3>
<ul>
	<li>${mytag:isNumber("100") }</li>
	<li>${mytag:isNumber("백")}</li>
	
	<li>${myCookie.makeCookie(response, 'ELCookie', '쿠키는섭웨이쿠키지', 10)}</li>
	
</ul>
</body>
</html>