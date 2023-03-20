package com.kosa.myhome;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/add")
public class AddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// 데이터를 받아오는 부분(기본적으로 String으로 정보전달함)
		String sX = request.getParameter("x");
		String sY = request.getParameter("y");
		String operator = CommonUtil.nullToValue(request.getParameter("operator"), "1");	// jsp에서 전송된 operator값을 ㅂ다아서 저장
		System.out.println(operator);
		
		// if문으로 전송된 operator값에 따라 다른 연산을 처리하도록
		int nX = Integer.parseInt(sX);
		int nY = Integer.parseInt(sY);
		int nZ = 0;
		if(operator.equals("1")) {
			nZ= nX+nY;
			operator = "+";
		}else if(operator.equals("2")) {
			nZ= nX-nY;
			operator = "-";
		}else if(operator.equals("3")) {
			nZ= nX*nY;
			operator = "x";
		}else {
			nZ= nX/nY;
			operator = "/";
		}
		PrintWriter out = response.getWriter();
		out.println("<h1>"+String.format("%d %s %d = %d", nX, operator, nY, nZ) + "</h1>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
