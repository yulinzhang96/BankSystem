

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.lang.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>信用卡5</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>最低还款</h1>


        <table border="1" width="100%">




            <%String kaka = (String) session.getAttribute("kahao1");%>
            <%
                 session.setAttribute("kaka1", kaka);
                Double b, c;
                out.print(kaka);
                String driverName = "com.mysql.jdbc.Driver";
                try {
                    Class.forName(driverName);
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }

                String url = "jdbc:mysql://127.0.0.1:3306/liuyang?user=root&password=19960822&characterEncoding=utf-8";

                try {

                    Connection conn = DriverManager.getConnection(url);

                    Statement statement1 = conn.createStatement();
                    String sql1 = "select * from xinyongka where kahao='" + kaka + "'";
                    ResultSet rs = statement1.executeQuery(sql1);
                    while (rs.next()) {
                        b = rs.getDouble("keyongyue");
                        c = rs.getDouble("xinyongedu");//c-b为剩余应还
                  
                        
                        
                        Statement statement2 = conn.createStatement();
                        String sql2 = "select * from zuidihuankuanbiao where kahao='"+kaka+"'";
                        ResultSet rs2 = statement2.executeQuery(sql2);
                        while (rs2.next()) {
                            Double a2 = rs2.getDouble("zhi");

                            Statement statement3 = conn.createStatement();
                            String sql3 = "select sum(shouxufei) from yujiexianjin where kahao='" + kaka + "';";
                            ResultSet rs3 = statement3.executeQuery(sql3);
                            while (rs3.next()) {

                                Double a3 = rs3.getDouble("sum(shouxufei)");

//预借手续费总和
                                Statement statement4 = conn.createStatement();
                                String sql4 = "select * from zuidihuankuanbiao where kahao='"+kaka+"'";
                                ResultSet rs4 = statement4.executeQuery(sql4);
                                while (rs4.next()) {
                                    Double a4 = rs4.getDouble("zhi2");            //前期最低还款额未还清部分

                                    out.print("最低还款额为：");
                                    out.print((c - b) * 0.1 + a2 + a3 + (c - b) * 0.0005 * 30 + a4 * 0.05);
                                    double xx=(c - b) * 0.1 + a2 + a3 + (c - b) * 0.0005 * 30 + a4 * 0.05;
                                    out.print("<br>");

                                    Statement statement5 = conn.createStatement();
                                    String sql5 = "update zuidihuankuanbiao set zuidihuankuane='"+xx+"' where kahao='"+kaka+"' ";
                                    int a5 = statement5.executeUpdate(sql5);
                                
                            
                        
                    
                    

                                }
                            }
                        }    //前期最低还款额未还清部分

                    }

                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

            %>
            <form action="zuidihuankuan2.jsp"method="post"name="frmmain">

                请输入还款的额度：    
                <input type="text" name="a4"/>
                <br>

                <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
            </form>   
    </body>
</html>