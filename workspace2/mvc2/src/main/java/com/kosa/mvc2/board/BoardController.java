package com.kosa.mvc2.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest multi = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 요청한 정보 한글 안 깨지게
		response.setCharacterEncoding("utf-8"); // 보내는 정보 한글 안 깨지게

		ServletContext ctx = request.getServletContext();
		String savePath = ctx.getRealPath("/upload/board");

		int sizeLimit = 1024 * 1024 * 20;
		System.out.println("method: " + request.getMethod());
		System.out.println("contentType: " + request.getContentType());

		String cmd = "";
		String method = request.getMethod();
		String contentType = request.getContentType();
		if (contentType == null || !contentType.startsWith("multipart")) {
			cmd = request.getParameter("cmd");
			if (cmd == null || cmd.equals("")) {
				cmd = "list";
			}
		} else {
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			cmd = multi.getContentType("cmd");
		}
		System.out.println("****" + cmd);

		if (cmd.equals("list")) {
			doList(request, response);
		} else if (cmd.equals("view")) {
			doView(request, response);
		} else if (cmd.equals("write")) {
			doWrite(request, response);
		} else if (cmd.equals("save")) {
			doSave(request, response);
		} else if (cmd.equals("save2")) {
			doSave2(request, response);
		}

	}

	protected void doList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		String pg = request.getParameter("pg");

		if (pg == null || pg.equals("")) {
			pg = "0";
		}
		dto.setPg(Integer.parseInt(pg));
		request.setAttribute("totalCnt", dao.getTotalCnt(dto));
		request.setAttribute("list", dao.getList(dto));

		RequestDispatcher rd = request.getRequestDispatcher("/board/board_list.jsp");
		rd.forward(request, response);
	}

	protected void doWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/board/board_write.jsp");
		rd.forward(request, response);
	}



	// 일반 submit(get방식)으로 글쓰기할 때
	protected void doSave(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = multi.getParameter("b_b_title");
		String writer = multi.getParameter("b_b_writer");
		String contents = multi.getParameter("b_b_contents");

		String filename = multi.getFilesystemName("b_b_image");
		String originalFilename = multi.getFilesystemName("b_b_image");
		System.out.println(filename);
		System.out.println(originalFilename);

		BoardDTO dto = new BoardDTO();
		dto.setB_b_title(title);
		dto.setB_b_writer(writer);
		dto.setB_b_contents(contents);
		dto.setB_b_image(filename);

		BoardDAO dao = new BoardDAO();
		dao.insert(dto);
		String url = request.getContentType() + "/board.do?cmd=list";
		response.sendRedirect(url);

		RequestDispatcher rd = request.getRequestDispatcher("/gallery/gallery_write.jsp");
		rd.forward(request, response);
	}

	protected void doView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String seq = request.getParameter("seq");
		request.setAttribute("dto", dao.getView(seq));
		
		RequestDispatcher rd = request.getRequestDispatcher("/board/board_view.jsp");
		rd.forward(request, response);
	}

	// ajax 방식으로 글쓰기할 때
	protected void doSave2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println(request.getParameter("b_b_title"));
//		System.out.println(request.getParameter("b_b_writer"));
//		System.out.println(request.getParameter("b_b_contents"));

		// 파일 업로드해야 한다
		String title = multi.getParameter("b_b_title");
		String writer = multi.getParameter("b_b_writer");
		String contents = multi.getParameter("b_b_contents");

		// tag의 name 속성
		String filename = multi.getFilesystemName("image");
		String originalFilename = multi.getOriginalFileName("image");

		System.out.println(filename);
		System.out.println(originalFilename);

		BoardDTO dto = new BoardDTO();
		dto.setB_b_title(title);
		dto.setB_b_contents(contents);
		dto.setB_b_writer(writer);
		dto.setB_b_image(filename);

		BoardDAO dao = new BoardDAO();
		dao.insert(dto);

		JSONObject obj = new JSONObject(); // JSON으로 데이터를 전송해주는 전용 객체 JSONObject 생성
		obj.put("result", "success"); // 키, 값의 쌍 형태로 저장
		response.setContentType("application/x-json, characterset=utf-8"); // content의 타입을 지정해준다
		// JSON으로 정보를 내보낼 때는 형식이 무엇인지 지정해주는 작업이 필요하고, 한글이 깨질 수 있으므로 이것을 예방해주는
		// characerset 속성을 추가해 주었다
		// 기본적으로 정보에 명시된 타입이 없으면 text로 받고, <html> 태그가 있으면 html로 받는데 JSON이나 이미지, 동영상 등
		// 지정할 수 있는 타입이 아주 많다
		response.getWriter().print(obj.toJSONString());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
