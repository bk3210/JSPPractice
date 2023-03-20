package com.kosa.mvc2.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.kosa.mvc2.DBUtil;

public class MemberDAO {
	public MemberDAO() {
		super();
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
	}
	
	
	// 아이디 중복체크 - 동일한 아이디가 없으면 false 반환(사용가능한 아이디)
	public boolean isDuplicate(String b_m_userid) {
		String sql = "select count(*) cnt from tb_blog_member where b_m_userid = '" +b_m_userid+"' ";
		System.out.println(sql);
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				if(rs.getInt("cnt")==0) {
					return false;
				}else {
					return true;
				}
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
		return true;
	}
	
	public MemberDTO login(String b_m_userid, String b_m_password) {
		String sql = "select * from tb_blog_member where b_m_userid = '" +b_m_userid+"' and b_m_password='" + b_m_password + "' ";
		System.out.println(sql);
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		MemberDTO dto = new MemberDTO();
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				// 여기까지 dto객체는 초기화된 상태
				dto.setB_m_userid(rs.getString("b_m_userid"));
				dto.setB_m_name(rs.getString("b_m_name"));
				dto.setB_m_email(rs.getString("b_m_email"));
				// 만약 여기서 데이터가 담기지 않으면 공백인 채 넘겨짐(즉 로그인 실패)
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
		return dto;	// 정보가 담긴 dto 객체가 리턴됨(getM_userid();가 공백이라면 로그인이 실패한 것)
	}
	
	public boolean insert(MemberDTO dto) {
		StringBuffer buffer = new StringBuffer();
		
		buffer.append("insert into tb_blog_member(" );
		buffer.append("b_m_id, b_m_userid, b_m_name, b_m_password, " );
		buffer.append("b_m_email, b_m_phone) values (sq_member.nextval, '" + dto.getB_m_userid() + "' " );
		buffer.append(", '" + dto.getB_m_name() +"' " );
		buffer.append(", '" + dto.getB_m_password() +"' " );
		buffer.append(", '" + dto.getB_m_email() +"' " );
		buffer.append(", '" + dto.getB_m_phone() +"') " );
		System.out.println(buffer);
		
		Connection conn = null;
		Statement stmt = null;
		// 이 메소드는 resultset 필요없음
		
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();				
			stmt.execute(buffer.toString());
			return true;
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
		return false;		// 여기까지 왔다는 건 try에서 실행이 제대로 되지 않았다는 뜻이라 false 반환
	}
	
	public String findId(String b_m_name, String b_m_email) {
		String sql = "select b_m_userid from tb_blog_member where b_m_name = '" +b_m_name+"' and m_email='" + b_m_email + "' ";
		System.out.println(sql);
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String id = "";
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				// 여기까지 dto객체는 초기화된 상태
				id = rs.getString("m_userid");
				// 만약 여기서 데이터가 담기지 않으면 공백인 채 넘겨짐(즉 로그인 실패)
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
		return id;	// 정보가 담긴 dto 객체가 리턴됨(getM_userid();가 공백이라면 로그인이 실패한 것)
	}
	
	public String findPassword(String b_m_userid, String b_m_email) {
		String sql = "select m_password from tb_blog_member where b_m_userid = '" +b_m_userid+"' and m_email='" + b_m_email + "' ";
		System.out.println(sql);
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String password = "";
		
		// DAO 데이터를 받을 List 객체 생성
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);// 쿼리 실행 후 결과집합을 반환
			if(rs.next()) {	// 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				// 여기까지 dto객체는 초기화된 상태
				password = rs.getString("b_m_password");
				// 만약 여기서 데이터가 담기지 않으면 공백인 채 넘겨짐(즉 로그인 실패)
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
		return password;	// 정보가 담긴 dto 객체가 리턴됨(getM_userid();가 공백이라면 로그인이 실패한 것)
	}

}
