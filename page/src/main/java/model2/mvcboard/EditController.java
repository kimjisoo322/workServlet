package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model2.mvcboard.dao.mvcboardDao;
import model2.mvcboard.dto.mvcboardDto;
// 수정컨트롤러
@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		mvcboardDao dao = new mvcboardDao();
		String idx = req.getParameter("idx");
		
		mvcboardDto dto = new mvcboardDto();
		dto = dao.selectOne(idx);

		req.setAttribute("dto",dto);
		
		
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String ofile = req.getParameter("ofile");
		
		mvcboardDto dto2 = new mvcboardDto(idx, name, title, content,"",ofile,"","","","");
		
		int res = dao.updatePost(dto2);
		System.out.println(res);
		if(res>0) {
			JSFunction.alertLocation(resp,"게시물이 정상적으로 수정되었습니다.", "../mvcboard/list.do");
		}else {
			JSFunction.alertBack(resp, "게시물 수정 실패하였습니다.");
		}
		
		req.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
	}
	public EditController() {
	
	}

}
