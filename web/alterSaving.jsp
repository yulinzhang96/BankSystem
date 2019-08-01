<%-- 
    Document   : alterSaving
    Created on : 2018-6-12, 21:41:31
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>修改储蓄利率</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <font face="隶书" size="6">修改储蓄利率</font>
       <hr>
       <%
                String val=request.getParameter("val");
                Connection con;
                Statement sql;
                ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    String uri = "jdbc:mysql://localhost:3306/liuyang";
                    con = DriverManager.getConnection(uri, "root", "19960822");
                    sql = con.createStatement();
                   %>
        
        <%
                sql.executeUpdate("Update alldata SET regularrate1='"+val+"'");
                out.print("定期储蓄利率（1年）更新成功！");    
            
        %>
        <br><br>
         <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回">
    </body>
</html>
