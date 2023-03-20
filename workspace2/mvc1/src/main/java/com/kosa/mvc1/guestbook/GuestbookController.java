package com.kosa.mvc1.guestbook;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 요청한 정보 한글 안 깨지게
		response.setCharacterEncoding("utf-8"); // 보내는 정보 한글 안 깨지게
		String cmd = request.getParameter("cmd");
		
		// 서블릿 클래스가 Controller 역할을 수행중

		if (cmd == null || cmd.equals("")) {
			cmd = "list"; // 입력값이 없을때 기본값을 부여
		}
		if (cmd.equals("list")) {
			doList(request, response);
		} else if (cmd.equals("view")) {
			doView(request, response);
		} else if (cmd.equals("write")) {
			doWrite(request, response);	// 페이지 이동
		} else if(cmd.equals("save")) {
			doSave(request, response);	// 실제 DB 저장작업을 하는 메소드
		} else if(cmd.equals("modify")) {
		doModify(request, response);	
		} else if(cmd.equals("update")) {
			doUpdate(request, response);
	}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();

		// request 객체에 데이터를 저장해 보내기 : setAttribute("객체참조명", 객체정보);
		// jsp에서는 getAttribute("객체참조명"); 형식으로 값을 읽음
		// getAttribute는 Object 타입으로 다운캐스팅해서 전달
		// 사용 전에 업캐스팅으로 받아야 함

		// SetParameter라는 메소드는 없음! 값을 저장하기 위해서는 SetAttribute를 사용해 키와 값 형태로 저장해야 함
		GuestbookDTO dto = new GuestbookDTO();
		String pg = request.getParameter("pg");
		String searchOpt = request.getParameter("searchOpt");	// 얘가 null/공백이면 골치가 아픔
		String searchKey = request.getParameter("searchKey");	// 얘가 null/공백이면 골치가 아픔
		
		if(pg==null || pg.equals("")){
			pg="0";
		}
		if(searchOpt == null){		// 공백처리
			searchOpt="";
		}
		if(searchKey == null){
			searchKey="";
		}
			dto.setPg(Integer.parseInt(pg));
			dto.setSearchOpt(searchOpt);
			dto.setSearchKeyword(searchKey);
		
		request.setAttribute("totalCnt", dao.getTotalCnt(dto));
		request.setAttribute("list", dao.getList(dto));
		// List<GuestbookDTO> list = (List<GuestbookDTO>)request.getAttribute("list");
		// // 강제형변환을 통해 다운캐스팅, Object 타입을 list로

		// jsp로 토스
		// RequestDispatcher : 다른 페이지로 이동할 때 사용
		String url = "/guestbook/guestbook_list.jsp"; // 여기 있는 주소로 갈 거임(jsp를 직접 접근하지 않음! 언제나 servlet을 통해서)
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		// forward 메소드를 사용해서 페이지를 이동할 때 기존의 request와 response 객체에 담겨있던 값을 들고 이동함

		// 모든 Java의 클래스들은 언제나 부모 클래스로 object를 상속받음
		// 자식 클래스가 부모 타입으로 형변환했다가
	}

	void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		String seq = request.getParameter("seq");
		request.setAttribute("dto", dao.getView(seq));

		String url = "/guestbook/guestbook_view.jsp"; // 여기 있는 주소로 갈 거임(jsp를 직접 접근하지 않음! 언제나 servlet을 통해서)
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	
	void doWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/guestbook/guestbook_write.jsp"; // 여기 있는 주소로 갈 거임(jsp를 직접 접근하지 않음! 언제나 servlet을 통해서)
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	void doSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		
		// dto 객체에 데이터 담기
		GuestbookDTO dto = new GuestbookDTO();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContents(contents);
		dao.insert(dto);
		
		String url = request.getContextPath()+"/guestbook.do?cmd=list";
		// forwarding을 사용하지 못함 DB에서 데이터를 읽어와서 jsp로 넘겨야 하는 이중작업이 필요
		// request 객체에 전달받은 데이터를 날려야 함 - 그래야 한번만 저장됨
		response.sendRedirect(url);	// 등록하고 마지막은 절대 forwar가 아닌 sendRedirect를 써야함
		
	}
	
	void doModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		String seq = request.getParameter("seq");
		
		request.setAttribute("dto", dao.getView(seq));
		
		String url = "/guestbook/guestbook_write.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);		
	}
	
	void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestbookDAO dao = new GuestbookDAO();
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String contents = request.getParameter("contents");
		String seq = request.getParameter("seq");

		// dto 객체에 데이터 담기
		GuestbookDTO dto = new GuestbookDTO();
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContents(contents);
		dto.setSeq(seq);
		
		dao.update(dto);
		String url = request.getContextPath()+"/guestbook.do?cmd=list";
		// forwarding을 사용하지 못함 DB에서 데이터를 읽어와서 jsp로 넘겨야 하는 이중작업이 필요
		// request 객체에 전달받은 데이터를 날려야 함 - 그래야 한번만 저장됨
		response.sendRedirect(url);	// 등록하고 마지막은 절대 forwar가 아닌 sendRedirect를 써야함
	}
	
}