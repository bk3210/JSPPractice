<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
<form name = "myform">
<!-- 메뉴 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="/myhome2/images/img_avatar1.png" alt="Avatar Logo" 
         style="width:40px;" class="rounded-pill"> 
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>  
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Dropdown</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Link</a></li>
            <li><a class="dropdown-item" href="#">Another link</a></li>
            <li><a class="dropdown-item" href="#">A third link</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>




<div class="container mt-3">
  <h3>Navbar With Dropdown</h3>
  <p>This example adds a dropdown menu in the navbar.</p>
  

   <table class="table">
   	<colgroup>
   		<col width="30%">
   		<col width="*">
   	</colgroup>
    <tbody>
      <tr>
        <th>이름</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="이름을 입력하세요"
			    name="name" id="name">
			 </div>
        </td>
      </tr>
      <tr>
        <th>국어</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="국어 점수를 입력하세요"
			    name="kor" id="kor">
			 </div>
        </td>
      </tr>
      <tr>
        <th>수학</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="수학 점수를 입력하세요"
			    name="mat" id="mat">
			 </div>
        </td>
      </tr>
      <tr>
        <th>영어</td>
        <td>
        	 <div class="input-group">
			    <input type="text" class="form-control" placeholder="영어 점수를 입력하세요"
			    name="eng" id="eng">
			 </div>
        </td>
      </tr>
      
      
    </tbody>
  </table>
 </div>


 <div class="container" style="text-align:right">
	<button type="button" class="btn btn-primary" id="btnSend">글쓰기</button>
 </div>
 </form>
</body>
</html>
<script>
	window.onload =()=>{
		// 1. 글쓰기 버튼에 대한 참조를 가져옴
		let btnSend = document.getElementById("btnSend");
		// 2. 버튼 객체에 이벤트 핸들러를 연결
		btnSend.addEventListener("click", (e)=>{
			e.preventDefault();
			let frm = document.myform;
			frm.action="score_proc.jsp";
			frm.method="post";
			frm.submit();	// 서버 전송
		})
			}

</script>