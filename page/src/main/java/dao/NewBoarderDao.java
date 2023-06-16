package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import common.ConnectionUtil;
import dto.Board;
import dto.Criteria;

public class NewBoarderDao {

	public NewBoarderDao() {
	}
	
	public int updatePost(Board board) {
		int res = 0;
		String sql = "update board set title = '"+board.getTitle()+"' , content = '"+board.getContent()+"' where num = ?";
		System.out.println(sql);
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
				pstmt.setString(1, board.getNum());
				res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	/**
	 * 게시물 개수를 반환(totalCnt)
	 **/
	public int getTotalCnt(Criteria criteria) {
		int totalCnt = 0;
		String sql = "SELECT COUNT(*) " + "FROM BOARD ";
		if (criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
			sql += "WHERE " + criteria.getSearchField() + " Like '%" + criteria.getSearchWorld() + "%' ";
		}
		try (Connection conn = ConnectionUtil.getConnection(); Statement stmt = conn.createStatement();) {
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
			/*
			 * System.out.println(sql);
			 */			try (Connection conn = ConnectionUtil.getConnection(); Statement stmt = conn.createStatement();) {
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

	// 게시물 삭제하기
	public int deletePost(String num) {
		int res = 0;
		String sql = "DELETE FROM BOARD WHERE NUM = ?";
	 	try(
	 			Connection conn = ConnectionUtil.getConnection();
	 			PreparedStatement pstmt =  conn.prepareStatement(sql);
	 			) {
	 		pstmt.setString(1, num);
	 		res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	 	return res;
	}
	
	
	// 조회수 카운트하기 
	public void updateVisitCount(String num) {
		
		String sql = "UPDATE BOARD SET VISITCOUNT = VISITCOUNT +1 WHERE NUM = ?";
		
		try (
				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				){
				pstmt.setString(1, num);
				pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	
	// 상세보기 
	public Board selectOne(String num) {
		Board board = null;
		String sql = "select * from board where num = ?";
		System.out.print(sql);
		if(num == null || "".equals(num)) {
			return null;
		}
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
					pstmt.setString(1, num);
					
					ResultSet rs = pstmt.executeQuery();
					if(rs.next()) {
						board = new Board();
						board.setNum(rs.getString(1));
						board.setTitle(rs.getString("TITLE"));
						board.setContent(rs.getString("CONTENT"));
						board.setId(rs.getString("ID"));
						board.setPostdate(rs.getString("POSTDATE"));
						board.setVisitcount(rs.getString("VISITCOUNT"));
					}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return board;
	}
	
	// 글쓰기 등록 
	public int insert(Board board) {
		int res = 0;
		String sql = "INSERT INTO BOARD "
				+ "(NUM, TITLE, CONTENT, ID, POSTDATE, VISITCOUNT) VALUES "
				+ "(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, SYSDATE, 1) ";
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				) {
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
	
	

		
	// 게시글 조회 (목록 모두 나오게 하기) 
	public List<Board> getList(Criteria criteria){
		List<Board> list = new ArrayList<>();
		String sql = "SELECT NUM, TITLE, CONTENT, ID, VISITCOUNT, "
				+ "		DECODE(TRUNC(SYSDATE), "
				+ " 	TRUNC(POSTDATE), "
				+ "	    TO_CHAR(POSTDATE, 'hh24:mi:ss'), "
				+ "		TO_CHAR(POSTDATE, 'yyyy-mm-dd'))AS \"POSTDATE\" "
				+ "		FROM BOARD ";
		if(criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
			sql += "WHERE "+criteria.getSearchField()+" like '%"+criteria.getSearchWorld()+"%' ";
		}
		sql += "order by num desc ";
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				){
				ResultSet rs =  pstmt.executeQuery();
				
				while(rs.next()) {
					Board board = new Board();
					board.setNum(rs.getString(1));
					board.setTitle(rs.getString(2));
					board.setContent(rs.getString(3));
					board.setId(rs.getString(4));
					board.setVisitcount(rs.getString(5));
					board.setPostdate(rs.getString(6));
	
					
					list.add(board);
				}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
}
