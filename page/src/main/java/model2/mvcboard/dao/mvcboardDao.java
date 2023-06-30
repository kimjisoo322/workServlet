package model2.mvcboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;
import dto.Criteria;
import model2.mvcboard.dto.mvcboardDto;

public class mvcboardDao {
	
	// 컨트롤러에서는 db 조회 / jsp에서는 화면에 출력
	
	public mvcboardDao() {
	}
	
	/*
	 * 조회수 업데이트 게시물의 조회수를 1 증가시킴
	 */
	public int updateVisit(String idx) {
		int res = 0;
		String sql = "UPDATE mvcboard SET VISITCOUNT = VISITCOUNT+1 WHERE idx = ?";

		try (Connection conn = ConnectionUtil.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, idx);
			res = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}

	// 글쓰기 // name, title, content, ofile, pass 
	public int insertPost(mvcboardDto dto) {
		int res = 0;
		String sql ="INSERT INTO MVCBOARD "
				+ " (IDX, NAME, TITLE, CONTENT, PASS, OFILE, SFILE) VALUES "
				+ " (SEQ_MVCBOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		 
		System.out.println("Name value: " + dto.getName());
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getPass());
				pstmt.setString(5, dto.getOfile());
				pstmt.setString(6, dto.getSfile());
				
				res = pstmt.executeUpdate();
				pstmt.close();
				
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	
	// 수정하기
	 public int updatePost(mvcboardDto dto) { 
		int res = 0; 
		String sql = "update mvcboard "
				+ " set name = ?, title = ?, content = ?, ofile = ?, sfile = ? where idx = ? ";
		System.out.println(sql);
		try (
				Connection conn =ConnectionUtil.getConnection();
				PreparedStatement pstmt =conn.prepareStatement(sql);
				
				) {
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getContent());
				pstmt.setString(4, dto.getOfile());
				pstmt.setString(5, dto.getSfile());
				pstmt.setString(6, dto.getIdx());
				
				res = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res; 
	}
	
	//deletePost( ) 메서드는 건네받은 일련번호의 게시물을 삭제
	public int deletePost(String idx) {
		int res = 0;
		String sql = "DELETE FROM MVCBOARD WHERE IDX = ? ";
		try (
				Connection conn =ConnectionUtil.getConnection();
				PreparedStatement pstmt =	conn.prepareStatement(sql);
				) {
					pstmt.setString(1, idx);
					res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}

	// 비밀번호 일치 확인하는 메서드
	public boolean comfirmPassword(String idx, String pass) {
		boolean res= false;
		String sql = "select * from mvcboard where idx = ? and pass = ?";
		
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				){
				pstmt.setString(1, idx);
				pstmt.setString(2, pass);
				ResultSet rs = pstmt.executeQuery();
				
				res = rs.next();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	
	
	// 상세보기 
	public mvcboardDto selectOne(String idx) {
		mvcboardDto mvcboard = null;
		String sql = "select * from mvcboard where idx = ?";
		
		System.out.println(sql);
		
		if(idx == null || "".equals(idx)) {
			return null;
		}
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				){
				pstmt.setString(1, idx);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					mvcboard = new mvcboardDto();
					mvcboard.setIdx(rs.getString("idx"));
					mvcboard.setName(rs.getString("name"));
					mvcboard.setTitle(rs.getString("title"));
					mvcboard.setContent(rs.getString("content"));
					mvcboard.setPostdate(rs.getString("postdate"));
					mvcboard.setOfile(rs.getString("ofile"));
					mvcboard.setSfile(rs.getString("sfile"));
					mvcboard.setDowncount(rs.getString("downcount"));
					mvcboard.setPass(rs.getString("pass"));
					mvcboard.setVisitcount(rs.getString("visitcount"));
				}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return mvcboard;
	}
	
	
	
	// 페이징처리 
	public List<mvcboardDto> getListPage(Criteria criteria){
		List<mvcboardDto> list = new ArrayList<mvcboardDto>();
		mvcboardDto mvcboard = null;
		
		String sql = ""
				+ "SELECT * FROM ("
				+ "SELECT ROWNUM RN, T.* FROM ("
				+ "SELECT mvcboard.* FROM mvcboard ";
		if(criteria.getSearchWorld()!= null && !"".equals(criteria.getSearchWorld())) {
			sql += "WHERE " + criteria.getSearchField() + " Like '%" +criteria.getSearchWorld()+"%' ";
		}
		sql += "ORDER BY idx DESC"
				+ "  )T"
				+ " ) "
				+ "WHERE RN BETWEEN "
				+ criteria.getStartNo()
				+ " AND "
				+ criteria.getEndNo();
		System.out.println(sql);
		try (
				Connection conn = ConnectionUtil.getConnection();
				Statement stmt =  conn.createStatement();
				){
				ResultSet rs =  stmt.executeQuery(sql);
				
				while(rs.next()) {
					mvcboard = new mvcboardDto();
					
					mvcboard.setIdx(rs.getString("idx"));
					mvcboard.setName(rs.getString("name"));
					mvcboard.setTitle(rs.getString("title"));
					mvcboard.setContent(rs.getString("content"));
					mvcboard.setPostdate(rs.getString("postdate"));
					mvcboard.setOfile(rs.getString("ofile"));
					mvcboard.setSfile(rs.getString("sfile"));
					mvcboard.setDowncount(rs.getString("downcount"));
					mvcboard.setPass(rs.getString("pass"));
					mvcboard.setVisitcount(rs.getString("visitcount"));
					
					list.add(mvcboard);
				}
				rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}
	
	// 총건수 조회
	public int totalCount(Criteria criteria) {
		int res = 0;
		String sql = "select count(*) from mvcboard ";
		if(criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
			sql += "where " +criteria.getSearchField() + " Like '%" +criteria.getSearchWorld()+ "%' ";
		}
		try (
				Connection conn =  ConnectionUtil.getConnection();
				Statement stmt =  conn.createStatement();
				) {
				ResultSet rs =  stmt.executeQuery(sql);
				if(rs.next()) {
					res = rs.getInt(1);
				}
				rs.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return res;
	}
	
	
	// 게시물 조회 + 검색 조건
	public List<mvcboardDto> getList(Criteria criteria){
		List<mvcboardDto> list = new ArrayList<mvcboardDto>();
		mvcboardDto mvcboard = null;
		
		String sql = "select *from mvcboard ";
		if(criteria.getSearchWorld() != null && !"".equals(criteria.getSearchWorld())) {
			sql += "where " + criteria.getSearchField() + " Like '%"+criteria.getSearchWorld()+ "%' ";
		}
		sql += "order by idx desc";
		
		System.out.println(sql);
		try (
				Connection conn = ConnectionUtil.getConnection();
				Statement stmt =  conn.createStatement();
				){
				ResultSet rs = stmt.executeQuery(sql);
				System.out.println(sql);
				
				while(rs.next()) {
					mvcboard = new mvcboardDto();
					
					mvcboard.setIdx(rs.getString("idx"));
					mvcboard.setName(rs.getString("name"));
					mvcboard.setTitle(rs.getString("title"));
					mvcboard.setContent(rs.getString("content"));
					mvcboard.setPostdate(rs.getString("postdate"));
					mvcboard.setOfile(rs.getString("ofile"));
					mvcboard.setSfile(rs.getString("sfile"));
					mvcboard.setDowncount(rs.getString("downcount"));
					mvcboard.setPass(rs.getString("pass"));
					mvcboard.setVisitcount(rs.getString("visitcount"));
					list.add(mvcboard);
					
				}
				
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return list;
	}




}
