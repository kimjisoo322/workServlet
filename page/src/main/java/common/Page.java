package common;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @어노테이션
 *  - 사전적의미 : 주석이라는 뜻을 가짐 
 *  - 소스코드에 추가해서 사용할 수 있는 메타데이터의 일종 
 *  - 컴파일 과정과 실행 과정에서 코드를 어떻게 처리해야하는지 알려주기 위한 정보 
 * 
 *   기능)  문법체크, 런타임시 특정 기능을 실행, 개발환경이나 빌드시 코드를 자동으로 생성 할 수 있는 정보를 제공 
 * @WebServlet
 * 
 *  - 사용자의 요청 URL과 매핑
 */
@WebServlet("/Page")
public class Page extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Page() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * get 방식으로 요청시 실행
		 : 사용자의 요청정보를 객체로 저장하여 파라메터로 전달 (request , response) 
		 _> HttpServletRequest , HttpServletResponse 타입(인터페이스)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * post 방식으로 요청시 실행 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
