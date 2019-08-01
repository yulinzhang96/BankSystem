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
        <title>信用卡3</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>刷卡消费!</h1>
            <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">   
   <form action="xiaofei2.jsp"method="post"name="frmmain">
       请输入信用卡卡号：
       <input type="text" name="a3"/>
       <br>
       请输入消费的额度：    
          <input type="text" name="a4"/>
          <br>
       
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
           
           
           
    </body>
</html>
