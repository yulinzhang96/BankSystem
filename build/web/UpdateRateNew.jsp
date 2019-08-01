<%-- 
    Document   : UpdateRateNew
    Created on : 2018-6-7, 23:22:16
    Author     : LeonardZhang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更新利率</title>
    </head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <%
            int row = -1;
            float loanA, loanB, loanC, loanD, loanE;
            loanA = Float.parseFloat(request.getParameter("loanA"));
            loanB = Float.parseFloat(request.getParameter("loanB"));
            loanC = Float.parseFloat(request.getParameter("loanC"));
            loanD = Float.parseFloat(request.getParameter("loanD"));
            loanE = Float.parseFloat(request.getParameter("loanE"));
            Connection con;
            Statement sql;
            int rvalue = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                rvalue = sql.executeUpdate("INSERT INTO rate VALUES(null" + "," +"now()" + "," + loanA + "," + loanB + "," + loanC + "," + loanD + "," + loanE + ")");
                if (rvalue > 0) {
                    out.print("贷款利率更新成功！");
                } else {
                    out.print("贷款利率更新失败！");
                }
                con.close();
                sql.close();
            } catch (Exception e1) {
                out.print(e1);
            }
            response.setHeader("Refresh", "3;URL=UpdateRate.jsp");
        %>
    </body>
</html>
