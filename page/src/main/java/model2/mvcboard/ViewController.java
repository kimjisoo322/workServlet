package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.mvcboard.dao.mvcboardDao;
import model2.mvcboard.dto.mvcboardDto;

@WebServlet("/mvcboard/view.do")
public class ViewController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		mvcboardDao dao = new mvcboardDao();
		
		mvcboardDto dto =  dao.selectOne(req.getParameter("idx"));
		
		// request영역에 저장 req.setAttribute 
		req.setAttribute("dto", dto);
		// 상세보기페이지로 전환
		req.getRequestDispatcher("/14MVCBoard/View.jsp").forward(req, resp);
			
	}
	public ViewController() {

	}

}
