package model2.mvcboard;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import dto.PageDto;
import model2.mvcboard.dao.mvcboardDao;
import model2.mvcboard.dto.mvcboardDto;

public class ListController extends HttpServlet {

	
	@Override
	// doGet 은 service가 실행되고, 사용자의 요청이 post 또는 get에 따라 요청됨
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String searchWord = req.getParameter("searchWord");
		String searchField = req.getParameter("searchField");
		String pageNo = req.getParameter("pageNo") == null ? "1" : req.getParameter("pageNo");
		
		
		// 리스트 조회 
		mvcboardDao dao = new mvcboardDao();
	
		// 검색어, 페이징 정보 세팅 
		Criteria criteria = new Criteria(searchField, searchWord, pageNo); 
		List<mvcboardDto> list = dao.getListPage(criteria);
		
		System.out.println(criteria.getStartNo());
		System.out.println(criteria.getEndNo());
		System.out.println(criteria.getPageNo());
		System.out.println("list : " + list.size());
		
		// 총 건수 , 페이징 처리 
		int totalCnt = dao.totalCount(criteria);
		req.setAttribute("totalCnt", totalCnt);
		
		PageDto pageDto = new PageDto(totalCnt,criteria);
		req.setAttribute("pageDto", pageDto);
		
		// request영역에 저장 req.setAttribute 
		req.setAttribute("list", list);
		// 화면 페이지로 전환  /14MVCBoard/List.jsp
		req.getRequestDispatcher("/14MVCBoard/List.jsp").forward(req, resp);
	
	}
	
	public ListController() {
		
	}
}
