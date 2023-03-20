package com.kosa.mvc1.gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kosa.mvc1.DBUtil;

public class GalleryDAO {
		
	// 데이터를 list에 담음
	public GalleryDAO() {
		// 내가 셀프로
//		// seq, title, writer, wdate, contents, hit 순서대로 넣어야 함
//		list.add(new GalleryDTO("1", "제목1", "작성자1", "2023-01-09", "내용1", "32"));
//		list.add(new GalleryDTO("2", "제목2", "작성자2", "2023-01-09", "내용2", "22"));
//		list.add(new GalleryDTO("3", "제목3", "작성자3", "2023-01-09", "내용3", "11"));
		
		// DB에서 가져와서 담음
		// jsp일 때엔 예외처리를 안 해줘도 됐음, 그런데 Java에서는 반드시 예외처리가 필요함(안하면 빨간줄)
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public String getSearch(GalleryDTO paramDTO) {
		String searchText = " where 1=1 ";			// 1=1 : 모든 데이터
		if(paramDTO.getSearchOpt().equals("1")) {
			searchText += " and title like '%"+paramDTO.getSearchKeyword()+"%' ";
		}else if(paramDTO.getSearchOpt().equals("2")) {
			searchText += " and contents like '%"+paramDTO.getSearchKeyword()+"%' ";
		}else if(paramDTO.getSearchOpt().equals("3")) {
			searchText += " and (title like '%"+paramDTO.getSearchKeyword()+"%' ";
			searchText += " or contents like '%"+paramDTO.getSearchKeyword()+"%' ) ";
		}
		return searchText;
	}
	
	// 데이터가 담긴 list를 Controller로 전달
	// 검색어 기능 구현을 위해 패러미터에 GalleryDTO 속성의 객체 추가
	public List<GalleryDTO> getList(GalleryDTO paramDTO){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// DAO 데이터를 받을 List 객체 생성
		List<GalleryDTO> list = new ArrayList<GalleryDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			// 페이징 처리를 적용한 쿼리
			// String 대신 StringBuffer 객체 사용
			StringBuffer buffer = new StringBuffer();
			buffer.append("select a.seq, a.title, a.writer, a.m_name, a.rnum, to_char(a.wdate, 'yyyy-mm-dd') wdate, a.hit, a.pg, a.image ");
			buffer.append("from(select seq, title, writer, wdate, hit, b.m_name, a.image, ");
			buffer.append("row_number() over(order by seq desc) as rnum, ");
			buffer.append("ceil(row_number() over(order by seq desc)/12)-1 pg ");	// 한 화면에 12개씩 출력됨
			buffer.append("from tb_gallery a ");
			buffer.append("left outer join tb_member b ");
			buffer.append("on a.writer = b.m_userid ");
			buffer.append( getSearch(paramDTO) );
			buffer.append(")a where pg="+paramDTO.getPg());
							
			System.out.println(buffer.toString());
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			
			
			rs = stmt.executeQuery(buffer.toString());// 쿼리 실행 후 결과집합을 반환
			while(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				GalleryDTO dto = new GalleryDTO();	// 가져올 정보가 담긴 dto 객체 생성
				dto.setSeq(rs.getString("seq"));		// 정보를 하나씩 가져옴
				dto.setRnum(rs.getInt("rnum"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setImage(rs.getString("image"));
				dto.setM_name(rs.getString("m_name"));
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
	
	// 기본적인 코드는 getList에서 복사한 거
	public int getTotalCnt(GalleryDTO paramDTO){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int totalCnt=0;
		
		// DAO 데이터를 받을 List 객체 생성
		List<GalleryDTO> list = new ArrayList<GalleryDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			// 페이징 처리를 적용한 쿼리
			// String 대신 StringBuffer 객체 사용
			StringBuffer buffer = new StringBuffer();
			buffer.append("select count(*) ");
			buffer.append("from tb_gallery a ");
			buffer.append( getSearch(paramDTO) );
			
			System.out.println(buffer.toString());
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			
			
			rs = stmt.executeQuery(buffer.toString());// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				totalCnt = rs.getInt(1);	// 첫번째 필드값을 가져옴
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
		return totalCnt;
	}

	
	public GalleryDTO getView(String seq){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		GalleryDTO dto = new GalleryDTO();	// 가져올 정보가 담긴 dto 객체 생성
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			// set hit=hit+1 : 조회수 증가
			String sql = "update tb_gallery set hit=hit+1 where seq=" + seq;
			System.out.println(sql);
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			stmt.execute(sql);
			
			// where이 먼저 실행되고 나서 left outer join 실행됨
			sql = "select a.seq, a.title, a.writer, a.contents, a.wdate, a.hit,"
					+ " b.m_name, a.image from tb_gallery a "
					+ "left outer join tb_member b on a.writer = b.m_userid "
					+ "where seq="+seq;
			System.out.println(sql);
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				dto.setSeq(rs.getString("seq"));		// 정보를 하나씩 가져옴
				dto.setTitle(rs.getString("title"));
				dto.setImage(rs.getString("image"));
				dto.setWriter(rs.getString("writer"));
				dto.setM_name(rs.getString("m_name"));
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
	public void insert(GalleryDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
			// String 클래스는 내부 메모리를 데이터 하나가 추가될 때마다 새로 잡아서 데이터에 넣고 
			StringBuffer buffer = new StringBuffer();
			// buffer는 속도가 빠름
			buffer.append("insert into tb_gallery(");
			buffer.append("seq, title, writer, contents");
			buffer.append(", image, wdate, hit) ");
			buffer.append("values (sq_gallery.nextval, ");
			buffer.append(" '" + dto.getTitle()+"', ");
			buffer.append(" '" + dto.getWriter()+"', ");
			buffer.append(" '" + dto.getContents()+"', ");
			buffer.append(" '" + dto.getImage()+"', ");
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
	
	public void update(GalleryDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
			// String 클래스는 내부 메모리를 데이터 하나가 추가될 때마다 새로 잡아서 데이터에 넣고 
			StringBuffer buffer = new StringBuffer();
			// buffer는 속도가 빠름
			buffer.append("update tb_gallery set ");
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