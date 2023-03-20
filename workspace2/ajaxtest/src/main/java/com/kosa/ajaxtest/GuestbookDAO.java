package com.kosa.ajaxtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kosa.ajaxtest.DBUtil;

public class GuestbookDAO {
		
	// 데이터를 list에 담음
	public GuestbookDAO() {
		// 내가 셀프로
//		// seq, title, writer, wdate, contents, hit 순서대로 넣어야 함
//		list.add(new GuestbookDTO("1", "제목1", "작성자1", "2023-01-09", "내용1", "32"));
//		list.add(new GuestbookDTO("2", "제목2", "작성자2", "2023-01-09", "내용2", "22"));
//		list.add(new GuestbookDTO("3", "제목3", "작성자3", "2023-01-09", "내용3", "11"));
		
		// DB에서 가져와서 담음
		// jsp일 때엔 예외처리를 안 해줘도 됐음, 그런데 Java에서는 반드시 예외처리가 필요함(안하면 빨간줄)
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
		
	// 데이터가 담긴 list를 Controller로 전달
	public List<GuestbookDTO> getList(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// DAO 데이터를 받을 List 객체 생성
		List<GuestbookDTO> list = new ArrayList<GuestbookDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			String sql = "select seq, title, writer, contents, to_char(wdate, 'yyyy-mm-dd') wdate, hit from tb_guestbook";
			System.out.println(sql);
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			
			// 페이징쿼리
			
			
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			while(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				GuestbookDTO dto = new GuestbookDTO();	// 가져올 정보가 담긴 dto 객체 생성
				dto.setSeq(rs.getString("seq"));		// 정보를 하나씩 가져옴
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContents(rs.getString("contents"));
				dto.setWdate(rs.getString("wdate"));
				dto.setHit(rs.getString("hit"));
				list.add(dto);	// 가져온 정보를 list에 add
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
		
		return list;
	}
	
	public GuestbookDTO getView(String seq){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		GuestbookDTO dto = new GuestbookDTO();	// 가져올 정보가 담긴 dto 객체 생성
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			// set hit=hit+1 : 조회수 증가
			String sql = "update tb_guestbook set hit=hit+1 where seq=" + seq;
			System.out.println(sql);
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			stmt.execute(sql);
			
			sql = "select * from tb_guestbook where seq="+seq;
			System.out.println(sql);
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				dto.setSeq(rs.getString("seq"));		// 정보를 하나씩 가져옴
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setContents(rs.getString("contents"));
				dto.setWdate(rs.getString("wdate"));
				dto.setHit(rs.getString("hit"));
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
		
		return dto;
	
	}
	public void insert(GuestbookDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
			// String 클래스는 내부 메모리를 데이터 하나가 추가될 때마다 새로 잡아서 데이터에 넣고 
			StringBuffer buffer = new StringBuffer();
			// buffer는 속도가 빠름
			buffer.append("insert into tb_guestbook(");
			buffer.append("seq, title, writer, contents");
			buffer.append(", wdate, hit) ");
			buffer.append("values (sq_guest.nextval, ");
			buffer.append(" '" + dto.getTitle()+"', ");
			buffer.append(" '" + dto.getWriter()+"', ");
			buffer.append(" '" + dto.getContents()+"', ");
			buffer.append(" sysdate, 0) ");
			System.out.println(buffer.toString());
			
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			stmt.execute(buffer.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	// 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
			try {
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
		
	}
	
	public void update(GuestbookDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
			// String 클래스는 내부 메모리를 데이터 하나가 추가될 때마다 새로 잡아서 데이터에 넣고 
			StringBuffer buffer = new StringBuffer();
			// buffer는 속도가 빠름
			buffer.append("update tb_guestbook set ");
			buffer.append(" title = '"+dto.getTitle()+"', ");
			buffer.append(" contents = '"+dto.getContents()+"', ");
			buffer.append(" writer = '"+dto.getWriter()+"' ");
			buffer.append(" where seq = "+dto.getSeq());
			System.out.println(buffer.toString());
			
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			stmt.execute(buffer.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {	// 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
			try {
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
		
	}
	
}