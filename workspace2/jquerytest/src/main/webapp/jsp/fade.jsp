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
<body>
<button type="button" id="btnFadeIn">Click to fade in boxes</button><br><br>
<button type="button" id="btnFadeOut">Click to fade out boxes</button><br><br>

<div id="div1" style="width:80px;height:80px;display:none;background-color:red;"></div><br>
<div id="div2" style="width:80px;height:80px;display:none;background-color:green;"></div><br>
<div id="div3" style="width:80px;height:80px;display:none;background-color:blue;"></div>

</body>
</html>
<script>
	$(document).ready(function(){
		$("#btnFadeIn").click(function(){
			$("#div1").fadeIn();	// 기본시간
			$("#div2").fadeIn("slow");		// 천천히
			$("#div3").fadeIn(3000, ()=>{		// 몇 초만에 나타날지, 1초=1000
				alert("완료")							// 콜백함수 부여
			});		
		});
		
		$("#btnFadeOut").click(function(){
			$("#div1").fadeOut();	// 기본시간
			$("#div2").fadeOut("slow");		// 천천히
			$("#div3").fadeOut(3000, ()=>{		// 몇 초만에 사라질지, 1초=1000
				alert("완료")							// 콜백함수 부여
			});		
		});
	});
</script>