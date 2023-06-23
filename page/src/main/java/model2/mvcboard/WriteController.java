package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model2.mvcboard.dao.mvcboardDao;
import model2.mvcboard.dto.mvcboardDto;

public class WriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("../14MVCBoard/Write.jsp");
		
	}
	// 글쓰기 등록 오류 name이 null 반환됨....
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// name, title, content, ofile,pass 
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String ofile = req.getParameter("ofile");
		String pass = req.getParameter("pass");

		
		mvcboardDao dao = new mvcboardDao();
		mvcboardDto mvcboard = new mvcboardDto();
		mvcboard.setName(name);
		mvcboard.setTitle(title);
		mvcboard.setContent(content);
		mvcboard.setOfile(ofile);
		mvcboard.setPass(pass);
		
		System.out.println("Name parameter value: " + mvcboard.getName());
		// 글쓰기 등록 오류 name이 null 반환됨....
		
		int res = dao.insertPost(mvcboard);
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
