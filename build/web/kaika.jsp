<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡1</title>       
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>开卡</h1>
         <input type="button" name="submit" onclick="javascript:history.back(-1);"value="返回上一页" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">   
   <form action="kaika2.jsp"method="post"name="frmmain">
       请输入新信用卡卡号：
       <input type="text" name="a3"/>
       <br>
         请输入id：
       <input type="text" name="a6"/>
       <br>
        请输入信用卡的密码：   
       <input type="password" name="a5"/>
       <br>
       请输入当前信用额度：    
          <input type="text" name="a4"/>
          <br>
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
   
 

<hr>
    </body>
</html>
