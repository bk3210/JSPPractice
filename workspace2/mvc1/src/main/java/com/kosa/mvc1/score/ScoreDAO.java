package com.kosa.mvc1.score;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kosa.mvc1.DBUtil;

public class ScoreDAO {
	
	public ScoreDAO() {
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	public List<ScoreDTO> getList(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<ScoreDTO> list = new ArrayList<ScoreDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			String sql = "select * from tb_score";
			System.out.println(sql);
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ScoreDTO dto = new ScoreDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getString("kor"));
				dto.setMat(rs.getString("mat"));
				dto.setEng(rs.getString("eng"));
				dto.setWdate(rs.getString("wdate"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
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
				} catch (SQLException e) {
					e.printStackTrace();
			}
		}
		return list;
	}
	
	public ScoreDTO getView(String seq) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ScoreDTO dto = new ScoreDTO();	// 가져올 정보가 담긴 dto 객체 생성
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			String sql = "select * from tb_score where seq=" + seq;
			System.out.println(sql);
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				dto.setSeq(rs.getString("seq"));		// 정보를 하나씩 가져옴
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getString("kor"));
				dto.setEng(rs.getString("eng"));
				dto.setMat(rs.getString("mat"));
				dto.setWdate(rs.getString("wdate"));
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
	
	public void insert(ScoreDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		
		try {
		StringBuffer buffer = new StringBuffer();
		buffer.append("insert into tb_score(");
		buffer.append("seq, name, kor, mat, eng, wdate) ");
		buffer.append("values (sq_score.nextval, ");
		buffer.append(" '" + dto.getName()+"', ");
		buffer.append(" '" + dto.getKor()+ "', ");
		buffer.append(" '" + dto.getMat()+ "', ");
		buffer.append(" '" + dto.getEng()+ "', ");
		buffer.append(" '" + dto.getWdate()+ "', ");
		buffer.append(" sysdate ");
		System.out.println(buffer.toString());
		
		conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
		stmt = conn.createStatement();
		stmt.execute(buffer.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	
	public void update(ScoreDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
		StringBuffer buffer = new StringBuffer();
		buffer.append("update tb_guestbook set ");
		buffer.append(" name = '"+dto.getName()+"', ");
		buffer.append(" kor = '"+dto.getKor()+"', ");
		buffer.append(" eng = '"+dto.getEng()+"', ");
		buffer.append(" mat = '"+dto.getMat()+"', ");
		buffer.append(" wdate = '"+dto.getWdate()+"' ");
		buffer.append(" where seq = "+dto.getSeq());
		System.out.println(buffer.toString());
		
		conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
		stmt = conn.createStatement();
		stmt.execute(buffer.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
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
