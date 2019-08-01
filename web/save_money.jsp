<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>存款页面</title>
        <script>
            function checkform() {
                if (form2.name.value == "")
                {
                    alert("账号不能为空");
                    return false;
                }
                if (form2.password.value == "")
                {
                    alert("密码不能为空");
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <center>
            <font face="隶书" size="6">储蓄业务办理</font>
            <tr> 
                <td colspan="2"><hr /> 
                </td> 
            </tr> 
            <tr> 
                <td> 
            <tr>
            </tr>
            <br/>
        </td> 
    </tr> 
    <form name="form2" action="deal_save_money.jsp" method="post" onsubmit="return checkform()">
        <table align="center">
            <tr>
                <td><b>一卡通账号：</b></td>
                <td><input type="text" name="card" id="card"></td>
            </tr>
            <tr>
                <td><b>密码：</b></td>
                <td><input type="text" name="password" id="password"></td>
            </tr>
            <tr>
                <td><b>数量：</b></td>
                <td><input type="text" name="num" id="num"></td>
            </tr>	
            <tr>
                <td><b>币种：</b></td>
                <td><select name="money">
                        <option value="1">人民币</option>
                        <option value="2">美元</option>
                        <option value="3">港币</option>
                        <option value="4">日元</option>
                        <option value="5">欧元</option>
                    </select></td>
            </tr>
            <tr>
                <td><b>储蓄类别：</b></td>
                <td><select name="type">
                        <option value="1">活期储蓄</option>
                        <option value="2">整存整取定期储蓄</option>
                        <option value="3">定活两便储蓄存款</option>
                    </select></td>
            </tr>
            <tr>
                <td><b>存款期限：</b></td>
                <td><select name="time">
                        <option value="0">无</option>
                        <option value="1">1年</option>
                        <option value="5">5年</option>
                    </select><b>(整存整取储蓄选择)</b></td>
            </tr>
            <tr>
                <td><b>续存与否：</b></td>
                <td><select name="xucun">
                        <option value="0">无</option>
                        <option value="1">续存</option>
                        <option value="2">不续存</option>
                    </select><b>(整存整取储蓄选择)</b></td>
            </tr>
            <tr>
                <td><b>存款时间：</b></td>
                <td><input type="text" name="time0" id="time0"></td>
            </tr>	
        </table>
        <tr>
            <td colspan="1">
            </td>
            <td>
                <input type="submit" style= "background-color: transparent;font-size:12px;height:40px;width:120px " value="提交"/>&nbsp;&nbsp;
                <input type="reset" style= "background-color: transparent;font-size:12px;height:40px;width:120px " value="重置"/>
            </td>
        </tr>
    </form>
    <br><br>
    <input type = "button" value = "返回储蓄主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'Save_Index.jsp'">      
</center>
<%--response.sendRedirect("First.jsp");--%>
</body>
</html>