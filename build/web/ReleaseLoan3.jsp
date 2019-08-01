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
        <title>发放自助贷款</title>
    </head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
                <b>
            <font face="隶书" size="6">发放自助贷款</font>
        </b>
        <hr>
        <%
            Connection con;
            Statement sql, sql2, sql3, sql4;
            ResultSet rs, rs2, rs3, rs4;
            Boolean flag = true;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                sql2 = con.createStatement();
                sql3 = con.createStatement();
                sql4 = con.createStatement();
                rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=4");
                if (!rs.next()) {
                    out.print("暂无可发放贷款！");
                    flag = false;
                }
                if (flag) {
                    rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=4");
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th width=100>" + "一卡通账号");
                    out.print("<th width=100>" + "贷款编号");
                    out.print("<th width=100>" + "类型");
                    out.print("<th width=120>" + "申请日期");
                    out.print("<th width=160>" + "贷款金额(元RMB)");
                    out.print("</tr>");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(1) + "</td>");
                        out.print("<td>" + rs.getInt(12) + "</td>");
                        out.print("<td>" + "个人自助贷款" + "</td>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("<td>" + rs.getFloat(8) + "</td>");
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
        <form action="ReleaseLoan3next.jsp">
            <input type="submit" name="next" value="一键发放贷款" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
        <br>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
