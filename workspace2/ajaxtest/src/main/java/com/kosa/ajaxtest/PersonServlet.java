package com.kosa.ajaxtest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/person.do")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 자바 버전이 올라가면서 이전버전에 경고가 나옴 - 무시하게 해주는 어노테이션
    // 리눅스에서는 경고때문에 서버가 안올라가는 현상이 발생할 수 있으므로 해 주는 것이 좋음
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// org.json.simple.JSONObject.Hashmap과 사용법이 똑같음
		// 받아야 할 데이터가 여러개일 경우에는 JSONArray 객체 사용
		JSONArray array = new JSONArray();
		
		JSONObject obj = new JSONObject();
		obj.put("username", "홍길동");
		obj.put("email", "hong@gmail.net");
		obj.put("phone", "010-1111-1111");
		array.add(obj);
		
		obj = new JSONObject();
		obj.put("username", "김길동");
		obj.put("email", "kim@gmail.com");
		obj.put("phone", "010-2222-2222");
		array.add(obj);
		
		obj = new JSONObject();
		obj.put("username", "이길동");
		obj.put("email", "lee@gmail.com");
		obj.put("phone", "010-3333-3333");
		array.add(obj);

		// array를 내보냄
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json, characterset=utf-8");
		response.getWriter().print(array.toJSONString());
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
