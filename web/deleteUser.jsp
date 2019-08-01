<%-- 
    Document   : deleteUser
    Created on : 2018-6-9, 10:42:56
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
                        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户删除</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <font face="隶书" size="6">用户删除</font>
        <hr>
        <%
            String id = request.getParameter("userName");
            Connection con;
            Statement sql;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String uri = "jdbc:mysql://localhost:3306/liuyang";
            con = DriverManager.getConnection(uri, "root", "19960822");
            sql = con.createStatement();
            rs = sql.executeQuery("select * from users where id='" + id + "'");
            if (!rs.next()) {
                out.print("用户ID不存在！请返回重新输入！");%>
        <a href="javascript:history.go(-1);">返回上一页</a>
        <%
            } else {
                int val = sql.executeUpdate("DELETE FROM users where id='" + id + "'");
                if (val > 0) {
                    out.print("用户" + id + "已经被删除！");
                } else {
                    out.print("删除失败！");
                }
            }
        %>
        <br>
        <br>
        <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);" value="返回">
    </body>
</html>
