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
        <title>发放助学贷款</title>
    </head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <%
            Connection con;
            Statement sql, sql2, sql3, sql4, sql5, sql6;
            ResultSet rs, rs2;
            int rvalue = 0, rvalue2 = 0, rvalue3 = 0;
            int loanID = 0;
            float nextmoney = 0;
            int leftyear = 0;
            Boolean flag = true;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                sql2 = con.createStatement();
                sql3 = con.createStatement();
                sql4 = con.createStatement();
                sql5 = con.createStatement();
                sql6 = con.createStatement();
                rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=2");
                while (rs.next()) {
                    loanID = Integer.parseInt(rs.getString(12));
                    rs2 = sql2.executeQuery("SELECT * FROM studymoney WHERE loanID=" + loanID);
                    while (rs2.next()) {
                        leftyear = Integer.parseInt(rs2.getString(5)) - 1;
                        if (leftyear == 0) {
                            nextmoney = 0;
                            rvalue = sql3.executeUpdate("UPDATE loaninfo SET verified=3 WHERE loanID=" + loanID);
                        }
                        rvalue2 = sql5.executeUpdate("UPDATE studymoney SET nextdate=date_add(nextdate, interval 1 year) WHERE loanID=" + loanID);
                        rvalue3 = sql6.executeUpdate("UPDATE studymoney SET leftyear=" + leftyear + " WHERE loanID=" + loanID);
                    }
                }
                if (rvalue2 > 0 && rvalue3 > 0) {
                    out.print("贷款发放成功！");%><br><br><%
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
