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
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>发放住房贷款</title>
    </head>
       <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <%
            Connection con;
            Statement sql;
            int rvalue = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                rvalue = sql.executeUpdate("UPDATE loaninfo SET verified=3 WHERE verified=5");
                if (rvalue > 0) {
                    out.print("贷款发放成功！");
                }
                con.close();
            } catch (SQLException e1) {
                out.print(e1);
            }
        %>
        <br>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
