<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h1>jQuery ajax</h1>
	<div id="result"></div>
	<button id="btnCall" type="button">ajax call</button>
</body>
</html>
<script>
	$(()=>{
		$("#btnCall").click(()=>{
			$.ajax({url:"ajax_test.txt"})				// JSON 형식으로 파일을 불러오겠다는 뜻 : url은 키값(시스템이 부여함)
			.done((data)=>{
				$("#result").html(data);
			})
			.fail((error)=>{})
		});
	});
</script>