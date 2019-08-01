<%-- 
    Document   : TakeLoanSolved
    Created on : 2018-6-6, 19:01:42
    Author     : LeonardZhang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>更新贷款利率</title>
    </head>
    <script>
        function checkform() {
            if (form1.loanA.value == "" || form1.loanB.value == "" || form1.loanC.value == "" || form1.loanD.value == "" || form1.loanE.value == "")
            {
                alert("文本框不能有空!");
                return false;
            }
            return true;
        }
    </script>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
    <center>
        <b>
            <font face="隶书" size="6">更新贷款利率</font>
        </b>
        <hr>
        <form name="form1" action="UpdateRateNew.jsp" method="post" onsubmit="return checkform()"> 
            <tr>
                <td><table>
                        <strong>短期贷款(A)利率：</strong>&nbsp;
                        <input type="text" size="3" name="loanA" id="loanA" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46"> % 
                        <br><br>
                        <strong>短期贷款(B)利率：</strong>&nbsp;
                        <input type="text" size="3" name="loanB" id="loanB" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46"> %
                        <br><br>
                        <strong>长期贷款(C)利率：</strong>&nbsp;
                        <input type="text" size="3" name="loanC" id="loanC" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46"> %
                        <br><br>
                        <strong>长期贷款(D)利率：</strong>&nbsp;
                        <input type="text" size="3" name="loanD" id="loanD" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46"> %
                        <br><br>
                        <strong>长期贷款(E)利率：</strong>&nbsp;
                        <input type="text" size="3" name="loanE" id="loanE" onkeypress="return event.keyCode >= 48 && event.keyCode <= 57 || event.keyCode == 46"> %
                        <br><br>
                    </table>
                    <p> 
                        <input type="Submit" name="button" value="更新" style= "background-color: transparent;font-size:12px;height:35px;width:120px ">
                        <input type="Reset" value="清空" style= "background-color: transparent;font-size:12px;height:35px;width:120px ">
                    </p> 
                    <br>
                </td>
            </tr>
        </form>
        <form action="LoanClerkHome.html">
            <input type="submit" name="home" value="返回贷款管理主界面" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>
    </center>
</body>
</html>
