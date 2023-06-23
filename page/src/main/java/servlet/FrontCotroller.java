package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// .one으로 끝나는 모든 경로 
@WebServlet("*.one")
public class FrontCotroller extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		
		// 요청경로 (/*.one) 
		String commandStr = uri.substring(uri.lastIndexOf("/"));
	
		// 요청경로에 따라 처리를 다르게 함 
		if(commandStr.equals("/regist.one")) {
			registFunc(req);
		}else if(commandStr.equals("/login.one")) {
			loginFunc(req);
		}else if(commandStr.equals("/freeboard.one")) {
			freeboardFunc(req);
		}else {
			
		}
		req.setAttribute("uri", uri);
		req.setAttribute("commandStr", commandStr);
		//resp.sendRedirect(commandStr);
		req.getRequestDispatcher("/13서블릿/FrontController.jsp").forward(req, resp);
		
		//resp.getWriter().print(commandStr);
	}
	
	// 요청별로 처리에 따라 각각 다른 메서드가 실행되도록 함 !
	private void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue","<h4>회원가입</h4>");
	}
	private void loginFunc(HttpServletRequest req) {
		req.setAttribute("loginValue", "<h4>로그인</h4>");
	}
	private void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("freeboardValue", "<h4>자유게시판</h4>");
	}
	
	
	public FrontCotroller() {
	}

}
