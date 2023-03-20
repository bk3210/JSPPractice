<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- score.jsp : 데이터 입력을 위한 페이지 -->
<!-- 서버에서 데이터를 받아 처리할 때 처리 페이지는 jsp, servlet 등 아무거나 
	전적으로 jsp로만 만들면 문제점
		1. 보안에 취약함(페이지 이동 url이 다 적혀 있으니까)
		2. html, css, javascript, java 코드가 모두 한데 있어 너무 복잡하다
		3. 로그인 등의 세션 정보를 각 페이지마다 유지해야 해서 전체적인 관리가 너무 어려워진다
		
		
		이런 반성으로 다시 서블릿으로 옮겨갔음
		현재는 jsp에 최소한의 자바 코드만 쓰고, db에 데이터를 입력하고, 페이지 이동은 서블릿과 자바클래스가 담당
		이걸 모델2 방식이라고 하고 현재 웹 개발의 주력방식이 됨-->
	<form name="myform" action="/Jan03_myhome/score">
		이름 : <input type="text" name="name"><br/>
		국어 : <input type="text" name="kor"><br/>
		수학 : <input type="text" name="mat"><br/>
		영어 : <input type="text" name="eng"><br/>
		<button type="button" id="result">결과출력</button><br/>
	</form>
	
	<!-- form태그에는 action 속성과 method 속성이 있는데, 값을 주지 않으면 action은 자기 페이지, 
	method는 get방식이 기본값이 된다 
	button tag는 type을 button으로 지정하지 않으면 submit이 기본값이 된다-->
	
	<!--  ctrl-shift-r : 크롬 캐시 삭제
		  css랑, html이나 자바스크립트만 변경하면 이전에 실행되었던 페이지에 대한 정보를 임시저장 시켜놓고
		  그 데이터를 불러와서 바로 반영이 안되는 경우가 있다.
		  이때 이 메모리(캐시메모리)를 지우는 역할을 한다. 익스플로러는 별도로 메뉴에서 항상 새로고침할 수 있게 되어 있다 -->
	
	<!-- cache : 문서를 서버로부터 불러와서 내 메모리에 쌓아놓음.
				 동일 문서를 서버에 요청해서 
				 내용상 바뀐 게 없다고 판단하면 메모리에 있는 걸 도로 출력함
				 SSD(플래시메모리 - 속도가 빠르고 비쌈, 하드디스크 아님! 대용량, 고속 보조기어장치) 
				 
				 -->

</body>
</html>
<script>
	// window.onload는 스크립트 초기에 한번만 씀
	// 메모리에 함수 인덱스를 전달하는 역할
	window.onload=()=>{
		let btnResult=document.getElementById("result");
			
		// 자바의 comparator나 comparable 인터페이스처럼 비슷하게 사용됨
		// Java에서는 sort를 직접 구현하지 않고, 대부분을 Java가 구현
		// 비교 부분은 데이터 타입마다 달라져야 하므로
		// 그 부분만 인터페이스로 만들어서 사용자가 새로 정의해서 보낼수 있도록 해 두었음
		// 개발자가 완성만 하면 바로 쓸 수 있도록 해서 프로그래머의 일을 줄이는 것
		
		// 이벤트 프로그래밍 방식 : 메소드(함수)를 직접 만들지 않고 이미 만들어져 있는 메소드를 요청을 통해 호출하는 것
		btnResult.addEventListener("click", (e)=>{
		// 실제 호출자는 addEventListener가 아니라 시스템임
		// button이라는 객체가 이미 만들어져 있고 이것을 클릭했을 때 발생하는 이벤트에 대응하는 함수(이것도 미리 만들어져 있음)를 두번째 인자에 지정하는 것
		// addEventListener의 첫번째 인자는 이벤트 종류이고, 두번째 인자는 첫번째 인자로 전달되는 이벤트가 발생했을 때 호출될 콜백함수 주소
		// 함수나 함수 표현식, 화살표 함수 모두 가능하다
		// 이 때 전달될 콜백함수는 발생한 이벤트에 대한 모든 정보들을 갖고 있는 객체를 매개변수로 갖고 있다.
		// 이 객체는 시스템이 사용자한테 전달하고 이 정보를 이용해 부가적인 처리들을 수행한다.
		
		console.log(e.target);	// 이벤트가 발생한 객체의 참조를 갖고 있다
		// console.log(e); // 객체의 내용
			// 마우스 클릭 -> os의 메시지루프 -> 브라우저 -> 이벤트가 발생한 객체의 정보 -> 전달
			
			// e.preventDefault();		// 이벤트가 발생한 객체의 고유 기능을 뺏고 다른 기능을 부여하기 위해 사용
				// 즉, button이 가진 디폴트 기능을 빼앗음(만약 버튼type을 주지 않으면 submit을 자동으로 수행하는데, 그 기능을 차단하겠다는 뜻)
			let frm = document.myform;
			
			
			// 입력값이 없을 때를 걸러내기 위한 예외처리
			if(frm.name.value.trim()==""){	// 데이터 앞뒤의 쓸데없는 공백을 없애는 trim()
				alert("이름을 입력하세요");
				frm.name.focus();
				return false;
			}
			// 한글은 get방식으로 보내면 안됨. 한글을 변환작업 거쳐서 서버로 보내야 하기 때문
			// 			안그러면 나중에 버전이 낮은 브라우저에서 문제가 발생할 수 있음
			frm.method="post";
			// 응답을 받는 쪽에서는 request.setCharacterEncoding("utf-8");
			// get 방식으로 굳이 보내고 싶다면 urlencoding 작업을 해서 보내야 함
			// 받는 쪽에서는 urldecoding 작업을 해서 받아야 한다
			
			// action에 값이 들어가 있는 상태라 url로 이동함
 			frm.submit();
		});
	}
	
	
/* 	if(frm.name.value.trim()==""){	//trim 함수 : 데이터 양쪽의 공백을 없앰
		alert("값을 입력하세요.");
		frm.name.focus();
		return false;
	}
		
	if(frm.kor.value.trim()==""){
		alert("점수를 입력하세요.");
		frm.kor.focus();
		return false;
	}
	
	if(frm.mat.value.trim()==""){
		alert("점수를 입력하세요.");
		frm.mat.focus();
		return false;
	}
	
	if(frm.eng.value.trim()==""){
		alert("점수를 입력하세요.");
		frm.eng.focus();
		return false;
	}
					 */
	/* frm.method="get";
	frm.action="/Jan03_myhome/score";	// 여기서 보낸 요청을 응답할 서블릿 url
	frm.submit();	// 서버로 전송 */
	// action에 쓴 url이 받아서 get방식으로 전송 처리하겠다는 뜻
	// (form에서 줬으므로 생략)
	// }


</script>