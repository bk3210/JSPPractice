/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-19 08:46:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.kosa.mvc1.index.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("com.kosa.mvc1.index");
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
      out.write("    \r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\r\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script>\r\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\r\n");
      out.write("  \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");

List<IndexDTO> list1 = (List<IndexDTO>)request.getAttribute("list1");

      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("  <div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">\r\n");
      out.write("    <!-- Indicators -->\r\n");
      out.write("    <ol class=\"carousel-indicators\">\r\n");
      out.write("					");
for (int i = 0; i < list1.size(); i++) { 
      out.write("\r\n");
      out.write("					<li data-target=\"#myCarousel\" data-slide-to=\"");
      out.print(i);
      out.write("\"\r\n");
      out.write("					");
if(i==0){ 
      out.write(" class=\"active\"");
} 
      out.write("></li>\r\n");
      out.write("					");
} 
      out.write("\r\n");
      out.write("    </ol>\r\n");
      out.write("\r\n");
      out.write("    <!-- Wrapper for slides -->\r\n");
      out.write("    <div class=\"carousel-inner\">\r\n");
      out.write("    ");
for(int i=0; i<list1.size(); i++){
    	String activeClass="";
    	IndexDTO dto = list1.get(i);
    	if(i==0)
    		activeClass="item active";
    	else
    		activeClass="item";
    	
		String url=request.getContextPath()+"/upload/gallery/"+dto.getImage();
		String link = request.getContextPath()+"/gallery.do?cmd=view&seq="+dto.getSeq();
    	
    	
      out.write("\r\n");
      out.write("      <div class=\"");
      out.print(activeClass);
      out.write("\">\r\n");
      out.write("      <a href=\"");
      out.print(link );
      out.write("\">\r\n");
      out.write("      <img src=\"");
      out.print(url );
      out.write("\" alt=\"image\" style=\"width:100%;\">\r\n");
      out.write("      </a>\r\n");
      out.write("      </div>\r\n");
      out.write("      ");
} 
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write(" <!-- Left and right controls -->\r\n");
      out.write("    <a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">\r\n");
      out.write("      <span class=\"glyphicon glyphicon-chevron-left\"></span>\r\n");
      out.write("      <span class=\"sr-only\">Previous</span>\r\n");
      out.write("    </a>\r\n");
      out.write("    <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">\r\n");
      out.write("      <span class=\"glyphicon glyphicon-chevron-right\"></span>\r\n");
      out.write("      <span class=\"sr-only\">Next</span>\r\n");
      out.write("    </a>\r\n");
      out.write("  </div>\r\n");
      out.write("\r\n");
      out.write("	    ");

	    List<IndexDTO2> list2 = (List<IndexDTO2>)request.getAttribute("list2");
	    
	    for(int i=0; i<list2.size(); i++){ 
	    
			IndexDTO2 dto2 = list2.get(i);
			System.out.println(dto2.getTitle());
			
      out.write("\r\n");
      out.write("			");
if(i%3==0){ 
      out.write("\r\n");
      out.write("		  <div class=\"row\">				\r\n");
      out.write("			");
}
      out.write("\r\n");
      out.write("			 \r\n");
      out.write("		    <div class=\"col-sm-4\">\r\n");
      out.write("		    	<h3>");
      out.print(dto2.getTitle() );
      out.write("</h3>\r\n");
      out.write("				<p>");
      out.print(dto2.getM_name() );
      out.write("</p>\r\n");
      out.write("	       </div>\r\n");
      out.write("	");
if (i%3==2 || i==list2.size()-1){
      out.write("\r\n");
      out.write("	</div>\r\n");
      out.write("			");
} // if문
      out.write("\r\n");
      out.write("	    ");
} // for문
      out.write("\r\n");
      out.write("  \r\n");
      out.write("  </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("$(()=>{\r\n");
      out.write("	$(\"#btnHome\").click(()=>{\r\n");
      out.write("		location.href=\"");
      out.print(request.getContextPath());
      out.write("/gallery.do\";\r\n");
      out.write("	});\r\n");
      out.write("})\r\n");
      out.write("\r\n");
      out.write("	/* function goLogout(){\r\n");
      out.write("		let xhttp = new XMLHttpRequest();\r\n");
      out.write("		let url = \"/mvc1/member.do?cmd=member_logout\";\r\n");
      out.write("		xhttp.onload=function(){\r\n");
      out.write("			console.log(this.responseText);\r\n");
      out.write("			let data=JSON.parse(this.responseText);\r\n");
      out.write("			alert(\"로그아웃되었습니다.\");\r\n");
      out.write("			location.href=\"/mvc1/index.jsp\";\r\n");
      out.write("		}\r\n");
      out.write("		S\r\n");
      out.write("		xhttp.open(\"GET\", url, true);\r\n");
      out.write("		xhttp.send();\r\n");
      out.write("	} */\r\n");
      out.write("</script>");
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
