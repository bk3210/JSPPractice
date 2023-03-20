package com.kosa.myhome;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WeekPayServlet
 */
@WebServlet("/weekpay")
public class WeekPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String sName = request.getParameter("name");
		String sTime = request.getParameter("time");
		String sMoney = request.getParameter("money");
		int nTime = Integer.parseInt(CommonUtil.nullToValue(sTime, "0"));
		int nMoney = Integer.parseInt(CommonUtil.nullToValue(sMoney, "0"));
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<meta charset='utf-8'>");
		int pay = nTime * nMoney;
		double bonus = 0;
		if(nTime > 20) {
			bonus =(nTime-20)* nMoney * 0.5;
		}
		double total = (double)pay + bonus;
		out.println("<h1>" + String.format("%s씨의 근무시간은 %d시간, 기본급은 %d원, 추가급은 %.2f입니다.<br/>총 급여는 %.2f원입니다.", sName, nTime, pay, bonus, total));
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
