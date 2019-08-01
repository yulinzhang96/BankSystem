<%-- 
    Document   : admin
    Created on : 2018-6-3, 19:52:37
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员页面</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <table>
            <font face="隶书" size="6">管理员功能区</font>
            <hr>
            <form action="adminfunc.jsp" method="post">
                <table>
                    <input type="radio"name="func"value="1" checked><b>创建新用户</b>
                    <br>
                    <br>
                    <input type="radio"name="func"value="2"><b>删除老用户</b>
                    <br>
                    <br>
                    <input type="radio"name="func"value="3"><b>修改用户信息</b>
                    <br>
                    <br>
                    <input type="radio"name="func"value="4"><b>访问核心数据库</b>
                </table>
                <br>
                <br>
                <tr>
                    <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回">
                </tr>
                </table>
            </form>
            </body>
            </html>
