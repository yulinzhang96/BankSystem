package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class kaika_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

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
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write(" <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("\"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>信用卡1</title>       \n");
      out.write("    </head>\n");
      out.write("    <body style=\"background:url(Image/qinglake.jpg);background-size:cover;\">\n");
      out.write("        <h1>开卡</h1>\n");
      out.write("         <input type=\"button\" name=\"submit\" onclick=\"javascript:history.back(-1);\"value=\"返回上一页\" style= \"background-color: transparent;font-size:16px;height:50px;width:200px \">   \n");
      out.write("   <form action=\"kaika2.jsp\"method=\"post\"name=\"frmmain\">\n");
      out.write("       请输入新信用卡卡号：\n");
      out.write("       <input type=\"text\" name=\"a3\"/>\n");
      out.write("       <br>\n");
      out.write("         请输入id：\n");
      out.write("       <input type=\"text\" name=\"a6\"/>\n");
      out.write("       <br>\n");
      out.write("        请输入信用卡的密码：   \n");
      out.write("       <input type=\"password\" name=\"a5\"/>\n");
      out.write("       <br>\n");
      out.write("       请输入当前信用额度：    \n");
      out.write("          <input type=\"text\" name=\"a4\"/>\n");
      out.write("          <br>\n");
      out.write("       <input type=\"submit\" value=\"确定\" style= \"background-color: transparent;font-size:16px;height:50px;width:200px \"/>\n");
      out.write("       </form>\n");
      out.write("   \n");
      out.write(" \n");
      out.write("\n");
      out.write("<hr>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
