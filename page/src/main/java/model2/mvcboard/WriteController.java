package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.FileUtil;
import common.JSFunction;
import model2.mvcboard.dao.mvcboardDao;
import model2.mvcboard.dto.mvcboardDto;

public class WriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("../14MVCBoard/Write.jsp");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory = "C:/upload";
		// 파일 업로드, 경로, 최대 사이즈를 지정  
		MultipartRequest mr =  FileUtil.uploadFile(req, "C:/upload", 1024*1000);
		if(mr == null) {
			// 파일업로드 실패 
			JSFunction.alertBack(resp, "파일업로드 중 오류 발생!");
			return;
		}
		
		// 파일 업로드 외 저장 
		// form 값을 DTO에 저장
		mvcboardDto dto = new mvcboardDto();
		
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setOfile(mr.getParameter("ofile"));
		dto.setPass(mr.getParameter("pass"));
		
		// 원본파일명과 저장된 파일 이름
		
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			
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
			
			dto.setOfile(fileName); 	// 원본 파일명
			dto.setSfile(newFileName); // 저장된 파일명 

		}
	
		mvcboardDao dao = new mvcboardDao();
		int res = dao.insertPost(dto);
		System.out.println("res : " + res);
		
		if(res>0) {
			JSFunction.alertLocation(resp, "게시물 등록!", "../mvcboard/list.do");
		}else {
			JSFunction.alertBack(resp, "게시물 등록 실패 ㅠㅠ");
		}
	}
	
	public WriteController() {

	}

}
