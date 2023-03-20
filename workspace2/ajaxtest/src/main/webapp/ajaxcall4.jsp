<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>receive2.jsp</title>
</head>
<body>
	<h1>Ajax 테스트</h1>
	
	
	<div id="result"></div>
	<button type="button" onclick="loadDoc()">JSON결과 받아오기</button>

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
			
			console.log(data);
			//JSON객체 끄집어내기
			let result="";
			result += "이름 : " + data.username + "<br/>";
			result += "이메일 : " + data.email + "<br/>";
			result += "전화번호 : " + data.phone + "<br/>";
			document.getElementById("result").innerHTML = result;
		}
		
		// get방식일 경우 receive1.jsp?xValue = 5&yValue=8 과 같은 형태로 url 생성
		let url="receive2.jsp";	// 결과를 JSON 형태로 보냄
		// JSON의 데이터 형식은 {"키1" : "값1", "키2" : "값2", "키3" : "값3", ...}
		// html 등의 태그 없이 JSON 데이터만 전송해야 함
		console.log(url);
		// 서버로 요청
		xhttp.open("GET", url, true);
		xhttp.send();	// 위 정보를 기반으로 서버와 통신	
	}
	
	

</script>