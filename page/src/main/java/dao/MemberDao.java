package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

//                 [    데이터베이스에 접근하는 로직처리(dao)     ] 
public class MemberDao {
	public MemberDao() {
		
	}
	// 멤버 객체 입출력 (dao) 
	
	/*
	 * 	로그인 
	 *  : 아이디/ 비밀번호가 일치하는 회원을 조회 
	 *  
	 *   회원이 존재하는 경우 member 객체 반환, 그렇지 않으면 null 반환
	 *   @param id : 입력한 회원 id
	 *   @param pw : 입력한 회원 pw 
	 * */
	public Member login(String id, String pass) {
		Member member = null;
		String sql = "SELECT * FROM MEMBER WHERE ID =? AND PASS =?";
		
		try(
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				) {
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				
				ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행 결과
				
				// 아이디/ 비밀번호가 일치하는 회원이 있으면 조회 
				if(rs.next()) {
					String log_id = rs.getString("ID");
					String log_name = rs.getString("NAME");
					String log_regidate = rs.getString("REGIDATE");
					
					// 멤버 객체 생성 
					member = new Member(log_id, "", log_name, log_regidate);
				}
		} catch (SQLException e) {
			System.err.println("실행 오류");
			System.err.println(e.getMessage());
		}
		return member;
	}
	
	/*
	 * 	회원등록 
	 *  @parma member
	 *  @return 몇건이 처리되었는지 반환
	               -->  int 반환 
	 * */
	public int insert(Member member) {
		int i = 0;
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, SYSDATE)";
		
		try (
				Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				) {
				pstmt.setString(1, member.getId());
				pstmt.setString(2, member.getPass());
				pstmt.setString(3, member.getName());

				i = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return i;
	}
}
