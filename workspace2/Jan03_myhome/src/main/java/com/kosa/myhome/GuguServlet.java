package com.kosa.myhome;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GuguServlet
 */
@WebServlet("/gugudan")
public class GuguServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GuguServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		int i = 0;
//		String dan = request.getParameter("dan");
//		if (dan == null || dan.equals("")) {	// x값에 이상한값 못들어오게 하는 예외처리
//			dan = "2";
//		}
		String dan = CommonUtil.nullToValue(request.getParameter("dan"), "2");	// 이거랑 위에 if문이랑 같음
		int nX = Integer.parseInt(dan);
		PrintWriter out = response.getWriter();
		for (i = 1; i < 10; i++) {
			out.println(String.format("<h1>%d X %d = %d</h1>", nX, i, (nX * i)));

		}
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
