<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
// 공통변수 선언
String CONTEXT = request.getContextPath();
%>
<title>Insert title here</title>
</head>
<body>
	<!-- 메뉴 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<div class="container-fluid">
		<a href="<%=CONTEXT%>/index.jsp">
		<img
				src="<%=CONTEXT%>/images/ddd.png" alt="Avatar Logo"
				style="width: 40px;" class="rounded-pill">
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="<%=CONTEXT%>/guestbook.do?cmd=list&pg=0">방명록</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=CONTEXT%>/gallery.do?cmd=list&pg=0">갤러리</a></li>
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
			<%
			if (session.getAttribute("m_userid") == null || session.getAttribute("m_userid").equals("")) {
			%>
			<ul class="navbar-nav justifu-content-end">
				<li class="nav-item"><a class="nav-link"
					href="<%=CONTEXT%>/member.do?cmd=member_login">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=CONTEXT%>/member.do?cmd=member_write">회원가입</a></li>
			</ul>
			<%
			} else {
			%>
			<ul class="navbar-nav justifu-content-end">
				<li class="nav-item"><a class="nav-link" href="#none"><%=session.getAttribute("m_name")%></a></li>
				<li class="nav-item"><a class="nav-link" href="#none"
					onclick="goLogout()">로그아웃</a></li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
</body>
</html>
<script>
	function goLogout() {
		let xhttp = new XMLHttpRequest();
		let url = "/mvc1/member.do?cmd=member_logout";

		xhttp.onload = function() {
			console.log(this.responseText);
			let data = JSON.parse(this.responseText);
			alert("로그아웃되었습니다.");
			location.href = "/mvc1/index.jsp";
		}

		xhttp.open("GET", url, true);
		xhttp.send();
	}
</script>