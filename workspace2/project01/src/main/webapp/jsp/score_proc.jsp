<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosa.myhome2.CommonUtil" %>	<!-- import할 클래스를 이런 식으로 쓸 수 있음 -->
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이게 뭘까....? 내가 뭘 하는걸까?</title>
</head>
<body>
<!-- score_proc.jsp -->
<%
String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소, 
String userid = "user01";
String pwd = "1234";

Class.forName(driver);
Connection conn = DriverManager.getConnection(url, userid, pwd);
String sql = "select * from tb_score order by seq_desc";

	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String name = CommonUtil.nullToValue(request.getParameter("name"), "");
	String kor = CommonUtil.nullToValue(request.getParameter("kor"), "0");
	String mat = CommonUtil.nullToValue(request.getParameter("mat"), "0");
	String eng = CommonUtil.nullToValue(request.getParameter("eng"), "0");
	String msg = "";
	
	String mode = request.getParameter("mode");
	String seq = request.getParameter("seq");
	
	if(mode.equals("insert")){
		sql = "insert into tb_score(seq, name, kor, mat, eng, wdate) values (sq_guest.nextval, '"+name+"', "+"'"+kor+"', "+"'"+mat+"', "+"'"+eng+"', "+" sysdate)";
		msg = "성적이 등록되었습니다.";
	}else if(mode.equals("modify")){
		sql = "update tb_score set name='"+name+"'"+", kor ='"+kor+"' "+ ", mat = '"+mat+"'"+", eng = '"+eng+"'"+"  where seq="+seq;
		msg = "성적이 수정되었습니다.";
	}else if(mode.equals("delete")){
		sql = "delete tb_score where seq=" + seq;
		msg = "성적이 삭제되었습니다.";
	}
	System.out.println(sql);
	
	Statement stmt = conn.createStatement();
	boolean result = stmt.execute(sql);
	stmt.close();
	conn.close();
	
	// 변수값을 출력할 경우 jsp에서는 아래와 같이 처리함
	// webapp - html, css, image, jsp는 이 공간에
	//	ㄴWEB-INF - WEB-INF 폴더가 있는 상위 폴더가 웹 폴더가 됨
	// 패키지명은 충돌 가능성이 있어서 프로젝트를 진행하는 회사 도메인을 뒤집는 식으로 표기함
	// org.eclipse, 프로젝트명 아래에만 코드를 둔다
	
	// webapp까지가 /myhome4의 위치고 여기에 파일을 두지 않으면 자바가 직접 접근할 수 없음
	// 실제 실행할 때는 java가 번역되어서 class 파일이 만들어져서 WEB-INF 밑에 classes 폴더가 만들어지고 이 폴더에 들어감
	
	// WAS - 웹로직(가장 많은 시장을 차지함),
	// 제우스 - 국산 WAS
	// 관공서, 대학 등 국가기관들은 거의 다 제우스가 설치되어 있음
	// 레진 : 비교적 저렴하고 사용이 ㅕㄴ리
	// 
%>
</body>
</html>
<script>
	alert("<%=msg%>");
	location.href="score_list.jsp";
<%-- // <%=nName %>의 총점은 <%=total %>, 평균은 <%=avg %>입니다 --%>
</script>