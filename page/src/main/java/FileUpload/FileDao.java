package FileUpload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionUtil;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	
	// 파일 정보 저장  (insert, update, delete = executeUpdate) 
	public int intsertFile(FileDto dto) {
		int res = 0;
		
		String sql = "INSERT INTO MYFILE"
				+ "(IDX, NAME, TITLE, CATE, OFILE, SFILE) VALUES "
				+ "(SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, ?, ?)";
		System.out.println(sql);
		try (
				Connection conn =  ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				){
				pstmt.setString(1, dto.getName());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getCate());
				pstmt.setString(4, dto.getOfile());
				pstmt.setString(5, dto.getSfile());
				
				res = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return res;
	}
	
	// 파일 목록 조회  
	 // -> 페이징 처리를 하게 될 때 (criteria를 받아서 starNo, endNo 설정하기!) 
	public List<FileDto> getFilelist(){
		List<FileDto> list = new ArrayList<FileDto>();
		FileDto dto = null;
		String sql = "select * from myFile order by idx desc";
		try (
				Connection conn= ConnectionUtil.getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql);
				
				){
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					dto = new FileDto();
					dto.setIdx(rs.getString("IDX"));
					dto.setName(rs.getString("NAME"));
					dto.setTitle(rs.getString("TITLE"));
					dto.setCate(rs.getString("CATE"));
					dto.setOfile(rs.getString("OFILE"));
					dto.setSfile(rs.getString("SFILE"));
					dto.setPostdate(rs.getString("POSTDATE"));
					
					list.add(dto);
				}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		}
		
		return list;
	}

}
