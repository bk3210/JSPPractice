/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-18 05:52:19 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.guestbook;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.kosa.mvc1.guestbook.*;

public final class guestbook_005fwrite_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/include/navbar.jsp", Long.valueOf(1674012833327L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("com.kosa.mvc1.guestbook");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

//forward  로 페이지 이동이 되면 이전 페이지에서 받았던 파라미터도 가져온다 
String cmd=request.getParameter("cmd");
String seq=request.getParameter("seq");
GuestbookDTO DTO = (GuestbookDTO)request.getAttribute("DTO");
if(DTO==null) //cmd=list -> cmd=write 로 온경우에는  DTO 가 없다.
{
	DTO=new GuestbookDTO(); //비어있는 개체를 하나 만든다. 
}


      out.write("\r\n");
      out.write("<form name=\"myform\" method=\"post\">\r\n");
      out.write("	<input type=\"hidden\" name=\"cmd\">\r\n");
      out.write("	<input type=\"hidden\" name=\"seq\" value=\"");
      out.print(seq);
      out.write("\">\r\n");
      out.write("	\r\n");
      out.write("<!-- 메뉴 -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");

// 공통변수 선언
String CONTEXT = request.getContextPath();

      out.write("\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<!-- 메뉴 -->\r\n");
      out.write("	<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark\">\r\n");
      out.write("		<div class=\"container-fluid\">\r\n");
      out.write("		<a href=\"");
      out.print(CONTEXT);
      out.write("/index.jsp\">\r\n");
      out.write("		<img\r\n");
      out.write("				src=\"");
      out.print(CONTEXT);
      out.write("/images/ddd.png\" alt=\"Avatar Logo\"\r\n");
      out.write("				style=\"width: 40px;\" class=\"rounded-pill\">\r\n");
      out.write("			</a>\r\n");
      out.write("\r\n");
      out.write("			<button class=\"navbar-toggler\" type=\"button\"\r\n");
      out.write("				data-bs-toggle=\"collapse\" data-bs-target=\"#collapsibleNavbar\">\r\n");
      out.write("				<span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("			</button>\r\n");
      out.write("			<div class=\"collapse navbar-collapse\" id=\"collapsibleNavbar\">\r\n");
      out.write("				<ul class=\"navbar-nav\">\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print(CONTEXT);
      out.write("/guestbook.do?cmd=list&pg=0\">방명록</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"");
      out.print(CONTEXT);
      out.write("/gallery.do?cmd=list&pg=0\">갤러리</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">Link</a></li>\r\n");
      out.write("					<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">Link</a></li>\r\n");
      out.write("					<li class=\"nav-item dropdown\"><a\r\n");
      out.write("						class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\"\r\n");
      out.write("						data-bs-toggle=\"dropdown\">Dropdown</a>\r\n");
      out.write("						<ul class=\"dropdown-menu\">\r\n");
      out.write("							<li><a class=\"dropdown-item\" href=\"#\">Link</a></li>\r\n");
      out.write("							<li><a class=\"dropdown-item\" href=\"#\">Another link</a></li>\r\n");
      out.write("							<li><a class=\"dropdown-item\" href=\"#\">A third link</a></li>\r\n");
      out.write("						</ul></li>\r\n");
      out.write("				</ul>\r\n");
      out.write("			</div>\r\n");
      out.write("			");

			if (session.getAttribute("m_userid") == null || session.getAttribute("m_userid").equals("")) {
			
      out.write("\r\n");
      out.write("			<ul class=\"navbar-nav justifu-content-end\">\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\"\r\n");
      out.write("					href=\"");
      out.print(CONTEXT);
      out.write("/member.do?cmd=member_login\">로그인</a></li>\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\"\r\n");
      out.write("					href=\"");
      out.print(CONTEXT);
      out.write("/member.do?cmd=member_write\">회원가입</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

			} else {
			
      out.write("\r\n");
      out.write("			<ul class=\"navbar-nav justifu-content-end\">\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"#none\">");
      out.print(session.getAttribute("m_name"));
      out.write("</a></li>\r\n");
      out.write("				<li class=\"nav-item\"><a class=\"nav-link\" href=\"#none\"\r\n");
      out.write("					onclick=\"goLogout()\">로그아웃</a></li>\r\n");
      out.write("			</ul>\r\n");
      out.write("			");

			}
			
      out.write("\r\n");
      out.write("		</div>\r\n");
      out.write("	</nav>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("	function goLogout() {\r\n");
      out.write("		let xhttp = new XMLHttpRequest();\r\n");
      out.write("		let url = \"/mvc1/member.do?cmd=member_logout\";\r\n");
      out.write("\r\n");
      out.write("		xhttp.onload = function() {\r\n");
      out.write("			console.log(this.responseText);\r\n");
      out.write("			let data = JSON.parse(this.responseText);\r\n");
      out.write("			alert(\"로그아웃되었습니다.\");\r\n");
      out.write("			location.href = \"/mvc1/index.jsp\";\r\n");
      out.write("		}\r\n");
      out.write("\r\n");
      out.write("		xhttp.open(\"GET\", url, true);\r\n");
      out.write("		xhttp.send();\r\n");
      out.write("	}\r\n");
      out.write("</script>");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"container mt-3\">\r\n");
      out.write("  <h3>게시판</h3>\r\n");
      out.write("  <p></p>\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("   <table class=\"table\">\r\n");
      out.write("   	<colgroup>\r\n");
      out.write("   		<col width=\"30%\">\r\n");
      out.write("   		<col width=\"*\">\r\n");
      out.write("   	</colgroup>\r\n");
      out.write("    <tbody>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>제목</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("        	\r\n");
      out.write("			    <input type=\"text\" class=\"form-control\" placeholder=\"제목을 입력하세요\"\r\n");
      out.write("			    name=\"title\" id=\"title\" value=\"");
      out.print(DTO.getTitle());
      out.write("\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>작성자</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("        	 	<input type=\"hidden\" name=\"writer\" id=\"writer\"\r\n");
      out.write("        	 	 value=\"");
      out.print(session.getAttribute("m_userid"));
      out.write("\"\r\n");
      out.write("        	 	>\r\n");
      out.write("			    <input type=\"text\" class=\"form-control\" placeholder=\"이름을 입력하세요\"\r\n");
      out.write("			    name=\"m_name\" id=\"m_name\" readonly \r\n");
      out.write("			    value=\"");
      out.print(session.getAttribute("m_name"));
      out.write("\" >\r\n");
      out.write("			    \r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>내용</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <textarea class=\"form-control\" placeholder=\"내용을 입력하세요\"\r\n");
      out.write("			    name=\"contents\" id=\"contents\" rows=\"5\">");
      out.print(DTO.getContents());
      out.write("</textarea>\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      \r\n");
      out.write("      \r\n");
      out.write("    </tbody>\r\n");
      out.write("  </table>\r\n");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <div class=\"container\" style=\"text-align:right\">\r\n");
      out.write("	<button type=\"button\" class=\"btn btn-primary\"\r\n");
      out.write("	id=\"btnSave\">저장</button>\r\n");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write(" </form>\r\n");
      out.write("  \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("window.onload=()=>{\r\n");
      out.write("	let btnSave = document.getElementById(\"btnSave\");\r\n");
      out.write("	btnSave.addEventListener(\"click\", ()=>{\r\n");
      out.write("		var frm = document.myform;\r\n");
      out.write("		frm.action=\"");
      out.print(CONTEXT);
      out.write("/guestbook.do\";\r\n");
      out.write("		");
if(cmd.equals("write")){
      out.write("\r\n");
      out.write("		frm.cmd.value=\"save\";\r\n");
      out.write("		");
}else{
      out.write("\r\n");
      out.write("		frm.cmd.value=\"update\";\r\n");
      out.write("		");
}
      out.write("\r\n");
      out.write("		frm.submit();\r\n");
      out.write("	})\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
