<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소, 
String userid = "user01";
String pwd = "1234";

Class.forName(driver); //드라이브 파일 로딩, 얘는 객체 생성중
Connection conn = DriverManager.getConnection(url, userid, pwd); // DB접속 연결 객체 생성, 얘는 객체 생성하지 않고 클래스로 직접 접근하고 있음
String sql= "select * from tb_guestbook order by seq_desc";
// 입력받은 값 한글 안 깨지게 하는거
request.setCharacterEncoding("utf-8");

// 서버로 넘어오는 값을 받자
String title = request.getParameter("title");
String writer = request.getParameter("writer");
String contents = request.getParameter("contents");
String msg="";

String mode = request.getParameter("mode");
String seq = request.getParameter("seq");

if(mode.equals("insert")){
	sql = "insert into tb_guestbook(seq, title, writer, contents, wdate, hit) values ("+"sq_guest.nextval, '"+title+"', "+"'"+writer+"', "+"'"+contents+"', "+" sysdate, 0)";
	msg = "글이 등록되었습니다.";
} else if(mode.equals("modify")){
	sql = "update tb_guestbook set title='"+title+"'"+", writer ='"+writer+"' "+ ", contents = '"+contents+"'"+"  where seq="+seq;
	msg = "글이 수정되었습니다.";
} else if(mode.equals("delete")){
	sql = "delete tb_guestbook " + "  where seq="+seq;
	msg = "글이 삭제되었습니다.";
}
System.out.println(sql);	// 쿼리 확인

Statement stmt = conn.createStatement();
boolean result = stmt.execute(sql);
stmt.close();
conn.close();
// ResultSet rs = stmt.executeQuery(sql); // executeQuery가 DB로 가서 정보를 가져옴 -> 그걸 가져오는 애가 resultSet
%>


<script>
	alert("<%=msg%>");
	location.href="guestbook_list.jsp";	// 등록이 완료되고 나면 글목록 페이지로 화면이동

</script>