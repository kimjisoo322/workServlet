package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// /13서블릿/AnnotationMapping 경로에서 AnnotationMapping 실행 -> 사용자가 요청한 메서드가 실행
@WebServlet("/13서블릿/AnnotationMapping.do")

public class AnnotationMapping extends HttpServlet{
	
	// do ( 요청 관련 메서드들이 재정의 됨) 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "AnnotationMapping.do 호출");
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public AnnotationMapping() {
	}

}
