<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="common.JSFunction"%>
<%@page import="FileUpload.FileDao"%>
<%@page import="FileUpload.FileDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload 폼 전송받는 곳</title>
</head>
<body>
<%
	// 저장할 디렉터리의 실제 경로   --> c드라이브에 upload 파일을 생성하고 경로를 지정하기!!!! 
	String saveDirectory = "C:/upload";
	
	// 파일의 최대 크기(1MB)
	int maxPostSize = 1024*1000;
	
	// 인코딩 방식
	String encoding = "utf-8";	
	
	
	/*
		
		  MultipartRequest로 전송받은 데이터를 불러온다.
          enctype을 "multipart/form-data"로 선언하고 submit한 데이터들은 request객체가 아닌 MultipartRequest객체로 불러와야 한다.
		 
          -> 그래서 mr.getFilesystemName 을 사용한 것 
          
          +) cos.jar 라이브러리를 통해서 MultipartRequest 사용함 ==> 파일 업로드 
          
		
		1. MultipartRequest 객체 생성 
		    생성자의 매개변수로 저장경로, 파일 최대크기,인코딩 방식을 지정 
		    객체가 정상적으로 생성되면 파일이 업로드 됨! 
	*/
	
	try{
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		// 2. 새로운 파일명 생성 (동일한 파일명이 업로드 되는 경우, 기존파일이 소실된 위험이 있어 파일명을 변경해야함!)
		//  - 기존파일 : fileName
		String fileName = mr.getFilesystemName("attachedFile");
		
		//  첨부파일의 확장자 
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		  				/*
		  				 H: 0부터 23까지의 2자리 시간을 나타냅니다.
						 m: 0부터 59까지의 2자리 분을 나타냅니다.
						 s: 0부터 59까지의 2자리 초를 나타냅니다.
						S: 0부터 999까지의 3자리 밀리초를 나타냅니다.
		  				*/
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		  				
		 // 기존파일의 확장자를 제외한 파일이름만 출력 (0부터 마지막 .까지)
		String ofileName = fileName.substring(0, fileName.lastIndexOf("."));
		
		 //  - 새로운 파일 : newFileName
		String newFileName = ofileName + "_" + now + ext;
		System.out.println("기존파일명 : " + fileName);
		System.out.println("신규파일명 : " + newFileName);
		
		// 3. 파일명 변경
		/*
			File 클래스의 생성자를 사용하여 파일 객체를 생성하고, 해당 파일의 경로를 지정 
			 - saveDirectory는 파일이 저장될 디렉토리의 경로, 
			 - fileName은 생성할 파일의 이름 
			 - File.separator는 시스템의 디렉토리 구분자, 플랫폼에 따라 \ 또는 /와 같이 나타냄
		*/
		 
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		
		oldFile.renameTo(newFile);
		
		// 폼 요소의 값을 저장 
		String name = mr.getParameter("name");
		String title =mr.getParameter("title");
		
		// 4. 체크박스인 경우, 배열로 반환받아서 문자열로 연결해서 저장하기 
		String[] categoryArr = mr.getParameterValues("category");
		// string문자열을 계속해서 + 연산자로 연결하면 메모리낭비; 버퍼 사용
		StringBuffer sb = new StringBuffer();
		if(categoryArr == null){
			sb.append("선택없음");
		}else{
			for(String category :categoryArr){
				 sb.append(category + " ");
		 	}
		}
		
		// DTO 생성 
								// idx -시퀀스 sysdate는 기본값 / 나머지는 form 전달
		FileDto dto = new FileDto("", name, title, sb.toString(), fileName, newFileName ,"");
	
		// DAO를 통해 데이터 베이스에 등록 (넣기)
		FileDao dao = new FileDao();
		int res = dao.intsertFile(dto);
		
		if(res > 0){
			out.print("등록되었습니다.");
			// 리스트 페이지로 이동 
			JSFunction.alertLocation("등록되었습니다.", "FileList.jsp", out);
		}else{
			out.print("DB등록에 실패되었습니다.");
			// 이전 페이지로 이동 
			JSFunction.alertBack("등록 실패", out);
		}
	
	}catch(Exception e){
		out.print(e);
		request.setAttribute("errorMessage","파일 업로드 오류!");	
		JSFunction.alertBack("등록 실패", out);
	}	
%>
</body>
</html>





