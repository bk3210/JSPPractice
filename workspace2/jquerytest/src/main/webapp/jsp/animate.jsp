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
<div id="box" style="background:#98bf21;height:100px;width:100px;position:absolute;"></div>
</body>
</html>
<script>
$(()=>{
	$("#box").click( ()=>{
		/* $("#box").animate({
				left:"500px",		// 키, 값 형태의 JSON으로 파라미터를 넘기는 것
				top:"150px",
				opacity:0.2
			}, 3000);		// 3초에 걸쳐 투명해지기 */
			
			$("#box").animate({
				left:"500px",		// 키, 값 형태의 JSON으로 파라미터를 넘기는 것
				opacity:"0.2"
			}, 3000, ()=>{
				$("#box").animate({
					top:"250px",
				}, 3000)
			});		
	})
})
</script>