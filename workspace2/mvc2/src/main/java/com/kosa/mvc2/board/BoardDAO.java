package com.kosa.mvc2.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.kosa.mvc2.DBUtil;

public class BoardDAO {

	public BoardDAO() {
		try {
			Class.forName(DBUtil.DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getSearch(BoardDTO paramDTO) {
		String searchText = " where 1=1 "; // 1=1 : 모든 데이터
		if (paramDTO.getSearchOpt().equals("1")) {
			searchText += " and title like '%" + paramDTO.getSearchKeyword() + "%' ";
		} else if (paramDTO.getSearchOpt().equals("2")) {
			searchText += " and contents like '%" + paramDTO.getSearchKeyword() + "%' ";
		} else if (paramDTO.getSearchOpt().equals("3")) {
			searchText += " and (title like '%" + paramDTO.getSearchKeyword() + "%' ";
			searchText += " or contents like '%" + paramDTO.getSearchKeyword() + "%' ) ";
		}
		return searchText;
	}

	public List<BoardDTO> getList(BoardDTO paramDTO) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();

			StringBuffer buffer = new StringBuffer();
			buffer.append("select a.seq, a.b_b_title, a.b_b_writer, a.rnum, to_char(b_b_wdate, 'yyyy-mm-dd') b_b_wdate, a.b_b_hit, a.pg ");
			buffer.append("from(select seq, b_b_title, b_b_writer, b_b_contents, b_b_wdate, b_b_hit, ");
			buffer.append("row_number() over(order by seq desc) as rnum, ");
			buffer.append("ceil(row_number() over(order by seq desc)/10)-1 pg ");
			buffer.append("from tb_blog_board a ");
			buffer.append("left outer join tb_blog_member b ");
			buffer.append("on a.b_b_writer = b.b_m_userid ");
			buffer.append( getSearch(paramDTO) );
			buffer.append(")a where pg="+paramDTO.getPg());

			rs = stmt.executeQuery(buffer.toString());
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRnum(rs.getInt("rnum"));
				dto.setB_b_title(rs.getString("b_b_title"));
				dto.setB_b_writer(rs.getString("b_b_writer"));
				dto.setB_b_image(rs.getString("b_b_image"));
				dto.setB_b_contents(rs.getString("b_b_contents"));
				dto.setB_b_hit(rs.getString("b_b_hit"));
				dto.setB_b_wdate(rs.getString("b_b_wdate"));
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;

	}

	public int getTotalCnt(BoardDTO paramDTO) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int totalCnt = 0;

		// DAO 데이터를 받을 List 객체 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();

			StringBuffer buffer = new StringBuffer();
			buffer.append("select count(*) from tb_blog_board ");
			buffer.append(getSearch(paramDTO));

			System.out.println(buffer.toString());
			// 지금은 콘솔에 찍는데 나중엔 log4j라는 라이브러리로 디버깅 확인할거임

			rs = stmt.executeQuery(buffer.toString());// 쿼리 실행 후 결과집합을 반환
			if (rs.next()) { // 첫번째 인덱스는 데이터가 들어가 있지 않음. 한번 next를 호출한 다음부터 데이터
				totalCnt = rs.getInt(1); // 첫번째 필드값을 가져옴
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return totalCnt;
	}

	public BoardDTO getView(String seq) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO(); // 가져올 정보가 담긴 dto 객체 생성

		try {
			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			String sql = "update tb_blog_board set hit=hit+1 where seq=" + seq;
			System.out.println(sql);
			stmt.execute(sql);

			sql = "select seq, b_b_title, b_b_writer, b_b_contents, "
					+ "b_b_image, b_b_wdate, b_b_hit from tb_blog_board " + "where seq=" + seq;
			System.out.println(sql);
			if (rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setB_b_title(rs.getString("b_b_title"));
				dto.setB_b_writer(rs.getString("b_b_writer"));
				dto.setB_b_contents(rs.getString("b_b_contents"));
				dto.setB_b_image(rs.getString("b_b_image"));
				dto.setB_b_wdate(rs.getString("b_b_wdate"));
				dto.setB_b_hit(rs.getString("b_b_hit"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;

	}

	public void insert(BoardDTO dto) {
		Connection conn = null;
		Statement stmt = null;
		try {
			StringBuffer buffer = new StringBuffer();
			buffer.append("insert into tb_blog_board( ");
			buffer.append("seq, b_b_title, b_b_writer, b_b_contents, b_b_image, b_b_wdate, b_b_hit) ");
			buffer.append("values (sq_blog_board.nextval, ");
			buffer.append(" '" + dto.getB_b_title() + "', ");
			buffer.append(" '" + dto.getB_b_writer() + "', ");
			buffer.append(" '" + dto.getB_b_contents() + "', ");
			buffer.append(" '" + dto.getB_b_image() + "', ");
			buffer.append(" sysdate, 0) ");
			System.out.println(buffer.toString());

			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			stmt.execute(buffer.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public void update(BoardDTO dto) {
		Connection conn = null;
		Statement stmt = null;

		try {
			StringBuffer buffer = new StringBuffer();
			buffer.append("update tb_blog_board set ");
			buffer.append(" b_b_title = '" + dto.getB_b_title() + "', ");
			buffer.append(" b_b_contents = '" + dto.getB_b_contents() + "', ");
			buffer.append(" b_b_writer = '" + dto.getB_b_writer() + "', ");
			buffer.append(" where seq = '" + dto.getSeq());
			System.out.println(buffer.toString());

			conn = DriverManager.getConnection(DBUtil.URL, DBUtil.USERID, DBUtil.PWD);
			stmt = conn.createStatement();
			stmt.execute(buffer.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally { // 예외가 발생하든 말든 무조건 실행하는 동작 - DB 닫기
			try {
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}
