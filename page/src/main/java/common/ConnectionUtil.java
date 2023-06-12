package common;
 // connection은 java.sql
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnectionUtil {
	public ConnectionUtil() {

	}
	/*
	 * 	DB connection을 반환합니다.
	 * @return
	 * */
	public static Connection getConnection() {
		
		// 접속정보
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "JSP";
		String pw = "1234";
		
		Connection conn= null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			// 3. 커넥션이 종료되는 시점에 커밋
			conn.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			System.err.println("커넥션 생성 중 오류가 발생하였습니다.");
			System.err.println(e.getMessage());
		} catch (SQLException e) {
			System.err.println("라이브러리 로드 중 오류가 발생하였습니다.");
			System.err.println(e.getMessage());
		}
		return conn;
	}
	// 드라이버의 접속정보
	/*
	 * 	web.xml 파일의 컨텍스트 초기화 매개변수를 읽어서 
	 *  DB접속정보를 설정 
	 *   [ DB 접속정보를 저장한 외부 설정파일 ]
	 *  @param application
	 *  @return
	 * */
	
	public static Connection getConnection(ServletContext application) {
		Connection conn = null;
		
		String driver =application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleUrl");
		String id = application.getInitParameter("OracleId");
		String pass = application.getInitParameter("OraclePw");
//		
//		System.out.println(driver);
//		System.out.println(url);
//		System.out.println(id);
//		System.out.println(pass);
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pass);
			conn.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			System.err.println(e.getMessage());
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		return conn;
	};
	
	/*
	 * 	커넥션 생성 테스트 (main메서드) 
	 * */
	public static void main(String[] args) {
		String sql = "SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') today FROM DUAL";
//		System.out.println(conn);
		
		//회원 정보 조회 후 출력 
		try (
				Connection conn = getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);
				){
				ResultSet rs = psmt.executeQuery(); // 쿼리문 실행 결과 
				rs.next();
				String today = rs.getString(1);
				System.out.println("오늘 날짜 : " + today);
				
				rs.close();
				psmt.close();
				conn.close();
		} catch (SQLException e) {
			
			System.err.println(e.getMessage());
		}
		
	}

	/*
	 * 	자원 반납
	 * */
	public static void close(Connection conn) {
			try {
				if(conn != null && !conn.isClosed())conn.close();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			}
	}
	
	public static void close(Connection conn, Statement stsmt) {
		try {
			if(stsmt != null && !stsmt.isClosed())stsmt.close();
			if(conn != null && !conn.isClosed())conn.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
	public static void close(Connection conn, Statement stsmt, ResultSet rs) {
		try {
			if(rs != null && !rs.isClosed())rs.close();
			if(stsmt != null && !stsmt.isClosed())stsmt.close();
			if(conn != null && !conn.isClosed())conn.close();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
	}
}





