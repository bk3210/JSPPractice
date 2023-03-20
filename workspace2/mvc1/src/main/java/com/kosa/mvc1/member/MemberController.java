package com.kosa.mvc1.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		if(cmd == null || cmd.equals("")) {
			cmd = "member_write";
		}if(cmd.equals("idcheck")) {
			doIdCheck(request, response);
		}else if(cmd.equals("member_write")) {
			doWrite(request, response);
		}else if(cmd.equals("member_save")) {
			doSave(request, response);
		}else if(cmd.equals("member_login")) {
			doLogin(request, response);	// jsp로 이동만
		}else if(cmd.equals("member_login_proc")) {
			doLoginProc(request, response);
		}else if(cmd.equals("member_logout")) {
			doLogout(request, response);
		}else if(cmd.equals("member_find_id")) {
			doFindId(request, response);
		}else if(cmd.equals("member_find_id_proc")) {
			doFindIdProc(request, response);
		}else if(cmd.equals("member_find_password")) {
			doFindPassword(request, response);
		}else if(cmd.equals("member_find_password_proc")) {
			doFindPasswordProc(request, response);
}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	// http://localhost:9000/mvc1/member.do?cmd=idcheck&m_userid=test
	void doIdCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String m_userid = request.getParameter("m_userid");
		response.setContentType("application/x-json, characterset=utf-8"); 
		
		if(dao.isDuplicate(m_userid)) {		// 이미 같은 아이디로 가입한 사람이 있다면
			response.getWriter().print("{\"result\" : \"fail\"}");
		}else {
			response.getWriter().print("{\"result\" : \"success\"}");
			
		}
	}
	
	void doSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		String m_userid = request.getParameter("m_userid");
		String m_name = request.getParameter("m_name");
		String m_password = request.getParameter("m_password");
		String m_email = request.getParameter("m_email");
		String m_phone = request.getParameter("m_phone");
		
		// dto에 값 저장
		dto.setM_userid(m_userid);
		dto.setM_name(m_name);
		dto.setM_password(m_password);
		dto.setM_email(m_email);
		dto.setM_phone(m_phone);
		
		boolean result = dao.insert(dto);		// DB에 저장 수행. 성공시 true, 실패시 false 반환
		
		response.setContentType("application/x-json, characterset=utf-8"); 
		
		if(result) {		// 이미 같은 아이디로 가입한 사람이 있다면
			response.getWriter().print("{\"result\" : \"success\"}");

		}else {
			response.getWriter().print("{\"result\" : \"fail\"}");
			
		}
	}
	
	void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// member/member_login.jsp로 페이지 이동만
		String url = "/member/member_login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	void doLoginProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_userid = request.getParameter("m_userid");
		String m_password = request.getParameter("m_password");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.login(m_userid, m_password);
		JSONObject obj = new JSONObject();
		if(dto.getM_userid().equals("")) {
			// 로그인 실패시
			obj.put("result", "fail");
		}else {
			// 로그인 성공이므로 세션에 로그인 정보를 저장해야 한다
			// 서블릿에서 세션객체는 request 객체를 통해 얻어야 한다
			// 로그인과 함께 세션 객체가 생성된다 + 사파리, 크롬, 엣지 등 여러 브라우저를 써도 각자 만들어짐
			// 많은 정보를 세션에 담고싶다면 DB를 가져와야 함(기본적으로 서버에 저장되기 때문)
			HttpSession session = request.getSession();
			session.setAttribute("m_userid", dto.getM_userid());
			session.setAttribute("m_name", dto.getM_name());
			session.setAttribute("m_password", dto.getM_password());
			obj.put("result", "success");
		}
		response.setContentType("application/x-json, characterset=utf-8"); 
		response.getWriter().print(obj.toJSONString());	// JSONString 형식으로 정보 저장
	}

	@SuppressWarnings("unchecked")
	void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject obj = new JSONObject();
		HttpSession session = request.getSession();
		session.invalidate();	// 세션 삭제
		obj.put("result", "success");	// 로그아웃에 실패할 경우는 없으므로 무조건 success 값이 들어가게
		response.setContentType("application/x-json, characterset=utf-8"); 
		response.getWriter().print(obj.toJSONString());	// JSONString 형식으로 정보 저장
	}
	
	void doWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/member/member_write.jsp");
		rd.forward(request, response);
	}
	
	void doFindId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/member/member_find_id.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	void doFindIdProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_name = request.getParameter("m_name");
		String m_email = request.getParameter("m_email");
		MemberDAO dao = new MemberDAO();
		String id = dao.findId(m_name, m_email);
		JSONObject obj = new JSONObject();
		if(id.equals("")) {
			obj.put("result", "fail");
		}else {
			obj.put("result", "success");
			obj.put("m_userid", id);
		}
		response.setContentType("application/x-json, characterset=utf-8"); 
		response.getWriter().print(obj.toJSONString());	// JSONString 형식으로 정보 저장
	}
	
	void doFindPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// member/member_login.jsp로 페이지 이동만
		String url = "/member/member_find_password.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	@SuppressWarnings("unchecked")
	void doFindPasswordProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String m_userid = request.getParameter("m_userid");
		String m_email = request.getParameter("m_email");
		MemberDAO dao = new MemberDAO();
		String password = dao.findPassword(m_userid, m_email);
		JSONObject obj = new JSONObject();
		if(password.equals("")) {
			// 비밀번호를 못 찾으면
			obj.put("result", "fail");
		}else {
			obj.put("result", "success");
			obj.put("m_password", password);
		}
		response.setContentType("application/x-json, characterset=utf-8"); 
		response.getWriter().print(obj.toJSONString());	// JSONString 형식으로 정보 저장
	}
	
	
	

	
	
}
