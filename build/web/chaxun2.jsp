<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡6</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>查询2</h1>


        <input type="button" name="submit" onclick="javascript:history.back(-1);"value="返回上一页" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">
        <%
            String x1 = request.getParameter("a3");
            // String x2=request.getParameter("a4");

            if ((!x1.equals(""))) {
                if (x1.startsWith("2")) {
                    if (x1.length() == 10) {

                        String driverName = "com.mysql.jdbc.Driver";
                        try {
                            Class.forName(driverName);
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }

                        String url = "jdbc:mysql://127.0.0.1:3306/liuyang?user=root&password=19960822&characterEncoding=utf-8";

                        try {
                            Connection conn = DriverManager.getConnection(url);

                            Statement statement = conn.createStatement();
                            Statement statement1 = conn.createStatement();
                            Statement statement2 = conn.createStatement();
                            String sql2 = "select * from xinyongka where kahao='" + x1 + "' ";
                            ResultSet rs2 = statement1.executeQuery(sql2);
                            if (rs2.next()) {

                                String sql1 = "select * from xinyongka where kahao='" + x1 + "' ";
                                ResultSet rs = statement1.executeQuery(sql1);
                                out.println("<br>" + "信用卡情况：");
        %>
        <table border="1" width="100%">
            <%
                // out.println("<table border="1" width="100%">");
                out.print("<tr>");
                out.print("<td>" + "卡号" + "</td>");
                out.print("<td>" + "可用余额" + "</td>");
                out.print("<td>" + "信用额度" + "</td>");
                out.print("<td>" + "已使用额度" + "</td>");
                out.print("<td>" + "已还款" + "</td>");
                out.print("</tr>");
                while (rs.next()) {
                    out.print("<tr>");
                    int a = rs.getInt("kahao");
                    int b = rs.getInt("keyongyue");
                    int c = rs.getInt("xinyongedu");
                    int d = rs.getInt("yishiyongedu");
                    int e = rs.getInt("yihuankuan");
                    out.print("<td>" + a + "</td>");
                    out.print("<td>" + b + "</td>");
                    out.print("<td>" + c + "</td>");
                    out.print("<td>" + d + "</td>");
                    out.print("<td>" + e + "</td>");
                    out.print("</tr>");
                }

                //   out.println("<br>"+"消费情况：");  
                out.println("</table>");
            %>
            <title>消费情况</title>
            <%
                String sql3 = "select * from xiaofeibiao where kahao='" + x1 + "' ";
                ResultSet rs3 = statement1.executeQuery(sql3);

                out.println("<br>" + "消费情况：");
                //out.println("<table>");  
            %>
            <table border="1" width="100%">
                <%
                    out.print("<tr>");
                    out.print("<td>" + "卡号" + "</td>");
                    out.print("<td>" + "消费额度" + "</td>");
                    out.print("<td>" + "消费日期" + "</td>");
                    out.print("</tr>");
                    while (rs3.next()) {
                        out.print("<tr>");
                        int a = rs3.getInt("kahao");
                        int c = rs3.getInt("xiaofeiedu");
                        java.sql.Date d = rs3.getDate("xiaofeiriqi");
                        out.print("<td>" + a + "</td>");
                        out.print("<td>" + c + "</td>");
                        out.print("<td>" + d + "</td>");

                        out.print("</tr>");
                    }
                    out.println("</table>");

                    //       out.println("<br>"+"预借现金情况：");  
                %>
                <title>预借情况</title>
                <%     String sql4 = "select * from yujiexianjin where kahao='" + x1 + "' ";
                    ResultSet rs4 = statement1.executeQuery(sql4);
                    out.println("<br>" + "预借情况：");
                    //out.println("<table>");  
                %>
                <table border="1" width="100%">
                    <%
                                            out.print("<tr>");
                                            out.print("<td>" + "卡号" + "</td>");
                                            out.print("<td>" + "预借额度" + "</td>");
                                            out.print("<td>" + "预借日期" + "</td>");
                                            out.print("<td>" + "预借手续" + "</td>");
                                            out.print("</tr>");
                                            while (rs4.next()) {
                                                out.print("<tr>");
                                                int a = rs4.getInt("kahao");
                                                int c = rs4.getInt("yujie");

                                                java.sql.Date d = rs4.getDate("yujieriqi");
                                                Double f = rs4.getDouble("shouxufei");
                                                out.print("<td>" + a + "</td>");
                                                out.print("<td>" + c + "</td>");
                                                out.print("<td>" + d + "</td>");
                                                out.print("<td>" + f + "</td>");
                                                out.print("</tr>");
                                            }
                                                
                                            %>
                <title>还款情况</title>
                <%     String sql5 = "select * from huankuanbiao where kahao='" + x1 + "' ";
                    ResultSet rs5 = statement2.executeQuery(sql5);
                  
                    //out.println("<table>");  
                %>
                <table border="1" width="100%">
                    <%
                         out.println("<br>"+"还款情况：");
                                            out.print("<tr>");
                                            out.print("<td>" + "卡号" + "</td>");
                                            out.print("<td>" + "还款额度" + "</td>");
                                            out.print("<td>" + "还款日期" + "</td>");
                                         
                                            out.print("</tr>");
                                            while (rs5.next()) {
                                                out.print("<tr>");
                                                int a2 = rs5.getInt("kahao");
                                                Double c2 = rs5.getDouble("huankuanedu");

                                                java.sql.Date d2= rs5.getDate("huankuanriqi");
                                                
                                                out.print("<td>" + a2 + "</td>");
                                                out.print("<td>" + c2 + "</td>");
                                                out.print("<td>" + d2 + "</td>");
                                             
                                                out.print("</tr>");
    
                                                
                                                
                                            }
                                            out.println("</table>");

                                        } else {
                                            out.print("该银行卡不存在");
                                        }

                                        statement.close();
                                        statement1.close();
                                        conn.close();
                                    } catch (SQLException e) {
                                        e.printStackTrace();
                                    }
                                } else
                                    out.print("不是10位数字！");

                            } else
                                out.print("首位数字不是2！");
                        } else {
                            out.print("格式错误！");
                        }

                    %>




                    </body>
                    </html>
