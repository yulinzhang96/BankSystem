package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class adminfunc_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>管理员功能区</title>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function Check() {\n");
      out.write("                if (document.rcheck.userName.value === \"\") {\n");
      out.write("                    alert(\"用户名不能为空！\");\n");
      out.write("                    document.rcheck.userName.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if (document.rcheck.userPassword.value === \"\") {\n");
      out.write("                    alert(\"用户密码不能为空！\");\n");
      out.write("                    document.rcheck.userPassword.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if (document.rcheck.userName.value.length < 5 || document.rcheck.userName.value.length > 5) {\n");
      out.write("                    alert(\"ID为5位！\");\n");
      out.write("                    document.rcheck.userName.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if (document.rcheck.userPassword.value.length < 8 || document.rcheck.userPassword.value.length > 16) {\n");
      out.write("                    alert(\"用户密码为8-16位！\");\n");
      out.write("                    document.rcheck.userName.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if (document.rcheck.userName.value.length === 5) {\n");
      out.write("                    var id = document.rcheck.userName.value.toString();\n");
      out.write("                    var passw = document.rcheck.userPassword.value.toString();\n");
      out.write("                    // alert(\"提示：请增加管理员信息！\\n1.管理员ID首位为工号（1-5）\\n2.密码（8-16位）\\n3.密码不能包含用户ID\\n4.管理员ID为5位\");\n");
      out.write("                    if (document.rcheck.userName.value[0] < '1' || document.rcheck.userName.value[0] > '5')\n");
      out.write("                    {\n");
      out.write("                        alert(\"首位为工号(1-5)，请重新输入！\");\n");
      out.write("                        document.rcheck.userName.focus();\n");
      out.write("                        return false;\n");
      out.write("                    }\n");
      out.write("                    if (passw.indexOf(id) > -1) {\n");
      out.write("                        alert(\"密码不能包含用户ID,请重新输入！\");\n");
      out.write("                        document.rcheck.userName.focus();\n");
      out.write("                        return false;\n");
      out.write("                    }\n");
      out.write("                    return true;\n");
      out.write("                }\n");
      out.write("                return true;\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("<body style=\"background:url(Image/qinglake.jpg);background-size:cover;\">\n");
      out.write("    <center>\n");
      out.write("        <font face=\"隶书\" size=\"6\">欢迎进入管理员功能区</font>\n");
      out.write("        <hr>\n");
      out.write("        ");

            String myfunc = request.getParameter("func");

            if (myfunc.equals("1")) {
        
      out.write("\n");
      out.write("        <form  action = \"registercheck.jsp\" method = \"post\" name =\"rcheck\" onsubmit=\"return Check()\">\n");
      out.write("            <table>\n");
      out.write("                <tr><td><b>待增加用户ID：</b></td><td><input type=\"int\" style=\"width:180px\" name=\"userName\"></td></tr>\n");
      out.write("                <tr><td><b>待增加用户密码：</b></td><td><input type=\"password\" style=\"width:180px\" name=\"userPassword\"></td></tr>\n");
      out.write("                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"submit\" value=\"确定\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\"></td>\n");
      out.write("                    <td>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"reset\" value=\"重置\" name=\"reset\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\"></td>\n");
      out.write("                    <td>&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"button\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\" onclick=\"javascript:history.back(-1);\"value=\"Back\"></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        ");
}
      out.write("\n");
      out.write("        ");

            if (myfunc.equals("2")) {
      out.write("\n");
      out.write("        <form  action = \"deleteUser.jsp\" method = \"post\" name =\"rcheck\">\n");
      out.write("            <table>\n");
      out.write("                <tr><td><b>待删除用户ID：</b></td><td><input type=\"int\" style=\"width:180px\" name=\"userName\"></td></tr>\n");
      out.write("                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>\n");
      out.write("                <tr>\n");
      out.write("                    <input type=\"submit\" value=\"确定\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\">\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"reset\" value=\"重置\" name=\"reset\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\">\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"button\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\" onclick=\"javascript:history.back(-1);\"value=\"返回\">\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        ");
 }
        
      out.write("\n");
      out.write("        ");

            if (myfunc.equals("3")) {
      out.write("\n");
      out.write("        <form  action = \"alterUser.jsp\" method = \"post\" name =\"rcheck\">\n");
      out.write("            <table>\n");
      out.write("                <tr><td><b>待更改用户ID：</b></td><td><input type=\"int\" style=\"width:180px\" name=\"userName\"></td></tr>\n");
      out.write("                <tr><td><b>更改用户密码为：</b></td><td><input type=\"int\" style=\"width:180px\" name=\"userapass\"></td></tr>\n");
      out.write("                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>\n");
      out.write("                <tr>\n");
      out.write("                    <input type=\"submit\" value=\"确定\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\">\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"reset\" value=\"重置\" name=\"reset\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\">\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"button\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\" onclick=\"javascript:history.back(-1);\"value=\"返回\">\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        ");
 }
        
      out.write("\n");
      out.write("        ");

            if (myfunc.equals("4")) {
      out.write("\n");
      out.write("        <form  action = \"visitDatabase.jsp\" method = \"post\" name =\"rcheck\">\n");
      out.write("            <table>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"visit\" checked><b>查看核心数据</b>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"alrate1\" ><b>修改定期储蓄利率（1年）</b>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"alrate5\" checked><b>修改定期储蓄利率（5年）</b>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"alcrate\" checked><b>修改活期储蓄利率</b>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"alloaning\" checked><b>修改贷款利率：</b>\n");
      out.write("                <input type=\"radio\"name=\"act\"value=\"credit\" checked><b>修改信用卡利息：</b>\n");
      out.write("\n");
      out.write("                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>\n");
      out.write("                <tr>\n");
      out.write("                    <input type=\"submit\" value=\"确定\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\">\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"reset\" value=\"重置\" name=\"reset\" >\n");
      out.write("                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                        <input type=\"button\" name=\"submit\" style=\"background-color: transparent;width: 100px;height: 50px;color: black\" onclick=\"javascript:history.back(-1);\"value=\"返回\">\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        ");
 }
        
      out.write("\n");
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
