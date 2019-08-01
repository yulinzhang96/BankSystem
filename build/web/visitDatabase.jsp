<%-- 
    Document   : visitDatabase
    Created on : 2018-6-12, 20:45:38
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>访问核心数据库</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <%
            Connection con;
            Statement sql;
            ResultSet rs;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String uri = "jdbc:mysql://localhost:3306/liuyang";
            con = DriverManager.getConnection(uri, "root", "19960822");
            sql = con.createStatement();
            String ac = request.getParameter("act");
            if (ac.equals("visit")) {
                rs = sql.executeQuery("SELECT * FROM alldata");
                while (rs.next()) {
        %>
        <table border="1">
            <%
                out.print("<tr>");
                out.print("<td>" + rs.getString(1) + "</td>");
                out.print("<td>" + rs.getString(2) + "</td>");
                out.print("<td>" + rs.getString(3) + "</td>");
                out.print("<td>" + rs.getString(4) + "</td>");
                out.print("<td>" + rs.getString(5) + "</td>");
                out.print("</tr>");

            %>
        </table>
        <br><br>
        <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回">
        <%                                }

            }

        %>

        <%            if (ac.equals("alrate1")) {%>
        <form  action = "alterSaving.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>更改定期储蓄利率(1年)为：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="double" style="width:180px" name="val"></td></tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>

        <%
            }

        %>
        <%            if (ac.equals("alcrate")) {%>
        <form  action = "altercrate.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>更改活期储蓄利率为：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="text" style="width:180px" name="val"></td></tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>

        <%
            }

        %>
        <%            if (ac.equals("alrate5")) {%>
        <form  action = "altersaving1.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>更改定期储蓄利率(5年)为：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="text" style="width:180px" name="val"></td></tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>

        <%
            }

        %>
        <%            if (ac.equals("alloaning")) {%>
        <form  action = "alloaning.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>更改贷款利率为：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="text" style="width:180px" name="val"></td></tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>

        <%
            }

        %>
        <%            if (ac.equals("credit")) {%>
        <form  action = "alcredit.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>更改信用卡利息为：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="double" style="width:180px" name="val"></td></tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>

        <%
            }

        %>
    </body>
</html>
