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
}

</style>
</head>
<body>
	<div id="flip">Click</div>
	<div id="panel">Hello new year!!</div>
</body>
</html>
<script>
	$(function(){
		$("#panel").css("display", "none");	// 처음엔 보이지 않게 하고 시작
		// slideUp, Down이 display 속성도 바꾼다
		/* $("#flip").click(()=>{
		$("#panel").slideUp("slow");
	}); */
		// 내려간 뒤 2초 후 올라가기
		$("#flip").click(()=>{
		$("#panel").slideDown("slow", function(){
			// 다 내려오고 나면 콜백함수 호출
			// 자바스크립트의 setTimeout(함수, 시간); : 뒤에 지정한 시간이 흐른 이후 함수인자를 한번 호출
			// 2초마다 계속 발생시키고 싶다면 setInterval 함수를 사용
			setTimeout(()=>{
				$("#panel").slideUp();
			}, 2000);		// 2초에 한 번 작동
		});
	});
})
</script>