<%-- 
    Document   : TakeLoan
    Created on : 2018-6-6, 8:26:40
    Author     : LeonardZhang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>贷款利率</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <b>
            <font face="隶书" size="6">贷款利率历史纪录</font>
        </b>
        <hr>
        <%
            Connection con;
            Statement sql;
            ResultSet rs;
            Boolean flag = true;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                rs = sql.executeQuery("SELECT * FROM rate");
                if (!rs.next()) {
                    out.print("暂无利率信息！");
                    flag = false;
                }
                if (flag) {
                    rs = sql.executeQuery("SELECT * FROM rate");
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th width=150>" + "更新日期(年-月-日)");
                    out.print("<th width=150>" + "短期贷款(A)利率(%)");
                    out.print("<th width=150>" + "短期贷款(B)利率(%)");
                    out.print("<th width=150>" + "长期贷款(C)利率(%)");
                    out.print("<th width=150>" + "长期贷款(D)利率(%)");
                    out.print("<th width=150>" + "长期贷款(E)利率(%)");
                    out.print("</tr>");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getString(3) + "</td>");
                        out.print("<td>" + rs.getString(4) + "</td>");
                        out.print("<td>" + rs.getString(5) + "</td>");
                        out.print("<td>" + rs.getString(6) + "</td>");
                        out.print("<td>" + rs.getString(7) + "</td>");
                        out.print("</tr>");
                    }
                }
                out.print("</table>");
                con.close();
            } catch (SQLException e1) {
                out.print(e1);
            }
        %>
        <br>
    </center>
</body>
</html>
