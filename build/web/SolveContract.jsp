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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>处理贷款合同</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
                <b>
            <font face="隶书" size="6">处理贷款合同</font>
        </b>
        <hr>
        <%
            Connection con;
            Statement sql;
            ResultSet rs;
            Boolean flag = true;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                String uri = "jdbc:mysql://localhost:3306/banksystem";
                con = DriverManager.getConnection(uri, "root", "19960822");
                sql = con.createStatement();
                rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=1");
                if (!rs.next()) {
                    out.print("暂无可处理贷款合同！\n");
                    flag = false;
                }
                if (flag) {
                    rs = sql.executeQuery("SELECT * FROM loaninfo WHERE verified=1");
                    out.print("<table border=1>");
                    out.print("<tr>");
                    out.print("<th width=100>" + "一卡通账号");
                    out.print("<th width=150>" + "申请日期(年-月-日)");
                    out.print("<th width=100>" + "种类");
                    out.print("<th width=100>" + "类型");
                    out.print("<th width=135>" + "期限");
                    out.print("<th width=100>" + "数额(元RMB)");
                    out.print("<th width=110>" + "申请时利率(%)");
                    out.print("<th width=120>" + "偿还方式");
                    out.print("<th width=80>" + "进度");
                    out.print("</tr>");
                    while (rs.next()) {
                        out.print("<tr>");
                        out.print("<td>" + rs.getString(1) + "</td>"); 
                        out.print("<td>" + rs.getString(2) + "</td>");
                        String tempchar = rs.getString(3).toString();
                        if (tempchar.equals("1")) {
                            out.print("<td>" + "短期贷款(A)" + "</td>");
                        }
                        if (tempchar.equals("2")) {
                            out.print("<td>" + "短期贷款(B)" + "</td>");
                        }
                        if (tempchar.equals("3")) {
                            out.print("<td>" + "长期贷款(C)" + "</td>");
                        }
                        if (tempchar.equals("4")) {
                            out.print("<td>" + "长期贷款(D)" + "</td>");
                        }
                        if (tempchar.equals("5")) {
                            out.print("<td>" + "长期贷款(E)" + "</td>");
                        }
                        String tempchar2 = rs.getString(4).toString();
                        if (tempchar2.equals("1")) {
                            out.print("<td>" + "个人助学贷款" + "</td>");
                        }
                        if (tempchar2.equals("2")) {
                            out.print("<td>" + "个人住房贷款" + "</td>");
                        }
                        if (tempchar2.equals("3")) {
                            out.print("<td>" + "个人自助贷款" + "</td>");
                        }
                        out.print("<td>" + rs.getString(5) + "年" + rs.getString(6) + "个月" + rs.getString(7) + "天" + "</td>");
                        out.print("<td>" + rs.getString(8) + "</td>");
                        out.print("<td>" + rs.getString(9) + "</td>");
                        String tempchar3 = rs.getString(10).toString();
                        if (tempchar3.equals("1")) {
                            out.print("<td>" + "一次性利随本清" + "</td>");
                        }
                        if (tempchar3.equals("2")) {
                            out.print("<td>" + "分期付息一次还本" + "</td>");
                        }
                        if (tempchar3.equals("3")) {
                            out.print("<td>" + "等额本息" + "</td>");
                        }
                        if (tempchar3.equals("4")) {
                            out.print("<td>" + "等额本金" + "</td>");
                        }
                        String tempchar4 = rs.getString(11).toString();
                        if (tempchar4.equals("-1")) {
                            out.print("<td>" + "申请失败" + "</td>");
                        }
                        if (tempchar4.equals("0")) {
                            out.print("<td>" + "贷款审批中" + "</td>");
                        }
                        if (tempchar4.equals("1")) {
                            out.print("<td>" + "合同处理中" + "</td>");
                        }
                        if (tempchar4.equals("2")) {
                            out.print("<td>" + "贷款发放中" + "</td>");
                        }
                        if (tempchar4.equals("3")) {
                            out.print("<td>" + "贷款已发放" + "</td>");
                        }
                        if (tempchar4.equals("4")) {
                            out.print("<td>" + "待发放贷款" + "</td>");
                        }
                        if (tempchar4.equals("5")) {
                            out.print("<td>" + "贷款已审批" + "</td>");
                        }
                        out.print("</tr>");
                    }
                }
                out.print("</table>");
                con.close();
            } catch (SQLException e1) {
                out.print(e1);
            }
        %>
        <br>
                <form action="SolveContractFinished.jsp">
            <input type="submit" name="next" value="一键处理" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
                </form><br><br>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
