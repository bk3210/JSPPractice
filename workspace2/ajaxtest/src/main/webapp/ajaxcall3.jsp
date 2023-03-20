<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Ajax 테스트</h1>
	<!--  Ajax 통신은 form태그로 정보 전송x 선택적으로 사용 가능 -->
	x : <input type="text" id="xValue"><br/>
	y : <input type="text" id="yValue"><br/>
	
	
	<div id="result"></div>
	<button type="button" onclick="loadDoc()">Ajax 호출 POST방식</button>

</body>
</html>
<script>
	function loadDoc(){
		let xhttp = new XMLHttpRequest();	// 비동기 통신 담당 클래스
		// 비동기 통신 담당 객체 생성
		// xhttp 객체에는 onload라는 변수가 있음 -> 이 변수에 통신이 완료된 후 호출할 메서드 주소를 전달함
		// 여기서는 화살표 함수 사용할 수 없음(통신 내용을 받아올 때 this 써야 하는데 화살표 함수는 this 못 써서)
		xhttp.onload=function(){
			// 서버로부터 응답이 완료될 때 이 함수가 호출됨
			document.getElementById("result").innerHTML = this.responseText;
			// this : xhttp 객체 자기자신
			// 통신이 완료되고 나면 responseText 변수에 서버로부터 전달받은 값이 들어있음
		}
		
		// POST방식으로 보내기
		let params="xValue=" + document.getElementById("xValue").value+"&yValue=" + document.getElementById("yValue").value;
		console.log(params);
		// 서버로 요청
		xhttp.open("POST", "receive1.jsp", true);
			//첫번째 속성 : 통신방식(get/post)
			// post는 패러미터를 전달받는 방식이 복잡하므로 바로 javascript로 ajax를 처리하지 않고 jquery나 axios같은 라이브러리를 이용해 처리한다
			// 두번째 속성 : 서버 주소. jsp나 servlet을 호출할 수 있다(여기선 테스트로 txt 호출)
			// 세번째 속성 : 동기/비동기 여부. 보통은 true만 사용
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send(params);	// 위 정보를 기반으로 서버와 통신	
	}

</script>