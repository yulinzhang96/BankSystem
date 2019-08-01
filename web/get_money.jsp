<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.*" %>
<%@ page import ="java.sql.*" %>
<%@   page import="java.util.ArrayList" %>
<%@   page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>取款业务办理主页</title>
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
            <font face="隶书" size="6">取款业务办理</font>
            <tr> 
                <td colspan="2"><hr /> 
                </td> 
            </tr> 
            <tr> 
                <td> 
                    <br/>
            <tr> 
            </tr>  
        </td> 
    </tr> 
    <form name="form2" action="get_money.jsp" method="post" onsubmit="return checkform()">
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
                <td><input type="text" name="num" id="num">(定活两便取款不用输入)</td>
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
                <td>储蓄类别：</td>
                <td><select name="type">
                        <option value="1">活期储蓄</option>
                        <option value="2">整存整取定期储蓄</option>
                        <option value="3">定活两便储蓄取款</option>
                    </select></td>
            </tr>
            <tr>
                <td>取款时间：</td>
                <td><input type="text" name="time0" id="time0"></td>
            </tr>	
            <tr>
                <td colspan="1">
                </td>
                <td>
                    <input type="submit" value="提交" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>
                    <input type="reset" value="重置" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>
                </td>
            </tr>
        </table>
    </form>
    <%
        String id = request.getParameter("card");
        String password = request.getParameter("password");
        String num = request.getParameter("num");
        String moneytype = request.getParameter("money");
        String type = request.getParameter("type");
        String time0 = request.getParameter("time0");
        if (id == null) {
        } else {
            ConnDB conn = new ConnDB();
            conn.first();
            boolean c = conn.checkPassword(id, password);
    %>
    <%
        if (c == false) {
    %>
    <script>
        alert("密码错误!");
    </script>
    <%
            response.setHeader("Refresh", "2;URL=get_money.jsp");
        }
    %>
    <%
        String b = null;
        ArrayList<Account> s = null;
        s = conn.getMoney(id, moneytype, type, time0);
    %>
    <%
        if (s == null) {
    %>
    <script>
        alert("抱歉，没有找到对应储蓄子账户!");
    </script>
    <%
            response.setHeader("Refresh", "2;URL=get_money.jsp");
        }
    %>
    <%
        if (s != null) {
    %>
    <center>
        <tr> 
            <td colspan="2"><hr /> 
            </td> 
        </tr> 
        <table border="1" width="80%">
            <tr>
                <td>一卡通账户</td>
                <td>子账户</td>
                <td>存款数量</td>
                <td>币种</td>
                <td>储蓄类型</td>
                <td>时间</td>
                <td>选择</td>
            </tr>
            <form name="form3" action="deal_get_money.jsp" method="post">
                <%
                for (int i = 0; i < s.size(); i++) {
                    Account g = s.get(i);%>
                <input type="hidden" name="id" value=<%=id%>> 
                <input type="hidden" name="moneytype" value=<%=moneytype%>> 
                <input type="hidden" name="type" value=<%=type%>> 
                <input type="hidden" name="time0" value=<%=time0%>> 
                <input type="hidden" name="num" value=<%=num%>> 
                <tr>
                    <td><%=g.id%></td><td><%=g.subnumber%></td><td><%=g.money%></td><td><%=g.moneytype%></td><td><%=g.savetype%></td><td><%=g.time%></td><td><input type="radio" name="sex" value="<%=i%>" checked onclick="hidd();"></td>
                </tr>	
                <%}%>
        </table>
        <td>
            <input type="submit" value="提交" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>&nbsp;&nbsp;
            <input type="reset" value="重置" style= "background-color: transparent;font-size:12px;height:40px;width:120px "/>
        </td>
        </form> 	


        <%}%> 


        <% }%>
        <br><br>
        <input type = "button" value = "返回储蓄主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'Save_Index.jsp'">      
    </center>
    <%--response.sendRedirect("First.jsp");--%>
</body>
</html>