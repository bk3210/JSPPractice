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
	몇 단 : <input type="text" id="xValue"><br/>
	<div id="result"></div>
	<button id="btnCall" type="button">구구단</button>
</body>
</html>
<script>
	$(()=>{
		$("#btnCall").click(()=>{
			let x = $("#xValue").val();

			$.ajax({
				url:"dan.jsp",
				data:{"xValue":x}
			})
			.done((data)=>{
				$("#result").html(data);
			})
			.fail((error)=>{})
		});
	});
</script>