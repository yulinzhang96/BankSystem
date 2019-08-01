<%-- 
    Document   : xinyongedu
    Created on : 2018-6-9, 11:21:14
    Author     : 10407
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡5</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>信用卡还款!</h1>
            <input type="button" name="submit" onclick="javascript:history.back(-1);"value="返回上一页" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">   
         
            
  <br>         
   <input type="button" value="柜台还款" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="window.location.href='huankuan2.jsp';"/>
    <br>         
   <input type="button" value="网上还款" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="window.location.href='huankuanwangshang.jsp';"/>
    </body>
</html>
