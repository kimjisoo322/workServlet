package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model2.mvcboard.dao.mvcboardDao;
// 삭제컨트롤러
@WebServlet("/mvcboard/pass.do")
public class PassController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// mode (수정, 삭제) => mode 값을 받아와서 request 영역에 저장 
		req.setAttribute("mode",req.getParameter("mode"));
		req.setAttribute("idx",req.getParameter("idx"));
		
		// Pass.jsp 페이지로 전환
		req.getRequestDispatcher("/14MVCBoard/Pass.jsp").forward(req, resp);
	}
	
	// 비밀번호가 맞으면 수정페이지 또는 삭제 페이지로 이동 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		mvcboardDao dao = new mvcboardDao();
		// 비밀번호 확인 메서드 
		boolean confirmed = dao.comfirmPassword(idx, pass);
			// 비밀번호 체크 성공 
		if(confirmed) {
			System.out.println("비밀번호 검증성공!!!");
			if(mode.equals("edit")) {
				resp.sendRedirect("../mvcboard/edit.do?idx=" + idx);
			}else if (mode.equals("delete")) {
				// 삭제 dao.delte(idx,pass)
				int  res = dao.deletePost(idx);
				if(res>0) {
					JSFunction.alertLocation(resp,"게시물이 정상적으로 삭제되었습니다.", "../mvcboard/list.do");
				}else {
					JSFunction.alertBack(resp, "게시물 삭제 실패하였습니다.");
				}
			}
		}else {
			JSFunction.alertBack(resp, "비밀번호 검증에 실패하였습니다.");
		}
	}
	
	public PassController() {

	}

}
