<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>申请一卡通</title>
        <script>
            function checkform() {
                if (form2.name.value == "")
                {
                    alert("姓名不能为空");
                    return false;
                }
                if (form2.number.value == "")
                {
                    alert("身份证不能为空");
                    return false;
                }
                if (1)
                {
                    var str = form2.number.value;
                    var pattern = /^\d{18}$/;
                    if (pattern.test(str))
                    {
                    } else
                    {
                        alert('不是18位身份证号');
                        return false;
                    }
                }
                if (form2.address.value == "")
                {
                    alert("地址不能为空");
                    return false;
                }
                if (form2.phone.value == "")
                {
                    alert("电话不能为空");
                    return false;
                }
                if (1)
                {
                    var str = form2.phone.value;
                    var pattern = /^\d{11}$/;
                    if (pattern.test(str))
                    {
                    } else
                    {
                        alert('不是11位手机号');
                        return false;
                    }
                }
                if (form2.password.value == "")
                {
                    alert("密码不能为空");
                    return false;
                }
                if (1)
                {
                    var str = form2.password.value;
                    var pattern = /^\d{6}$/;
                    if (pattern.test(str))
                    {
                    } else
                    {
                        alert('不是6位数字密码');
                        return false;
                    }
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
            <br/>
            <br/>
        </td> 
    </tr> 
    <input type = "button" value = "返回一卡通业务办理主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageOneCard.jsp'">  
    <center>
        <%--onsubmit="return checkform()"--%>
        <form name="form2" action="deal_onecard_new.jsp" method="post" onsubmit="return checkform()">
            <center>
                <table align="center">
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td>身份证号码：</td>
                        <td><input type="text" name="number" id="number"></td>
                    </tr>
                    <tr>
                        <td>住址：</td>
                        <td><input type="text" name="address" id="address"></td>
                    </tr>
                    <tr>
                        <td>联系电话：</td>
                        <td><input type="text" name="phone" id="phone"></td>
                    </tr>
                    <tr>
                        <td>6位数字密码：</td>
                        <td><input type="text" name="password" id="password"></td>
                    </tr>
                    <tr>
                        <td colspan="1">
                        </td>
                    </tr>
                </table>
            </center>
            <center>
                <td>
                    <input type="submit" value="提交" style= "background-color: transparent;font-size:16px;height:50px;width:200px;color: white"/><br><br>
                    <input type="reset" value="重置" style= "background-color: transparent;font-size:16px;height:50px;width:200px;color: white "/>
                </td>
            </center>
        </form>
        <%
            String number = request.getParameter("id");
            if (number != null) {
                if (number == "") {%>
        <font face="隶书" color="white" size="5">您的一卡通开通失败!</font><%
        } else {
            %>
        <font face="隶书" color="white" size="5">您的一卡通开户成功，账号为:<%=number%></font><%
                }

            }

            %>    
    </center>
    <%--response.sendRedirect("First.jsp");--%>
</body>
</html>