<%-- 
    Document   : adminfunc
    Created on : 2018-6-6, 10:04:06
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员功能区</title>
        <script type="text/javascript">
            function Check() {
                if (document.rcheck.userName.value === "") {
                    alert("用户名不能为空！");
                    document.rcheck.userName.focus();
                    return false;
                }
                if (document.rcheck.userPassword.value === "") {
                    alert("用户密码不能为空！");
                    document.rcheck.userPassword.focus();
                    return false;
                }
                if (document.rcheck.userName.value.length < 5 || document.rcheck.userName.value.length > 5) {
                    alert("ID为5位！");
                    document.rcheck.userName.focus();
                    return false;
                }
                if (document.rcheck.userPassword.value.length < 8 || document.rcheck.userPassword.value.length > 16) {
                    alert("用户密码为8-16位！");
                    document.rcheck.userName.focus();
                    return false;
                }
                if (document.rcheck.userName.value.length === 5) {
                    var id = document.rcheck.userName.value.toString();
                    var passw = document.rcheck.userPassword.value.toString();
                    // alert("提示：请增加管理员信息！\n1.管理员ID首位为工号（1-5）\n2.密码（8-16位）\n3.密码不能包含用户ID\n4.管理员ID为5位");
                    if (document.rcheck.userName.value[0] < '1' || document.rcheck.userName.value[0] > '5')
                    {
                        alert("首位为工号(1-5)，请重新输入！");
                        document.rcheck.userName.focus();
                        return false;
                    }
                    if (passw.indexOf(id) > -1) {
                        alert("密码不能包含用户ID,请重新输入！");
                        document.rcheck.userName.focus();
                        return false;
                    }
                    return true;
                }
                return true;
            }
        </script>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <font face="隶书" size="6">管理员功能区</font>
        <hr>
        <%
            String myfunc = request.getParameter("func");

            if (myfunc.equals("1")) {
        %>
        <form  action = "registercheck.jsp" method = "post" name ="rcheck" onsubmit="return Check()">
            <table>
                <tr><td><b>待增加用户ID：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="int" style="width:180px" name="userName"></td></tr>
                <tr><td><b>待增加用户密码：</b></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="password" style="width:180px" name="userPassword"></td></tr>
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
        <%}%>
        <%
            if (myfunc.equals("2")) {%>
        <form  action = "deleteUser.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>待删除用户ID：</b></td><td><input type="int" style="width:180px" name="userName"></td></tr>
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
        <% }
        %>
        <%
            if (myfunc.equals("3")) {%>
        <form  action = "alterUser.jsp" method = "post" name ="rcheck">
            <table>
                <tr><td><b>待更改用户ID：</b></td><td><input type="int" style="width:180px" name="userName"></td></tr>
                <tr><td><b>更改用户密码为：</b></td><td><input type="int" style="width:180px" name="userapass"></td></tr>
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
        <% }
        %>
        <%
            if (myfunc.equals("4")) {%>
        <form  action = "visitDatabase.jsp" method = "post" name ="rcheck">
            <table>
                <input type="radio"name="act"value="visit" checked><b>查看核心数据</b>
                <input type="radio"name="act"value="alrate1" ><b>修改定期储蓄利率（1年）</b>
                <input type="radio"name="act"value="alrate5" checked><b>修改定期储蓄利率（5年）</b>
                <input type="radio"name="act"value="alcrate" checked><b>修改活期储蓄利率</b>
                <input type="radio"name="act"value="alloaning" checked><b>修改贷款利率：</b>
                <input type="radio"name="act"value="credit" checked><b>修改信用卡利息：</b>

                <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
            </table>
            <tr>
                <td><input type="submit" value="确定" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="重置" name="reset" style="background-color: transparent;width: 100px;height: 50px;color: black"></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="button" name="submit" style="background-color: transparent;width: 100px;height: 50px;color: black" onclick="javascript:history.back(-1);"value="返回"></td>
            </tr>
        </form>
        <% }
        %>
    </body>
</html>
