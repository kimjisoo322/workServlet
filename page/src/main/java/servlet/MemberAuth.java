package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

// MVC 패턴을 적용한 회원인증 구현   => 매핑은 web.xml에서 구현! /13서블릿/MemberAuth
public class MemberAuth extends HttpServlet{
	
	MemberDao dao;
	
	// dao 생성
	@Override
	public void init() throws ServletException {
		dao = new MemberDao();
	
	}
	// 처리를 service에서 하는 것 => why? service( ) 메서드는 두 가지 전송 방식 모두를 처리할 수 있음
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// web.xml에 지정한 init-param 읽어오기(초기파라메터)
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		Member member =  dao.login(id,pass);
		
		if(member != null) {
			req.setAttribute("authMessage", member.getName() + "회원님, 반갑습니다.");
			if(member.getId().equals(admin_id)) {
				req.setAttribute("authMessage", admin_id + "님은 관리자입니다.");
			}
		}else {
			req.setAttribute("authMessage", "로그인 실패!!");
		}
		// forward 해줘야 출력이 가능함! 
		req.getRequestDispatcher("/13서블릿/MemberAuth.jsp").forward(req, resp);
		
		/*
		 * String url = "MemberAuth.jsp"; 
		 * String encodedUrl = URLEncoder.encode(url,
		 * "UTF-8"); resp.sendRedirect(encodedUrl);
		 */

	}
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
