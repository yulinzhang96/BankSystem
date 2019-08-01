<%--
    Document   : login.jsp
    Created on : 2018-6-2, 19:43:54
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>银行用户管理系统</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript">
            function check()
            {
                if (form1.userName.value === "" || form1.userPassword.value === "")
                {
                    alert("用户名或密码不能为空！");
                    form1.userName.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <font face="隶书" color="dark" size="6">银行管理系统</font>
        <hr>
        <br>
        <form action="loginCheck.jsp" method="post" name="form1" onsubmit="return check()">
            <table border="0">
                <tr>
                    <td><b>请选择业务类型：</b></td>
                    <td>
                        <input type="radio"name="kind"value="admin" checked><b>系统管理</b>
                        <input type="radio"name="kind"value="savers"><b>储蓄</b>
                        <input type="radio"name="kind"value="carduser"><b>信用卡</b>
                        <input type="radio"name="kind"value="lender"><b>贷款</b>
                    </td>
                </tr>
                <tr>
                    <td><b>请输入用户名：</b></td><td><input type="int" style="width:180px" name="userName" size="20" maxlength="16"></td>
                </tr>
                <tr>
                    <td><b>请输入密码：</b></td><td><input type="password" style="width:180px" name="userPassword" size="20" maxlength="16"></td>
                </tr>
            </table>
            <br>
            <br>
            <tr>
            <input type="submit" value="登录" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="清空" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black">
            </tr>
        </form>
        <%session.setAttribute("name", "login");%>
        <br><br><br><br><br><br><br><br><br><br><br><br><font color="white" size="2">Copyright @2018 The Brave Corporation, All Rights Reserved</font>
    </center>
</body>
</html>


