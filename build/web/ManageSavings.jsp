<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>存款业务办理主页</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <center>
            <font face="隶书" size="6">存款业务办理</font>
    <tr> 
        <td colspan="2"><hr /> 
        </td> 
    </tr> 
    <tr> 
        <td> 
            <br/>
    <tr> 
    <input type = "button" value = "活期储蓄" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'save_money.jsp'">      
</tr> 
<br/>
<tr> 
<input type = "button" value = "整存整取定期储蓄" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'save_money.jsp'">      
</tr> 
<br/>
<tr> 
<input type = "button" value = "定活两便储蓄存款" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'save_money.jsp'">      
</tr> 
<br/>
<tr> 
<input type = "button" value = "返回储蓄主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'Save_Index.jsp'">      
</tr> 
</td> 
</tr> 
        </center>
<%--response.sendRedirect("First.jsp");--%>
</body>
</html>