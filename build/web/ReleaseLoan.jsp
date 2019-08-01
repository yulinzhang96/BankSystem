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
        <title>发放贷款</title>
        <script type="text/javascript">
            function gotoUrl()
            {
                var value = document.getElementById('catagory_id').value;
                switch (value)
                {
                    case '0':
                        window.location.href = 'ReleaseLoan1.jsp';
                        break;
                    case '1':
                        window.location.href = 'ReleaseLoan2.jsp';
                        break;
                    case '2':
                        window.location.href = 'ReleaseLoan3.jsp';
                        break;
                    default:
                        alert("错误!");
                }
            }
        </script>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <b>
            <font face="隶书" size="6">选择发放的贷款类型</font>
        </b>
        <hr>
        <table border="0">
            <tbody>
                <tr>
            <select name="catagory_id"  id="catagory_id" style= "background-color: transparent;font-size:16px">
                <option value="0" style= "background-color: transparent;font-size:16px">个人助学贷款</option>
                <option value="1" style= "background-color: transparent;font-size:16px">个人住房贷款</option>
                <option value="2" style= "background-color: transparent;font-size:16px">个人自助贷款</option>
            </select>
            <br>
            </tr>
            </tbody>
        </table>
        <input type="button" value = "确定" onclick="gotoUrl();" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">
        <br>
        <br>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
