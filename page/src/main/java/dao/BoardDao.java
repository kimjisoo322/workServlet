package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import common.ConnectionUtil;
import dto.Board;

public class BoardDao {

	public BoardDao() {
	}
	
	/**
	 *  게시물 개수를 반환합니다.
	 **/
	public int getTotalCnt() {
		int totalCnt = 0;
		
		String sql = "select count(*) from board order by num desc";
		
		try (
				Connection conn= ConnectionUtil.getConnection();
				Statement stmt =  conn.createStatement();
				){
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()) {
					totalCnt = rs.getInt(1);
				}
				rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return totalCnt;
	}
	
	/*
	 * 	게시글을 조회합니다. 
	 * @return List<Board>
	 * */
	public List<Board> getList() {
		List<Board> list = new ArrayList<Board>();
		String sql = "SELECT * FROM BOARD order by NUM DESC";
		
		// 검색조건추가
		try (
				Connection conn = ConnectionUtil.getConnection();
				Statement stmt = conn.createStatement();
				){
				ResultSet rs =  stmt.executeQuery(sql);
				
			while(rs.next()) {
				String num = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String id = rs.getString(4);
				String postdate = rs.getString(5);
				String visicount = rs.getString(6);
				
				Board board = new Board(num, title, content, id, postdate, visicount);
				list.add(board);
				
				/*
				 * board.setNum(rs.getString(1)); // 필드 값 설정
				 * board.setTitle(rs.getString("title")); // 필드 값 설정
				 * board.setContent(rs.getString(3)); // 필드 값 설정 board.setId(rs.getString(4));
				 * // 필드 값 설정 board.setPostdate(rs.getString(5)); // 필드 값 설정
				 * board.setVisicount(rs.getString(6));
				 */
			}	
			rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}

}
