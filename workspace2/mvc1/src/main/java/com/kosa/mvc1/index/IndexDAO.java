package com.kosa.mvc1.index;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kosa.mvc1.DBUtil;
import com.kosa.mvc1.guestbook.GuestbookDTO;

public class IndexDAO {
	public IndexDAO() {
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public List<IndexDTO> getGallery(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// DAO 데이터를 받을 List 객체 생성
		List<IndexDTO> list1 = new ArrayList<IndexDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			// 페이징 처리할 필요 없으니 StringBuffer 사용x
			String sql = "select a.rnum, seq, a.image from( "
					+"select row_number() over(order by seq desc) as rnum, image, seq from tb_gallery) a "
					+ "where a.rnum<6";
			System.out.println(sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				IndexDTO dto = new IndexDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setImage(rs.getString("image"));
				list1.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	// 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
			try {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return list1;
	}
		
		public List<IndexDTO2> getList(){
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			// DAO 데이터를 받을 List 객체 생성
			List<IndexDTO2> list2 = new ArrayList<IndexDTO2>();
			try {
				conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
				stmt = conn.createStatement();
				// 페이징 처리할 필요 없으니 StringBuffer 사용x
				String sql = "select a.rnum, seq, a.title, b.m_name, a.writer "
						+ "from( "
						+ "    select row_number() over(order by seq desc) as rnum, title, seq, writer "
						+ "    from tb_guestbook) a left outer join( "
						+ "        select m_name, m_userid "
						+ "        from tb_member) b "
						+ "        on a.writer=b.m_userid "
						+ "        where rnum<10";
				System.out.println(sql);
				
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					IndexDTO2 dto = new IndexDTO2();
					dto.setSeq(rs.getString("seq"));
					dto.setTitle(rs.getString("title"));
					dto.setM_name(rs.getString("m_name"));
					dto.setWriter(rs.getString("writer"));
					list2.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {	// 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
				try {
					if(rs != null) {
						rs.close();
					}
					if(stmt != null) {
						stmt.close();
					}
					if(conn != null) {
						conn.close();
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return list2;
		}
}
