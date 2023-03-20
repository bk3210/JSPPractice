package com.kosa.myhome;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// request : 클라이언트로부터 요청을 받아오는 객체
		// response : 서버->클라이언트로 응답을 보내기 위한 객체이다

		// ctrl + shift + o : 클래스를 한번에 import함
		
		request.setCharacterEncoding("utf-8");	// 받아오는 한글 정보를 안 깨지게 하는 것
		response.setCharacterEncoding("utf-8");	//이거랑 밑에 meta charset 써주고 html문서로 인식하게 해주는 것까지 다 쳐줘야 한글 깨지지 않고 출력됨		
		PrintWriter out = response.getWriter();	// 클라 화면에 출력됨
		out.println("<html>");
		out.println("<meta charset='utf-8'>");
		out.println("<h1>Hello Servlet</h1>");
		out.println("안녕하세요 서블렛입니다");
		out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
