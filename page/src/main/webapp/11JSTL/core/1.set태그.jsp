<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C : set 태그</title>
</head>
<body>
 <!-- 
      JSTL : JSP의 표준 태그 라이브러리를 이용하면 스크립틀릿을 사용하지 않고 태그를 사용해 제어문, 반복문 사용이 가능!
 	  	     기본 태그가 아닌 확장태그이르므로 사용하기 위해서는 별도의 라이브러리가 필요.
 	  	     메이븐리파지토리로 접근해 jstl-1.2.jar 파일을 다운로드 받아 lib폴더에 추가
 	  
 	  JSTL 종류 
 	  			Core태그 : 변수선언, 조건문/반복문, url 처리
 	  				  -> 접두어    : c
 	  			Formatting : 숫자, 날짜, 시간 포맷 지정
 	  			      -> 접두어    : fmt
 	  			      
 	  JSTL을 사용하기 위한 방법
 	  	1. 라이브러리추가
 	  	2. 태그라이브러리 지시어 추가  <\%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	  	
 	  	
  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
			 set
				EL에서 사용할 변수를 설정. setAttribute(  ) 메서드와 동일한 기능
			remove
				설정한 변수를 제거. removeAttribute(  ) 메서드와 동일한 기능
			if
				단일 조건문을 주로 처리. else문이 없다는 단점
			choose
				다중 조건을 처리할 때 사용. 하위에 when~otherwise 태그가 있음
			forEach
				반복문을 처리할 때 사용. 일반 for문과 향상된 for문 두 가지 형태로 사용
			forTokens
				구분자로 분리된 각각의 토큰을 처리할 때 사용. StringTokenizer 클래스와 동일한 기능.
			import
				외부 페이지를 삽입할 때 사용
			redirect
				지정한 경로로 이동. sendRedirect(  ) 메서드 동일한 기능
			url
				경로를 설정할 때 사용
			out
				내용을 출력할 때 사용
			catch
				예외 처리에 사용


	 1. 변수 선언
	 	 var: 변수명
	 	 value: 값
	 	 scope: 저장영역

 -->
<!--  C : set 태그  -->
<c:set var ="directVar" value="100"/>
<c:set var ="elVar" value="${directVar mod 5 }"/>
<c:set var = "expVar" value = "<%=new Date() %>"/>
<c:set var = "betweenVar">변수값 설정</c:set>

<h4> EL을 이용해 변수 출력</h4>

<ul>
	<li>directVar: ${pageScope.directVar }</li>
	<li>elVar : ${elVar }</li>
	<li>expVar : ${expVar }</li>
	<li>betweenVar : ${betweenVar }</li>
</ul>

<h4> 자바빈즈 생성1 - 생성자 사용 </h4>
	<c:set var = "personVal1" value ='<%=new Member("hani","","하니","2023-06-20") %>' scope="request"/>
	<ul>
	<li> 아이디 : ${personVal1.id}</li>
	<li> 이름 : ${requestScope.personVal1.name }</li>
	</ul>
	
	<h3> 자바빈즈 생성 후 값을 변경하기 </h3>
	<h4> 자바빈즈 생성 2 - target, property 사용</h4>
 <% /*
 
	<자바빈즈 생성 후 값을 변경해보기>
	 target   : 자바빈즈 변수명
	 property : 자바빈즈 속성명(멤버변수명)
	 value    : 값 지정 
 */
 %> 
  <c:set var = "personVal2" value ='<%=new Member("musthave5","","머스트해브5","2023-06-20") %>' scope="request"/>
	<ul>
		<li>변경 전 이름 : ${personVal2.name }</li>
		<li>변경 전 아이디 : ${requestScope.personVal2.id }</li>
	</ul>
	
<c:set target = "${personVal2}" property= "id" value = "musthave"></c:set>	
<c:set target = "${personVal2 }" property= "name" value = "머스트해브"></c:set>	
	<ul>
		<li>변경 후 이름 : ${personVal2.name }</li>
		<li>변경 후 아이디 : ${requestScope.personVal2.id }</li>
	</ul> 
	
	
	<h4> List 컬렉션 이용하기 </h4>
	<%
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(new Member("jk","","정국",""));
		list.add(new Member("jm","","지민",""));
	%>

	<c:set var = "list" value ="<%=list %>" scope="request"></c:set>
		<ul>
		<li>list[0] 이름: ${list[0].name}</li>
		<li>list[0] 아이디 : ${list[0].id}</li>
		<li>list[1] 이름: ${list[1].name}</li>
		<li>list[1] 아이디 : ${requestScope.list[1].id}</li>
	</ul> 
	
	<h4> Map 컬렉션 이용하기 </h4>
	<%
		Map<String, Member> map = new HashMap<String, Member>();
		map.put("pMap1", new Member("jk", "", "정국", ""));
		map.put("pMap2", new Member("jm", "", "지민", ""));
	%>
	<c:set var = "map" value = "<%=map %>" scope = "request"></c:set>
			<ul>
		<li>map[0] 이름: ${map.pMap1.name}</li>
		<li>map[0] 아이디 : ${map.pMap1.id}</li>
		<li>map[1] 이름: ${map.pMap2.name}</li>
		<li>map[1] 아이디 : ${map.pMap2.id}</li>
	</ul> 
</body>
</html>







