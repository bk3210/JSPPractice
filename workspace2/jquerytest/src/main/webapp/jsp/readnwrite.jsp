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
	<input type="hidden" name="seq" id="seq"><br/>
	이름 : <input type="text" name="username"><br/>
	이메일 : <input type="text" name="email"><br/>
	나이 : <br/>
	<input type="radio" name="age" value="10">10대
	<input type="radio" name="age" value="20">20대
	<input type="radio" name="age" value="30">30대
	<input type="radio" name="age" value="40">40대
	<input type="radio" name="age" value="50">50대
	<input type="radio" name="age" value="60">60대
	<br/><br/>
	관심분야 : <br/>
	<input type="checkbox" name="interest" value="1">프로그래밍
	<input type="checkbox" name="interest" value="2">웹프로그래밍
	<input type="checkbox" name="interest" value="3">데이터베이스
	<input type="checkbox" name="interest" value="4">빅데이터
	<input type="checkbox" name="interest" value="5">머신러닝
	<input type="checkbox" name="interest" value="6">AI
	<br/><br/>
	좋아하는 색 : <br/>
	<select name="color">
		<option value="">==선택하세요==</option>
		<option value="red">red</option>
		<option value="blue">blue</option>
		<option value="green">green</option>
		<option value="yellow">yellow</option>
		<option value="black">black</option>
		<option value="purple">purple</option>
	</select>
	<br/><br/>
	<textarea name="intro" cols="30" rows="10"></textarea>
	<button id="btnRegister" type="button">결과 보내기</button>	
</form>
</body>
</html>
<script>
	$(()=>{
		// name속성을 이용해 값 저장
		$("input[type=hidden][name=seq]").val(10);
		$("input[type=text][name=username]").val("홍길동");
		$("input[type=text][name=email]").val("hong@gmail.com");
		$("input[type=radio][name=age]").eq(1).prop("checked", true);
		$("input[type=checkbox][name=interest]").eq(0).prop("checked", true);
		$("input[type=checkbox][name=interest]").eq(2).prop("checked", true);
		$("select[name=color]").val("blue");
		$("textarea[name=intro]").val("자기소개입니다. \n저는 자상하신 아버지와 다정하신 어머니 밑에서 1남 1녀중 1녀로 태어나~");
		
		$("#btnRegister").click(()=>{
			console.log($("input[type=hidden][name=seq]").val());
			console.log($("input[type=text][name=username]").val());
			console.log($("input[type=text][name=email]").val());
			// 선택한 항목의 값만 출력하기
			console.log($("input[type=radio][name=age]:checked").val());
			
			// checkbox는 선택된 항목이 배열로 오기 때문에 변수 하나를 두고 거기에 값을 모아와야 함
			let interest="";
			$("input[type=radio][name=interest]:checked").each(function(){			// Java의 for문과 같음
				interest += $(this).val() + ", ";
			});
			console.log($("select[name=color]").val());
			console.log($("textarea[name=intro]").val());
		});
		
	});
</script>