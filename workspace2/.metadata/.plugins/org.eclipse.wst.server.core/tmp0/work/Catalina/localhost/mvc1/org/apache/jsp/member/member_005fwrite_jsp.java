/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.70
 * Generated at: 2023-01-16 01:34:31 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.member;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import com.kosa.mvc1.guestbook.*;

public final class member_005fwrite_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/include/navbar.jsp", Long.valueOf(1673312075187L));
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>jQuery로 회원가입하기</title>\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form>\r\n");
      out.write("	<input type=\"text\" name=\"idcheck\" id=\"idcheck\" value=\"N\">\r\n");
      out.write("<!-- 메뉴 -->\r\n");
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
      out.write("<!-- 메뉴 -->\r\n");
      out.write("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark\">\r\n");
      out.write("  <div class=\"container-fluid\">\r\n");
      out.write("    <a class=\"navbar-brand\" href=\"#\">\r\n");
      out.write("      <img src=\"");
      out.print(CONTEXT );
      out.write("/images/482138.png\" alt=\"Avatar Logo\" \r\n");
      out.write("         style=\"width:40px;\" class=\"rounded-pill\"> \r\n");
      out.write("    </a>\r\n");
      out.write("    \r\n");
      out.write("    <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapsibleNavbar\">\r\n");
      out.write("      <span class=\"navbar-toggler-icon\"></span>\r\n");
      out.write("    </button>\r\n");
      out.write("    <div class=\"collapse navbar-collapse\" id=\"collapsibleNavbar\">\r\n");
      out.write("      <ul class=\"navbar-nav\">\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"#\">Link</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"#\">Link</a>\r\n");
      out.write("        </li>\r\n");
      out.write("        <li class=\"nav-item\">\r\n");
      out.write("          <a class=\"nav-link\" href=\"#\">Link</a>\r\n");
      out.write("        </li>  \r\n");
      out.write("        <li class=\"nav-item dropdown\">\r\n");
      out.write("          <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\">Dropdown</a>\r\n");
      out.write("          <ul class=\"dropdown-menu\">\r\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"#\">Link</a></li>\r\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"#\">Another link</a></li>\r\n");
      out.write("            <li><a class=\"dropdown-item\" href=\"#\">A third link</a></li>\r\n");
      out.write("          </ul>\r\n");
      out.write("        </li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</nav>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
      out.write("\r\n");
      out.write("<div class=\"container mt-3\">\r\n");
      out.write("   <table class=\"table\">\r\n");
      out.write("   	<colgroup>\r\n");
      out.write("   		<col width=\"30%\">\r\n");
      out.write("   		<col width=\"*\">\r\n");
      out.write("   	</colgroup>\r\n");
      out.write("    <tbody>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>아이디</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"text\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"아이디를 입력하세요\"\r\n");
      out.write("			    name=\"m_userid\" id=\"m_userid\">\r\n");
      out.write("			    <a href=\"#none\" onclick=\"goIDCheck()\"><span class=\"input-group-text\">아이디중복체크</span></a>\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>패스워드</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"password\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"패스워드를 입력하세요\"\r\n");
      out.write("			    name=\"m_password\" id=\"m_password\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>패스워드확인</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"password\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"패스워드를 입력하세요\"\r\n");
      out.write("			    name=\"m_password2\" id=\"m_password2\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>이름</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"text\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"이름을 입력하세요\"\r\n");
      out.write("			    name=\"m_name\" id=\"m_name\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>이메일</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"email\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"이름을 입력하세요\"\r\n");
      out.write("			    name=\"m_email\" id=\"m_email\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("      <tr>\r\n");
      out.write("        <th>전화번호</td>\r\n");
      out.write("        <td>\r\n");
      out.write("        	 <div class=\"input-group\">\r\n");
      out.write("			    <input type=\"tel\" class=\"form-control\" \r\n");
      out.write("			    placeholder=\"전화번호를 입력하세요\"\r\n");
      out.write("			    name=\"m_phone\" id=\"m_phone\">\r\n");
      out.write("			 </div>\r\n");
      out.write("        </td>\r\n");
      out.write("      </tr>\r\n");
      out.write("    </tbody>\r\n");
      out.write("  </table>\r\n");
      out.write(" </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <div class=\"container\" style=\"text-align:right\">\r\n");
      out.write("	<button type=\"button\" class=\"btn btn-primary\" onclick=\"goSave()\">등록</button>\r\n");
      out.write(" </div>\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("<script>\r\n");
      out.write("	function goIDCheck(){\r\n");
      out.write("		let m_userid = document.getElementById(\"m_userid\").value;\r\n");
      out.write("		// 체이닝기술, 객체().함수호출().함수호출()..... 이런 식으로 줄줄이 엮어가는 기법\r\n");
      out.write("		$.ajax({\r\n");
      out.write("			url:\"");
      out.print(CONTEXT);
      out.write("/member.do\",\r\n");
      out.write("			data:{cmd:\"idcheck\", m_userid:m_userid},\r\n");
      out.write("			dataType:\"JSON\",\r\n");
      out.write("			method:\"POST\"\r\n");
      out.write("		})\r\n");
      out.write("		.done((response)=>{\r\n");
      out.write("			// response를 받아서 처리\r\n");
      out.write("			// 응답이 dataType:\"JSON\"으로 보내졌다면 JSON객체를 전달받는다(자동 parsing)\r\n");
      out.write("			console.log(response);\r\n");
      out.write("		if(response.result==\"success\"){\r\n");
      out.write("			alert(\"사용 가능한 아이디입니다.\");\r\n");
      out.write("			$(\"#idcheck\").val(\"Y\");\r\n");
      out.write("			$(\"#m_userid\").prop(\"disabled\", true);\r\n");
      out.write("		}else{\r\n");
      out.write("			alert(\"이미 사용중인 아이디입니다.\");\r\n");
      out.write("		}\r\n");
      out.write("		})	// 통신에 성공했을 때 처리할 메소드 전달\r\n");
      out.write("		.fail((request, status, error)=>{\r\n");
      out.write("			console.log(request);\r\n");
      out.write("			console.log(status);\r\n");
      out.write("			console.log(error);\r\n");
      out.write("		});			// 통신에 실패했을 때 처리할 메소드 전달\r\n");
      out.write("		// ajax는기본적으로 비동기 처리를 하기 때문에 return값이 없음\r\n");
      out.write("		// 동작을 수행하고 난 뒤에 성공시 done, 실패시 fail로 전달된 함수를 실행함\r\n");
      out.write("		\r\n");
      out.write("		// controller의 doIdCheck 메서드가 JSON형식의 데이터를 보내고 있어야 여기서 받을 수 있다\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	// goSave는 POST방식으로 보내야 함\r\n");
      out.write("	function goSave(){\r\n");
      out.write("		if($(\"#idcheck\").val()==\"N\"){\r\n");
      out.write("			alert(\"아이디 중복체크를 하세요.\");\r\n");
      out.write("			$(\"#m_userid\").focus();\r\n");
      out.write("			return false;\r\n");
      out.write("		}\r\n");
      out.write("		let m_userid=$(\"#m_userid\").val();\r\n");
      out.write("		let m_password=$(\"#m_password\").val();\r\n");
      out.write("		let m_name=$(\"#m_name\").val();\r\n");
      out.write("		let m_email=$(\"#m_email\").val();\r\n");
      out.write("		let m_phone=$(\"#m_phone\").val();\r\n");
      out.write("		$.ajax({	\r\n");
      out.write("				url:\"");
      out.print(CONTEXT);
      out.write("/member.do\",\r\n");
      out.write("				data:{cmd:\"member_save\", m_userid:m_userid, m_email:m_email, m_password:m_password, m_name:m_name, m_phone:m_phone},\r\n");
      out.write("				dataType:\"JSON\",\r\n");
      out.write("				method:\"POST\"				\r\n");
      out.write("				})\r\n");
      out.write("		.done((response)=>{\r\n");
      out.write("			if(response.result==\"success\"){\r\n");
      out.write("				alert(\"회원가입 되었습니다.\");\r\n");
      out.write("				location.href=\"");
      out.print(CONTEXT);
      out.write("/index.jsp\";\r\n");
      out.write("			}else{\r\n");
      out.write("			alert(\"회원가입에 실패하였습니다.\");\r\n");
      out.write("			}\r\n");
      out.write("		})\r\n");
      out.write("		.fail((response, status, error)=>{\r\n");
      out.write("			console.log(status);\r\n");
      out.write("		});\r\n");
      out.write("	}\r\n");
      out.write("\r\n");
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
