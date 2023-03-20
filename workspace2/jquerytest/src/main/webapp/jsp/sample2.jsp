<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/jquerytest/js/jquery-3.6.3.min.js"></script> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script><!-- 이게 cdn...? -->
</head>
<body>
	<h1>jQuery 테스트 1</h1>
	<h1>jQuery 테스트 2</h1>
	<h1 id="test1">jQuery 테스트 3</h1>
	<h1 id="test1">jQuery 테스트 4</h1>
	<h1 class="test1">jQuery 테스트 5</h1>
	<h1 class="test1">jQuery 테스트 6</h1>
	<h1 class="test1">jQuery 테스트 7</h1>

	<button type="button" id="btnClick1">태그로 접근하기</button>
	<button type="button" id="btnClick2">id로 접근하기</button>
	<button type="button" id="btnClick3">class로 접근하기</button>
</body>
</html>
<script>
	$(document).ready( ()=>{
		$("#btnClick1").click(()=>{
			$("h1").html("태그로 접근하기");
		});
		
		$("#btnClick2").click(()=>{
			$("#test1").html("id로 접근하기");		// 첫번째 요소인 <h1 id="test1">jQuery 테스트 3</h1>만 영향 받음
		});
		
		$("#btnClick3").click(()=>{
			$(".test1").html("클래스로 접근하기");
		});
		
		$("h1").click(function(){
			$(this).html("this. 로 접근하기");		// h1 태그가 적용된 요소들을 클릭하면 글자가 바뀐다
		})		
	});
</script>