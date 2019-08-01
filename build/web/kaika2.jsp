<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡1</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>开卡!</h1>
        <table border="1" width="100%">   

            <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">
            <%
                String x1 = request.getParameter("a3");
                String x2 = request.getParameter("a4");
                String x3 = request.getParameter("a5");
                String x4 = request.getParameter("a6");
                if ((!x1.equals("")) && (!x2.equals("")) && (!x3.equals(""))) {
                    if (x1.startsWith("2")) {
                        if (x1.length() == 10) {

                            out.print("成功！");

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
                                String sql = "insert into xinyongka(kahao,xinyongedu,keyongyue,yishiyongedu,yihuankuan,mima,id) values('" + x1 + "','" + x2 + "','" + x2 + "','0','0','" + x3 + "','"+x4+"')";
                                int rs = statement.executeUpdate(sql);

                                Statement statement4 = conn.createStatement();
                                String sql4 = "insert into yujiehuankuanbiao(kahao,yujiejingzonge) values('" + x1 + "','0')";
                                int rs4 = statement4.executeUpdate(sql4);

                                Statement statement11 = conn.createStatement();
                                String sql11 = "insert into zuidihuankuanbiao(kahao) values('" + x1 + "')";
                                int rs11 = statement11.executeUpdate(sql11);

                                Statement statement1 = conn.createStatement();
                                String sql2 = "select * from xinyongka where kahao='" + x1 + "' ";
                                //  
                                ResultSet rs2 = statement1.executeQuery(sql2);

                                //  out.print("<table >");      
                                out.print("<tr>");

                                out.print("<td>" + "卡号" + "</td>");
                                out.print("<td>" + "可用额度" + "</td>");
                                out.print("<td>" + "信用额度" + "</td>");
                                out.print("<td>" + "已使用额度" + "</td>");
                                out.print("<td>" + "已还款" + "</td>");
                                    out.print("<td>"+"id"+"</td>");
                                out.print("</tr>");

                                while (rs2.next()) {
                                    out.print("<tr>");

                                    int a = rs2.getInt("kahao");
                                    int b = rs2.getInt("keyongyue");
                                    int c = rs2.getInt("xinyongedu");
                                    int d = rs2.getInt("yishiyongedu");
                                
                                        int e = rs2.getInt("yihuankuan");//    java.sql.Date f=rs2.getDate("huankuanri");
                                              String f= rs2.getString("id");
                                    out.print("<td>" + a + "</td>");
                                    out.print("<td>" + b + "</td>");
                                    out.print("<td>" + c + "</td>");
                                    out.print("<td>" + d + "</td>");
                                    out.print("<td>" + e + "</td>");
                                     out.print("<td>"+f+"</td>");
                                    out.print("</tr>");

                                    //     out.print("</table>");      
                                }

                                statement.close();
                                conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        } else {
                            out.print("不是10位数字！");
                        }

                    } else {
                        out.print("首位数字不是2！");
                    }
                } else {
                    out.print("格式错误！");
                }

            %>




            </body>
            </html>
