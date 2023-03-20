<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1월 5일 수업내용-JSP랑 DB 연결하기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form name="myform" >
	<!-- 입력 필드를 숨기면 사용자가 보내지는 정보값을 볼 수 없음 - DB업데이트, 중요한 보안 토큰을 전달할 때 사용 -->
	<input type="hidden" name="mode" value="insert">	<!-- view.jsp에서도 hidden태그가 필요함 -->

	<%
	String driver = "oracle.jdbc.driver.OracleDriver"; // ojdbc .jar파일 중에 드라이버를 얘가 사용하려고 불러오고 있음
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; // jdbc에 연결할 것이다, thin 방식으로, @이하는 접속할 DB서버의 ip주소, 
	String userid = "user01";
	String pwd = "1234";

	Class.forName(driver); //드라이브 파일 로딩, 얘는 객체 생성중
	Connection conn = DriverManager.getConnection(url, userid, pwd); // DB접속 연결 객체 생성, 얘는 객체 생성하지 않고 클래스로 직접 접근하고 있음
	String sql = "select * from tb_guestbook";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); // executeQuery가 DB로 가서 정보를 가져옴 -> 그걸 가져오는 애가 resultSet
	%>



	<!-- 메뉴 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				src="/Jan03_myhome/images/img_avatar1.png" alt="Avatar Logo"
				style="width: 40px;" class="rounded-pill">
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown">Dropdown</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">Link</a></li>
							<li><a class="dropdown-item" href="#">Another link</a></li>
							<li><a class="dropdown-item" href="#">A third link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>




	<div class="container mt-3">
		<h3>Navbar With Dropdown</h3>
		<p>This example adds a dropdown menu in the navbar.</p>

		<div class="input-group mt-3 mb-3">
			<button type="button" class="btn btn-primary dropdown-toggle"
				data-bs-toggle="dropdown">Dropdown button</button>
			<ul class="dropdown-menu">
				<li><a class="dropdown-item" href="#">Link 1</a></li>
				<li><a class="dropdown-item" href="#">Link 2</a></li>
				<li><a class="dropdown-item" href="#">Link 3</a></li>
			</ul>
			<input type="text" class="form-control" placeholder="Username">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">GO</button>
			</div>
		</div>

		<table class="table">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<%
				while (rs.next()) {
				%>

				<tr>
					<th><%=rs.getString("seq") %></th>
					<th><a href="/Jan03_myhome/guestbook/guestbook_view.jsp?seq=<%=rs.getString("seq")%>"><%=rs.getString("title") %></a></th>
					<th><%=rs.getString("writer") %></th>
					<th><%=rs.getString("wdate") %></th>
					<th><%=rs.getString("hit") %></th>
				</tr>
				<%
				System.out.println(rs.getString("title"));
				}
				rs.close();
				stmt.close();
				conn.close();
				%>
			</tbody>
		</table>
	</div>
	<div class="container" style="text-align: right">
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">first</a></li>
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item active"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item"><a class="page-link" href="#">6</a></li>
			<li class="page-item"><a class="page-link" href="#">7</a></li>
			<li class="page-item"><a class="page-link" href="#">8</a></li>
			<li class="page-item"><a class="page-link" href="#">9</a></li>
			<li class="page-item"><a class="page-link" href="#">10</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
			<li class="page-item"><a class="page-link" href="#">last</a></li>
		</ul>
	</div>
	
	<div class="container" style="text-align: right">
	<button type="button" class="btn btn-primary" id="btnWrite">글쓰기</button>
		</div>

</form>
</body>
</html>
<script>
	window.onload=()=>{
		document.getElementById("btnWrite").addEventListener("click", ()=>{
			// write.jsp로 이동할 때 hidden태그값이 넘어가야 함(바로 주소가 아니라)
			// location.href="/Jan03_myhome/guestbook/guestbook_write.jsp";
			let frm = document.myform;
			frm.action = "/Jan03_myhome/guestbook/guestbook_write.jsp";
			frm.method = "get";
			frm.submit();
		})
	}
</script>