<%-- 
    Document   : registercheck
    Created on : 2018-6-8, 8:38:51
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>创建管理员</title>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <font face="隶书" size="6">创建新用户</font>
        <hr>
        <%
            String userid = request.getParameter("userName");
            String userpa = request.getParameter("userPassword");
            String userk = "";
            if (userid.startsWith("1")) {
                userk = "saving";
            }
            if (userid.startsWith("2")) {
                userk = "credit";
            }
            if (userid.startsWith("3")) {
                userk = "loaning";
            }
            if (userid.startsWith("4")) {
                userk = "admin";
            }
            Connection con;
            Statement sql;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String uri = "jdbc:mysql://localhost:3306/liuyang";
            con = DriverManager.getConnection(uri, "root", "19960822");
            sql = con.createStatement();
            rs = sql.executeQuery("select * from users where id='" + userid + "'");
            if (rs.next()) {
                out.print("用户ID已存在！请返回重新输入！");%>
        <a href="javascript:history.go(-1);">返回上一页</a>
        <%
        } else {
            int val = sql.executeUpdate("INSERT INTO users(id,password,kind,password1,password2,password3) VALUES(" + "'" + userid + "'" + "," + "'" + userpa + "'" + "," + "'" + userk + "'" +","+"0"+","+"0"+ ","+"0"+")");
            if (val > 0 && userid.length() == 5) {
                out.print("<h2>" + userk + "用户增加成功！" + "</h2>");
        %>

        <a href="javascript:history.go(-1);">返回上一页</a>

        <%
            }

            if (val < 0) {
                out.print("增添失败！");
        %>
        <a href="javascript:history.go(-1);">返回上一页</a>
        <%
                }
            }
        %>
    </body>
</html>
