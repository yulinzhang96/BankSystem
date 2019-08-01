package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import bean.ConnDB;
import java.sql.*;

public final class Save_005fIndex_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("        <title>储蓄业务办理主页</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("    <tr> \r\n");
      out.write("        <td colspan=\"2\"><hr /> \r\n");
      out.write("        </td> \r\n");
      out.write("    </tr> \r\n");
      out.write("    <tr> \r\n");
      out.write("        <td> \r\n");
      out.write("            <br/>\r\n");
      out.write("    <tr> \r\n");
      out.write("    <input type = \"button\" value = \"存款业务办理\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'ManageSavings.jsp'\">      \r\n");
      out.write("</tr> \r\n");
      out.write("<br/>\r\n");
      out.write("<tr> \r\n");
      out.write("<input type = \"button\" value = \"取款业务办理\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'get_money.jsp'\">      \r\n");
      out.write("</tr> \r\n");
      out.write("<br/>\r\n");
      out.write("<tr> \r\n");
      out.write("<input type = \"button\" value = \"利息计算\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'ManageInterest.jsp'\">      \r\n");
      out.write("</tr> \r\n");
      out.write("<br/>\r\n");
      out.write("<tr> \r\n");
      out.write("<input type = \"button\" value = \"一卡通业务办理\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'ManageOneCard.jsp'\">      \r\n");
      out.write("</tr> \r\n");
      out.write("<br/>\r\n");
      out.write("<tr> \r\n");
      out.write("<input type = \"button\" value = \"退出登录\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'index.jsp'\">      \r\n");
      out.write("</tr> \r\n");
      out.write("<br/>\r\n");
      out.write("</td> \r\n");
      out.write("</tr> \r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
