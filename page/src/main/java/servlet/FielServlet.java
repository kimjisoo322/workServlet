package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FileUpload.FileDao;
import FileUpload.FileDto;

@WebServlet("/12파일업로드/FielServlet")
public class FielServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FileDao dao = new FileDao(); 
		List<FileDto> list = dao.getFilelist();

		req.setAttribute("list",list);
		req.getRequestDispatcher("FileList.jsp").forward(req, resp);
	}
	@Override
	protected long getLastModified(HttpServletRequest req) {
		// TODO Auto-generated method stub
		return super.getLastModified(req);
	}
	
	public FielServlet() {
		// TODO Auto-generated constructor stub
	}

}
