<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>储蓄业务办理主页</title>
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
                    <br/>
                    <table>
                        <tr> 
                        <input type = "button" value = "存款业务办理" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageSavings.jsp'">      
                        </tr> 
                        <br/>
                        <tr> 
                        <input type = "button" value = "取款业务办理" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'get_money.jsp'">      
                        </tr> 
                        <br/>
                        <tr> 
                        <input type = "button" value = "利息计算" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageInterest.jsp'">      
                        </tr> 
                        <br/>
                        <tr> 
                        <input type = "button" value = "一卡通业务办理" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageOneCard.jsp'">      
                        </tr> 
                        <br/>
                        <tr> 
                        <input type = "button" value = "退出登录" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'index.jsp'">      
                        </tr> 
                    </table>
                    <br/>
                </td> 
            </tr> 
        </center>
        <%--response.sendRedirect("First.jsp");--%>
    </body>
</html>