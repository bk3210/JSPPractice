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
<!-- jQuery할 때는 form 태그에도 id값을 주는 게 낫다 -->
<form id="myform" name="myform">
	관심분야 : <br/>
	<input type="checkbox" name="interest" value="1">프로그래밍
	<input type="checkbox" name="interest" value="2">웹프로그래밍
	<input type="checkbox" name="interest" value="3">데이터베이스
	<input type="checkbox" name="interest" value="4">빅데이터
	<input type="checkbox" name="interest" value="5">머신러닝
	<input type="checkbox" name="interest" value="6">AI
	<br/><br/>
		
	<button id="btnSelectAll" type="button">전체선택</button>	
	<button id="btnReleaseAll" type="button">전체선택해제</button>	
</form>
</body>
</html>
<script>
	$(()=>{
		$("#btnSelectAll").click(()=>{
			$("input[type=checkbox][name=interest]").prop("checked", true);
			});
			
		$("#btnReleaseAll").click(()=>{
			$("input[type=checkbox][name=interest]").prop("checked", false);
			});		
	});
</script>