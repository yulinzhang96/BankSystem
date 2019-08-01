package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class carduser_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>信用卡首页</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>欢迎使用！请选择功能</h1>\n");
      out.write("        <table border=\"1\" width=\"100%\">\n");
      out.write("        \n");
      out.write("        <form action=\"\" method=\"post\" name=\"frmmain\" >\n");
      out.write("            <input type=\"radio\"name=\"anwser2\" value=\"1\">开卡\n");
      out.write("           <br>\n");
      out.write("             <input type=\"radio\"name=\"anwser2\" value=\"6\">调整信用额度\n");
      out.write("           <br>\n");
      out.write("           <input type=\"radio\"name=\"anwser2\" value=\"2\">刷卡消费\n");
      out.write("           <br>\n");
      out.write("            <input type=\"radio\"name=\"anwser2\" value=\"3\">预借现金\n");
      out.write("            <br>\n");
      out.write("            <input type=\"radio\"name=\"anwser2\" value=\"4\">信用还款\n");
      out.write("           <br>\n");
      out.write("           <input type=\"radio\"name=\"anwser2\" value=\"5\">网上月结单查询\n");
      out.write("           <br>\n");
      out.write("          \n");
      out.write("           <input type=\"submit\" value=\"确定\">\n");
      out.write("        </form>\n");
      out.write("       \n");
      out.write("             ");

       String gongneng=request.getParameter("anwser2");
       
       if(gongneng!=null)
    {
       if(gongneng.equals("1")){
  //  out.print("你好！");
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("kaika.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

    }
else if(gongneng.equals("2"))
{
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("xiaofei.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

}
  
else if(gongneng.equals("3"))
{
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("yujie.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

}

else if(gongneng.equals("4"))
{
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("huankuan.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

}

else if(gongneng.equals("5"))
{
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("chaxun.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

}

else if(gongneng.equals("6"))
{
  
      out.write("\n");
      out.write("  ");
      if (true) {
        _jspx_page_context.forward("xinyongedu.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("", request.getCharacterEncoding()));
        return;
      }
      out.write("\n");
      out.write("  ");

}

}
  
      out.write("\n");
      out.write("            \n");
      out.write("           \n");
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
