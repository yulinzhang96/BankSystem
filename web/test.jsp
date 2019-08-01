<%-- 
    Document   : test
    Created on : 2018-6-3, 18:40:15
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
       <body style="background:url(Image/qinglake.jpg);background-size:cover;">
               <%
                Connection con;
                Statement sql;
                ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    String uri = "jdbc:mysql://localhost:3306/liuyang";
                    con = DriverManager.getConnection(uri, "root", "19960822");
                    sql = con.createStatement();
                    rs = sql.executeQuery("SELECT * FROM users");
                   
                    if(!rs.next()){
                        out.print("No user found!");
                    }
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(1) + "</td>");
                        out.print("<td>" + rs.getString(2) + "</td>");
                        out.print("</tr>");
                  
                    out.print("</table>");
                    con.close();   
            %>
       
    </body>
</html>
