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
        <title>处理贷款合同</title>
    </head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <%
            Connection con;
            Statement sql, sql2, sql3, sql4, sql5, sql6;
            ResultSet rs, rs2;
            int rvalue = 0, rvalue2 = 0, rvalue3 = 0, rvalue4 = 0, rvalue5 = 0, rvalue6 = 0;
            int row = 0;
            int cardID = 0;
            int loanID = 0;
            int typeone = 0;
            int typetwo = 0;
            int loanyear = 0;
            int loanmonth = 0;
            int loanday = 0;
            float quantity = 0;
            float startrate = 0;
            int returntype = 0;
            String nextdate = null;
            float nextmoney = 0;
            int leftyear = 0;
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
                rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=1");
                while (rs.next()) {
                    cardID = Integer.parseInt(rs.getString(1));
                    typeone = Integer.parseInt(rs.getString(3));
                    typetwo = Integer.parseInt(rs.getString(4));
                    loanyear = Integer.parseInt(rs.getString(5));
                    loanmonth = Integer.parseInt(rs.getString(6));
                    loanday = Integer.parseInt(rs.getString(7));
                    quantity = Float.parseFloat(rs.getString(8));
                    startrate = Float.parseFloat(rs.getString(9));
                    returntype = Integer.parseInt(rs.getString(10));
                    loanID = Integer.parseInt(rs.getString(12));
                    nextmoney = quantity / loanyear;
                    if (loanyear == 1) {
                        rvalue3 = sql4.executeUpdate("UPDATE loaninfo SET verified=3 WHERE loanID=" + loanID);
                        nextmoney = 0;
                    }
                    rvalue2 = sql2.executeUpdate("INSERT INTO loaning VALUES(" + cardID + "," + loanID + ", " + "now()" + ")");
                    leftyear = loanyear - 1;
                    rvalue5 = sql5.executeUpdate("INSERT INTO studymoney VALUES(" + cardID + "," + loanID + "," + "date_add(now(), interval 1 year)" + "," + nextmoney + "," + leftyear + ")");
                    float principal = quantity;
                    float interest = Float.parseFloat(String.format("%.1f", principal * startrate / 100));
                    rvalue6 = sql6.executeUpdate("INSERT INTO payloan VALUES(" + null + "," + loanID + "," + "date_add(now(), interval " + loanyear + " year)" + "," + principal + "," + interest + "," + 0 + "," + "date_add(now(), interval 1 year)" + "," + 1 + "," + 0 + "," + 0 + "," + "date_add(now(), interval " + loanyear + " year)" +","+ cardID + ")");
                }
                rvalue = sql.executeUpdate("UPDATE loaninfo SET verified=2 WHERE verified=1");
                con.close();
            } catch (SQLException e1) {
                out.print(e1);
            }
            if (rvalue > 0 || rvalue3 > 0) {
                out.print("所有合同已生效！第一笔贷款已分别发放到指定账户！");
            }
        %>
        <br>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
