<%-- 
    Document   : alterUser
    Created on : 2018-6-9, 11:10:11
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
    <head>
                <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改用户信息/title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <font face="隶书" size="6">修改用户信息</font>
        <hr>
        <%
            String id = request.getParameter("userName");
            String userpass = request.getParameter("userapass");
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
                int a = sql.executeUpdate("Update users SET password1=password2,password2=password3,password3=password,password='" + userpass + "' WHERE id='" + id + "' and '" + userpass + "'!=password1 and '" + userpass + "'!=password2 and '" + userpass + "'!=password3 ");

                if (a > 0) {
                    response.setHeader("refresh", "0;URL=altersuccessfully.jsp");

                }
                if (a < 0) {
                    response.setHeader("refresh", "0;URL=alterfailed.jsp");
                }
            }
        %>
    </body>
</html>
