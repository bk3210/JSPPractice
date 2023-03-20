<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive3.jsp</title>
</head>
<body>
	<h1>Ajax 테스트</h1>
	<table style="width:60%; margin:auto">
		<colgroup>
			<col width = "20%">
			<col width = "50%">
			<col width = "30%">
		</colgroup>
		<thead>
			<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
		</thead>
		<tbody id="tbody">
			
		</tbody>
	</table>
	
	<div id="result"></div>
	<button type="button" onclick="loadDoc()">Servlet을 통해 JSON배열 받아오기</button>
</body>
</html>
<script>
	// 가장 일반적인 형태
	function loadDoc(){
		let xhttp = new XMLHttpRequest();	// 비동기 통신 담당 클래스
		xhttp.onload=function(){
			// 서버로부터 응답이 완료될 때 이 함수가 호출됨
			data = JSON.parse(this.responseText);
			// String -> JSON 객체로 전환
			// 이번엔 responseText가 아니라 JSON 객체에 데이터 받아올 거임
			let tbody = document.getElementById("tbody");
			deleteAll();	// 요청이 오면 기존 테이블에 있던 데이터를 모두 삭제한 뒤 호출하자
			// 데이터가 배열로 오면 배열 요소별로 호출 요청이 발생한다
			data.forEach((item)=>{
				let row = tbody.insertRow(tbody.rows.length);
				// 테이블의 마지막 행을 추가
				let cell1 = row.insertCell(0);		// 0번 컬럼 추가
				let cell2 = row.insertCell(1);		// 1번 컬럼 추가
				let cell3 = row.insertCell(2);		// 2번 컬럼 추가
				
				cell1.innerHTML = item.username;
				cell2.innerHTML = item.email;
				cell3.innerHTML = item.phone;
			});
		}
		
		// get방식일 경우 receive1.jsp?xValue = 5&yValue=8 과 같은 형태로 url 생성
		let url="/ajaxtest/person.do";	// 결과를 JSON 형태로 보냄
		// html 등의 태그 없이 JSON 데이터만 전송해야 함
		console.log(url);
		// 서버로 요청
		xhttp.open("GET", url, true);
		xhttp.send();	// 위 정보를 기반으로 서버와 통신	
	}
	
	// delete하지 않으면 ajax 요청이 발생할 때마다 계속해서 배열에 새 데이터가 추가됨
	function deleteAll(){
		let tbody = document.getElementById("tbody");
		for(i = tbody.rows.length-1; i>=0; i--){
			tbody.deleteRow(i);
		}
	}

</script>