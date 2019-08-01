<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>转账页面</title>
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
    <tr> 
        <td colspan="2"><hr /> 
        </td> 
    </tr> 
    <tr> 
        <td> 
    <tr> 
    <input type = "button" value = "返回一卡通业务办理主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageOneCard.jsp'">      
</tr> 
<br/>
</td> 
</tr> 
<form name="form2" action="deal_onecard_zhuanzhang.jsp" method="post" onsubmit="return checkform()">
    <table align="center">
        <tr>
            <td>一卡通账号：</td>
            <td><input type="text" name="card" id="card"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="text" name="password" id="password"></td>
        </tr>
        <tr>
            <td>数量：</td>
            <td><input type="text" name="num" id="num"></td>
        </tr>
        <tr>
            <td>对方一卡通账号：</td>
            <td><input type="text" name="card1" id="card1"></td>
        </tr>	
        <tr>
            <td>币种：</td>
            <td><select name="money">
                    <option value="1">人民币</option>
                    <option value="2">美元</option>
                    <option value="3">港币</option>
                    <option value="4">日元</option>
                    <option value="5">欧元</option>
                </select></td>
        </tr>
        <tr>
            <td>转账时间：</td>
            <td><input type="text" name="time0" id="time0"></td>
        </tr>	
        <tr>
            <td colspan="1">
            </td>
            <td>
                <input type="submit" value="提交"/>
                <input type="reset" value="重置"/>
            </td>
        </tr>
    </table>
</form>
<%--response.sendRedirect("First.jsp");--%>
</body>
</html>