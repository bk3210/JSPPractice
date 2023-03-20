package com.kosa.ajaxtest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class GuestbookController
 */
@WebServlet("/guestbook.do")
public class GuestbookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GuestbookController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * response.setCharacterEncoding("utf-8"); // 태그 안됨 - JSON으로 보내고 싶다면
		 * response.setContentType("application/x-json, characterset=utf-8"); String
		 * result =
		 * "{\"username\" : \"홍길동\", \"email\" : \"hong@gmail.com\", \"phone\" : \"010-1111-1111\"}"
		 * ; PrintWriter writer = response.getWriter(); writer.print(result);
		 */
		
		response.setCharacterEncoding("utf-8"); // 태그 안됨 - JSON으로 보내고 싶다면
		 response.setContentType("application/x-json, characterset=utf-8");
		 GuestbookDAO dao = new GuestbookDAO();
		 List<GuestbookDTO> list = dao.getList();
		 JSONArray array = new JSONArray();
		 // ctrl + shift + o -> 자동 import
		 for(GuestbookDTO dto : list) {
			 JSONObject object = new JSONObject();
			 object.put("seq", dto.getSeq());
			 object.put("title", dto.getTitle());
			 object.put("contents", dto.getContents());
			 object.put("writer", dto.getWriter());
			 object.put("wdate", dto.getWdate());
			 object.put("hit", dto.getHit());
			 array.add(object);
		 }
		 
		 PrintWriter writer = response.getWriter();
		 writer.print(array.toJSONString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
