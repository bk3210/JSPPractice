package com.kosa.mvc1.gallery;

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
 * Servlet implementation class GalleryController
 */
@WebServlet("/gallery.do")
public class GalleryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MultipartRequest multi = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		// 서블릿 최근버전에서 사용함
		ServletContext ctx = request.getServletContext();
		// getRealPath : 상대경로를 실제 경로로 변환해주는 메서드
		String savePath = ctx.getRealPath("/upload/gallery");	 // 파일 저장 경로
		
		int sizeLimit = 1024*1024*20;		// 파일크기, 최대 20M
		System.out.println("method: " +request.getMethod());
		System.out.println("contentType: " +request.getContentType());
		// method: GET
		// contentType: null
		
		String cmd="";
		String method = request.getMethod();
		String contentType = request.getContentType();		// 파일을 보낼 때 타입이 무엇인지(텍스트인지, 이미지인지, JSON 객체인지....)에 대한 정보를 담음
		if(contentType==null || !contentType.startsWith("multipart")) {
			cmd = request.getParameter("cmd");
			if(cmd==null || cmd.equals("")) {
				cmd="list";
			}
		}
		else{
			multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
				// DefaultFileRenamePolicy : 파일명이 중복될 때 어떻게 처리할지를 선택한다. 파일명을 마음대로 바꾼다
				// 그런데 get 방식으로는 MultipartRequest를 사용할 수 없음(contentType이 null로 들어오기 때문)
				// 그래서 null값에 대한 예외처리를 if문으로 해줌
				cmd = multi.getParameter("cmd");
		}

		System.out.println("******" + cmd);	
//		System.out.println("@@@@" + multi.getParameter("cmd"));
		// enctype 보내면 request가 값을 받을 수 없음
		
		if(cmd.equals("list")) {
			doList(request, response);
		}else if(cmd.equals("view")) {
			doView(request, response);
		}else if (cmd.equals("write")) {
			doWrite(request, response);
		}else if(cmd.equals("save")) {
			doSave(request, response);
		}else if(cmd.equals("save2")) {
			doSave2(request, response);
		}
	}
	
	 void doList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 GalleryDTO dto = new GalleryDTO();
		 GalleryDAO dao = new GalleryDAO();
		 
		 String pg = request.getParameter("pg");
		 if(pg==null || pg.equals("")) 
			 pg="0";	// 기본값을 0으로 부여
		 // request.getParameter는 반환값이 String이므로 int 형변환한 다음 dto로 전달
		 dto.setPg(Integer.parseInt(pg));
		 request.setAttribute("totalCnt", dao.getTotalCnt(dto));
		 request.setAttribute("list", dao.getList(dto));
		
		 RequestDispatcher rd = request.getRequestDispatcher("/gallery/gallery_list.jsp");
		 rd.forward(request, response);
	 }

	 void doWrite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 RequestDispatcher rd = request.getRequestDispatcher("/gallery/gallery_write.jsp");
		 rd.forward(request, response);
	 }
	 
	 void doSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 업로드를 처리
		 // System.out.println(request.getParameter("title"));	// null
		 String title = multi.getParameter("title");
		 String writer = multi.getParameter("writer");
		 String contents = multi.getParameter("contents");
		 
		 // tag의 name 속성
		 String filename = multi.getFilesystemName("image");
		 String originalFilename = multi.getFilesystemName("image");
		 System.out.println(filename);
		 System.out.println(originalFilename);
		 
		 GalleryDTO dto = new GalleryDTO();
		 dto.setTitle(title);
		 dto.setContents(contents);
		 dto.setWriter(writer);
		 dto.setImage(filename);		// image를 직접 넣지는 않음
		 
		 GalleryDAO dao = new GalleryDAO();
		 dao.insert(dto);
		 String url = request.getContextPath()+"/gallery.do?cmd=list";
		 response.sendRedirect(url);
	
	 }

	 protected void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 GalleryDAO dao = new GalleryDAO();
		 String seq = request.getParameter("seq");
		 request.setAttribute("dto", dao.getView(seq));
		 
		 String url = "/gallery/gallery_view.jsp";
		 RequestDispatcher rd = request.getRequestDispatcher(url);
		 rd.forward(request, response);
	 }
	
	void doSave2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("writer"));
		System.out.println(request.getParameter("contents"));
		
		//파일 업로드해야 한다 
		String title = multi.getParameter("title");
		String writer = multi.getParameter("writer");
		String contents = multi.getParameter("contents");
		
		//tag의 name 속성
		String filename = multi.getFilesystemName("image");
		String originalFilename = multi.getOriginalFileName("image");
		
		System.out.println(filename);
		System.out.println(originalFilename);
		
		GalleryDTO dto = new GalleryDTO();
		dto.setTitle(title);
		dto.setContents(contents);
		dto.setWriter(writer);
		dto.setImage(filename);
		
		GalleryDAO dao =new GalleryDAO();
		dao.insert(dto);
		
		JSONObject obj = new JSONObject();		// JSON으로 데이터를 전송해주는 전용 객체 JSONObject 생성
		obj.put("result", "success");		// 키, 값의 쌍 형태로 저장
		response.setContentType("application/x-json, characterset=utf-8"); 	// content의 타입을 지정해준다
		// JSON으로 정보를 내보낼 때는 형식이 무엇인지 지정해주는 작업이 필요하고, 한글이 깨질 수 있으므로 이것을 예방해주는 characerset 속성을 추가해 주었다
		// 기본적으로 정보에 명시된 타입이 없으면 text로 받고, <html> 태그가 있으면 html로 받는데 JSON이나 이미지, 동영상 등 지정할 수 있는 타입이 아주 많다
		response.getWriter().print(obj.toJSONString());	
	}
	
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
