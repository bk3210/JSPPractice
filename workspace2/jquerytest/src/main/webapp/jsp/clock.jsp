<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	#panel, #flip{
	padding:5px;
	text-align:center;
	background-color:#8888ff;
	border:solid 1px #c3c3c3;
}

#panel{
	padding:50px;
	font-size:30pt;
}

</style>
</head>
<body>
	<div id="flip">시계 시작과 종료</div>
	<div id="panel">Hello new year!!</div>
</body>
</html>
<script>
let timer1=null;
	$(()=>{
		$("#flip").click (()=>{
		// setInterval(함수, 시간)		// 시간마다 함수가 호출됨
		// timer1을 click의 지역변수로 두면 함수가 동작을 종료할 때 사라짐(클릭을 할 수가 없어짐)
		// Java의 static처럼 전역변수화 해야 함
		if(timer1!=null){		// 이미 시작된 시계 객체가 있다면
			clearTimeout(timer1);		// 종료하지만, timer1 객체가 null화 되지는 않음
			timer1=null;		// 즉 직접 초기화(안하면 setInterval이 계속 호출됨)
		}else{			
		timer1 = setInterval(()=>{
			today = new Date();
			hour = today.getHours();
			minutes = today.getMinutes();
			seconds = today.getSeconds();

			currentTime = hour+"시 " + minutes+"분 " + seconds+"초";
			$("#panel").html(currentTime);
		}, 1000);
		}
	});
		// 반환값이 핸들, 객체 식별값
	});
</script>