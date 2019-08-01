<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>利息计算</title>
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
            <br/>
    <tr> 
    <input type = "button" value = "利息计算主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageInterest.jsp'">      
</tr> 
<br/>
</td> 
</tr> 
<form name="form2" action="deal_cal_interest.jsp" method="post" onsubmit="return checkform()">
    <table align="center">
        <tr>
            <td>当前时间：</td>
            <td><input type="text" name="time0" id="time0"></td>
        </tr>	
        <tr>
            <td>储蓄类别：</td>
            <td><select name="type">
                    <option value="1">活期储蓄</option>
                    <option value="2">整存整取定期储蓄</option>
                </select></td>
        </tr>
        <tr>
            <td colspan="1">
            </td>
            <td>
                <input type="submit" value="计算利息" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>
                <input type="reset" value="重置" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>
            </td>
        </tr>
    </table>
</form>
<%--response.sendRedirect("First.jsp");--%>
</body>
</html>