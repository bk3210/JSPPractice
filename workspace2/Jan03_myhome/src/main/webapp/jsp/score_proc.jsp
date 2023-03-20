<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.kosa.myhome.CommonUtil" %>	<!-- import할 클래스를 이런 식으로 쓸 수 있음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이게 뭘까....? 내가 뭘 하는걸까?</title>
</head>
<body>
<!-- score_proc.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	String nName = CommonUtil.nullToValue(request.getParameter("name"), "");
	int nKor = Integer.parseInt(CommonUtil.nullToValue(request.getParameter("kor"), "0"));
	int nMat = Integer.parseInt(CommonUtil.nullToValue(request.getParameter("mat"), "0"));
	int nEng = Integer.parseInt(CommonUtil.nullToValue(request.getParameter("eng"), "0"));
	int total = nKor + nEng + nMat;
	float avg = total/3.0f;
	
	// 변수값을 출력할 경우 jsp에서는 아래와 같이 처리함
	// webapp - html, css, image, jsp는 이 공간에
	//	ㄴWEB-INF - WEB-INF 폴더가 있는 상위 폴더가 웹 폴더가 됨
	// 패키지명은 충돌 가능성이 있어서 프로젝트를 진행하는 회사 도메인을 뒤집는 식으로 표기함
	// org.eclipse, 프로젝트명 아래에만 코드를 둔다
	
	// webapp까지가 /myhome4의 위치고 여기에 파일을 두지 않으면 자바가 직접 접근할 수 없음
	// 실제 실행할 때는 java가 번역되어서 class 파일이 만들어져서 WEB-INF 밑에 classes 폴더가 만들어지고 이 폴더에 들어감
	
	// WAS - 웹로직(가장 많은 시장을 차지함),
	// 제우스 - 국산 WAS
	// 관공서, 대학 등 국가기관들은 거의 다 제우스가 설치되어 있음
	// 레진 : 비교적 저렴하고 사용이 ㅕㄴ리
	// 
%>
<%=nName %>의 총점은 <%=total %>, 평균은 <%=avg %>입니다
</body>
</html>