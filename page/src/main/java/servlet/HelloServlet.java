package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 서블릿 ( 요청에 대한 처리를 구현해낸 곳 ) -> HttpServlet 상속받아 HttpServlet가 갖고있는 객체 재정의(override)
public class HelloServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 // request 영역에 저장 ( 저장된 값을 jsp 파일에 출력하고자 하면 forward ) 
		req.setAttribute("message", "서블릿 호출!");
		/*
		 * PrintWriter out = resp.getWriter();
		 * 
		 * out.print("서블릿 호출~");
		 */
		
		// response 영역은 sendRedirect로 호출  => request영역은 공유안됨
		//resp.sendRedirect("HelloServlet.jsp");
		
		// request 영역은 foward로 출력이 가능!! 
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public HelloServlet() {
		// TODO Auto-generated constructor stub
	}

}
