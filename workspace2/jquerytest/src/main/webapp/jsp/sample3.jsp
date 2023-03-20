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
<p> p태그 1</p>
<p> p태그 1</p>
<p> p태그 2</p>
<p> p태그 3</p>
<p> p태그 4</p>
<p> p태그 5</p>
<p class="intro"> p태그 6</p>
<p> p태그 66</p>
<p class="intro"> p태그 7</p>
<p class="intro"> p태그 8</p>
<p class="intro"> p태그 9</p>

<h3 class="intro">h3태그1</h3>
<h3 class="intro">h3태그2</h3>
<h3 class="intro">h3태그3</h3>

<button type="button" id="btnClick1">전체적용</button>
<button type="button" id="btnClick2">클래스적용1</button>
<button type="button" id="btnClick3">클래스적용2</button>
<button type="button" id="btnClick4">첫번째 것만</button>
<br/>

<table>
	<tr>
		<td>1행 1열</td>
	</tr>
	<tr>
		<td>2행 1열</td>
	</tr>
	<tr>
		<td>3행 1열</td>
	</tr>
	<tr>
		<td>4행 1열</td>
	</tr>
	<tr>
		<td>5행 1열</td>
	</tr>
</table>
<button type="button" id="btnChange">테이블 선택</button>

</body>
</html>
<script>
	$(document).ready( ()=>{
		$("#btnClick1").click(()=>{
			$("*").css("color", "red");		// 스타일 속성 바꾸기
		});
		
		$("#btnClick2").click(()=>{
			$(".intro").css("color", "green");		// 스타일 속성 바꾸기
		});
		
		$("#btnClick3").click(()=>{
			$("p.intro").css("color", "blue");		// 스타일 속성 바꾸기
		});
		
		$("#btnClick4").click(()=>{
			$("p:first").css("background-color", "gray");
			$("h3:first").css("background-color", "gray");
			$("p:last").css("background-color", "cyan");		
			$("h3:last").css("background-color", "cyan");
		});
		
		$("#btnChange").click(()=>{
			$("tr:even").css("background-color", "red");
		});
	});
</script>