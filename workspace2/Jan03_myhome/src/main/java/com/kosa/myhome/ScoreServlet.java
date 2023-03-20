package com.kosa.myhome;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ScoreServlet
 */
@WebServlet("/score")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8"); // 받아오는 한글 정보를 안 깨지게 하는 것
		response.setCharacterEncoding("utf-8"); // 보내는 한글 정보 안 깨지게
		// 이 두개랑 밑에 meta charset 써주고 html문서로 인식하게 해주는 것까지 다 쳐줘야 한글 깨지지 않고 출력됨

		// request값을 받아오는 객체(요구사항을 클라이언트로부터 받아옴)
		// request.getParameter("input태그의 name속성")을 통해 값을 받아온다
		// getParameter는 String으로 된 파라미터를 받아 String을 반환한다
		// <input type = "text" name="name" value="홍길동">이라는 태그가 있을 경우
		// getParameter("name")이라고 요청하면 value 속성에 저장된 값을 반환한다
		// 한글은 인코딩하지 않으면 깨짐
		String sName = request.getParameter("name");
		String sKor = request.getParameter("kor"); // getParameter값은 String으로만 받을수있다
		String sMat = request.getParameter("mat"); // 먼저String으로 받아와서 int로 바꿔줘야 함
		String sEng = request.getParameter("eng");

		// 정수를 변수로 전환
		// 만약파라미터가 존재하지 않으면 null이, 존재해도 값이 없으면 ""이 넘어옴
		// 값이 없을 경우 Integer.parseInt는 예외를 발생시킨다
		// 제대로 된 값이 넘어왔는지 확인은 개발자가 해야 함
		int nKor = Integer.parseInt(CommonUtil.nullToValue(sKor, "0"));
		int nMat = Integer.parseInt(CommonUtil.nullToValue(sMat, "0"));
		int nEng = Integer.parseInt(CommonUtil.nullToValue(sEng, "0"));
		// 값이 들어오지 않으면 자동으로 0을 넣어 주겠다는 뜻
		// CommonUtil.nullToValue는 static 함수라서 클래스로 호출이 가능함
		// CommonUtil.nullTuValue 클래스는 생성자가 private라서 객체를 생성하지 못함
		// 클래스 설계법중의 하나로, 클래스 내부에서 공통의 객체가 없이 기능상 공유만 있을 경우 이렇게 설계함
		// CommonUtil util = new CommonUtil()로 쓰면 지금은 에러남
		PrintWriter out = response.getWriter();
		// PrintWriter : 브라우저에 정보를 출력하는 객체
		out.println("<html>");	// 보내는 정보가 html임을 알려서 태그가 태그로 동작할 수 있도록
		out.println("<meta charset='utf-8'>");	// 한글깨짐 방지
		int total = nKor + nEng + nMat;
		float avg = total/3.0f;
		out.println("<h1>" + String.format("%s씨의 총점은 %d, 평균은 %.2f입니다.", sName, total, avg, "</h1>"));
		out.println("</html>");
		// 나중에 float로 형변환해도 이미 소수점 이하가 없어진 상태에서 뒤에 소수점만 붙는다
		// 두 값중 하나를 float로 전환하면 나머지도 float로 연산되므로 결과가 float로 나옴
		// 3.0으로 쓰면 자바가 double로 인식해서 경고나 에러가 뜬다
		// 좌변의 변수 avg가 float이기 때문에 double형 값을 입력하면 메모리 크기가 달라서 데이터 손실이 벌어지기 때문에 자동 형변환이 일어나지 않는다
		// 그래서 3.0f로 나눔
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
