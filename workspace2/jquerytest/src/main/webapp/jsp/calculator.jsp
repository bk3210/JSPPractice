<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
x :	<input type="text" id="x"><br/>
y :	<input type="text" id="y"><br/>
result : <span id="result"></span>

<button id="btnAdd" type="button">+</button>
<button id="btnSub" type="button">-</button>
<button id="btnMul" type="button">x</button>
<button id="btnDiv" type="button">%</button>
</body>
</html>
<script>
	$(()=>{
		$("#btnAdd").click(()=>{
			var x = parseInt($("#x").val());
			var y = parseInt($("#y").val());
			$("#result").html(x+y);
		});
		
		$("#btnSub").click(()=>{
			var x = parseInt($("#x").val());
			var y = parseInt($("#y").val());
			$("#result").html(x-y);
		});
		
		$("#btnMul").click(()=>{
			var x = parseInt($("#x").val());
			var y = parseInt($("#y").val());
			$("#result").html(x*y);
		});
		
		$("#btnDiv").click(()=>{
			var x = parseInt($("#x").val());
			var y = parseInt($("#y").val());
			$("#result").html(x/y);
		});
	})

</script>