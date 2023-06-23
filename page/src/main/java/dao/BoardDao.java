package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import common.ConnectionUtil;
import dto.Board;
import dto.Criteria;

public class BoardDao {

	public BoardDao() {
	}
	
	// 휴
	// 페이징처리
		public List<Board> getListPage(Criteria criteria) {
			List<Board> list = new ArrayList<Board>();
			Board board = null;

			String sql = ""
					+ "SELECT * FROM ("
					+ "SELECT ROWNUM RN, T.* FROM ("
					+ "SELECT BOARD.* FROM BOARD ";
			if (criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
				sql += "WHERE " + criteria.getSearchField() + " Like '%" + criteria.getSearchWorld() + "%' ";
			}
			
			sql += "order by num desc "
					+ "  )T"
					+ " )"
					+ " WHERE RN BETWEEN "
					+ criteria.getStartNo()
					+ " AND "
					+ criteria.getEndNo();
			System.out.println(sql);
			try (Connection conn = ConnectionUtil.getConnection(); 
					Statement stmt = conn.createStatement();) {
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
					board = new Board();
					
					board.setNum(rs.getString("NUM"));
					board.setTitle(rs.getString("TITLE"));
					board.setContent(rs.getString("CONTENT"));
					board.setId(rs.getString("ID"));
					board.setPostdate(rs.getString("POSTDATE"));
					board.setVisitcount(rs.getString("VISITCOUNT"));
					
					list.add(board);
					 
				}
				rs.close();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
			return list;
		}

			
	// 게시글 삭제 처리
	public int delete(String num) {
		int res = 0;
		String sql = "DELETE FROM BOARD WHERE NUM = ?";
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
			pstmt.setString(1, num);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	
	
	// 게시글 수정 쿼리 
	public int update(Board board) {
		int res = 0;
		String sql = "UPDATE BOARD SET TITLE = '"+board.getTitle()+"' , CONTENT = '"+board.getContent()+"' WHERE NUM = ?";
		System.out.println(sql);
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
				pstmt.setString(1, board.getNum());
				res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	
	/*
	 * 조회수 업데이트 게시물의 조회수를 1 증가시킴
	 */
	public int updateVisit(String num) {
		int res = 0;
		String sql = "UPDATE BOARD SET VISITCOUNT = VISITCOUNT+1 WHERE NUM = ?";

		try (Connection conn = ConnectionUtil.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, num);
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}

	// 게시글 조회
	public Board selectOne(String num) {
		Board board = null;
		String sql = "SELECT * FROM BOARD WHERE NUM = ?";

		if (num == null || "".equals(num)) {
			return null;
		}
		try (Connection conn = ConnectionUtil.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, num);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new Board();
				// 읽어와서 세팅!
				board.setNum(rs.getString(1));
				board.setTitle(rs.getString("title"));
				 // 줄바꿈 처리 
				board.setContent(rs.getString("content").replace("\r\n","<br>"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getString("postdate"));
				board.setVisitcount(rs.getString("visitcount"));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return board;
	}

	/*
	 * 글쓰기 작성완료 누르면 insert // insert, update, delete 실행 후 몇건이 처리되었는지 반환 (HttpSession
	 * session) -> session.getAttribute
	 */
	public int insert(Board board) {
		int res = 0;
		String sql = "INSERT INTO BOARD "
				+ "(NUM, TITLE, CONTENT, ID, POSTDATE, VISITCOUNT) VALUES (SEQ_BOARD_NUM.NEXTVAL, "
				+ "?,?,?, SYSDATE, 2)";

		try (Connection conn = ConnectionUtil.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getId());

			res = pstmt.executeUpdate();

			pstmt.close();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}

		return res;
	}
	
	

	/**
	 * 게시물 개수를 반환합니다.
	 **/
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		String sql = "SELECT COUNT(*) " + "FROM BOARD ";
		if (criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
			sql += "WHERE " + criteria.getSearchField() + " Like '%" + criteria.getSearchWorld() + "%' ";
		}
		try (Connection conn = ConnectionUtil.getConnection(); 
				Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totalCnt = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return totalCnt;
	}

	/*
	 * 게시글을 조회합니다.
	 * 
	 * @return List<Board> + 검색 조건 추가 1) 검색 조건 : searchField 2) 검색어 : searchWord
	 * 
	 */
	public List<Board> getList(String searchField, String searchWord) {
		List<Board> list = new ArrayList<Board>();
		
		Board board = null;
		// 검색조건을 추가합니다. 만약 검색어가 null아니고 공백이 아니면 검색조건을 보여줍니다.
		String sql = "SELECT * " + "FROM BOARD ";
		if (searchWord != null && !"".equals(searchWord)) {
			// WHERE TITLE Like '%제목%';
			// WHERE "+변수+" Like '%"+변수+"%';
			sql += "WHERE " + searchField + " Like '%" + searchWord + "%' ";

		}
		sql += "order by num desc";

		try (Connection conn = ConnectionUtil.getConnection(); 
				Statement stmt = conn.createStatement();) {
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				/*
				 * String num = rs.getString(1); 
				 * String title = rs.getString(2); 
				 * String content = rs.getString(3); 
				 * String id = rs.getString(4); 
				 * String postdate = rs.getString(5); 
				 * String visicount = rs.getString(6);
				 * 
				 * Board board = new Board(num, title, content, id, postdate, visicount);
				 */
				board = new Board();
				
				board.setNum(rs.getString(1));
				board.setTitle(rs.getString("title")); 
				board.setContent(rs.getString(3)); 
				board.setId(rs.getString(4));
				board.setPostdate(rs.getString(5)); 
				board.setVisitcount(rs.getString(6));
				
				list.add(board);

				 
			}
			rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}

}
