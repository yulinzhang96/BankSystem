package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import bean.ConnDB;
import java.sql.*;
import bean.*;

public final class onecard_005fbuban_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>一卡通补办</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("  <tr> \r\n");
      out.write("   <td colspan=\"2\"><hr /> \r\n");
      out.write("   </td> \r\n");
      out.write("  </tr> \r\n");
      out.write("  <tr> \r\n");
      out.write("   <td> \r\n");
      out.write("     <br/>\r\n");
      out.write("     <tr> \r\n");
      out.write("      <input type = \"button\" value = \"返回一卡通业务办理主页\" style= \"font-size:16px;height:50px;width:200px \" onclick = \"window.location.href = 'ManageOneCard.jsp'\">      \r\n");
      out.write("     </tr>  \r\n");
      out.write("     <br/>\r\n");
      out.write("     </td> \r\n");
      out.write("  </tr> \r\n");
      out.write(" ");
      out.write("\r\n");
      out.write(" <form name=\"form2\" action=\"onecard_buban.jsp\" method=\"post\" onsubmit=\"return checkform()\">\r\n");
      out.write("\t<table align=\"center\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>身份证账号：</td>\r\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"number1\" id=\"number1\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>当前日期：</td>\r\n");
      out.write("\t\t\t<td><input type=\"text\" name=\"time\" id=\"time\"></td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td colspan=\"1\">\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"提交\"/>\r\n");
      out.write("\t\t\t\t<input type=\"reset\" value=\"重置\"/>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</form>\r\n");
      out.write("\r\n");

String number=request.getParameter("number1");
String now_time=request.getParameter("time");
if(number==null){}
else{
	ConnDB conn=new ConnDB();
	conn.first();
	Card c=conn.getStudentGrade(number);
      out.write("\r\n");
      out.write("\t");

	if (c==null) {
	
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\talert(\"查找不到该账号!\");\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");

	}
	
      out.write("\r\n");
      out.write("\t");

	if(c!=null){
	
      out.write("\r\n");
      out.write("\t");
boolean b=conn.bubanCard(number,now_time);	
	if (b==true) {
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\talert(\"补办成功!请收好您的一卡通！\");\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");
}
      out.write("\r\n");
      out.write("\t");
if (b==false) {
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\talert(\"补办失败!\");\r\n");
      out.write("\t</script>\r\n");
      out.write("\t");
}
      out.write('\r');
      out.write('\n');
}
      out.write('\r');
      out.write('\n');
}
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
