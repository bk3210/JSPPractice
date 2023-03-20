package com.kosa.myhome3;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
// @WebServlet(url) : url이 옳은 주소일 때 서블릿에 호출됨
// get -> doGet 메소드 호출
// post -> doPost 메소드 호출
// http://127.0.0.1:9000/Jan02_myhome3/hello가 url이 됨
//@WebServlet("/hello")	// 애가 xml에 매핑 작업을 해줌(이거 안 쓰려면 xml에 mapping tag 써야함)	// Tomcat 6.0 버전 이상부터 추가된 신기능
public class HelloServlet extends HttpServlet {	// HttpServlet 클래스를 상속받음
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
