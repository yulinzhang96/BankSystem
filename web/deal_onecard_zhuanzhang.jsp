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
<title>转账处理</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
<%
String id=request.getParameter("card");
String id1=request.getParameter("card1");
String password=request.getParameter("password");
String num=request.getParameter("num");
String moneytype=request.getParameter("money");
String time0=request.getParameter("time0");
ConnDB conn=new ConnDB();
conn.first();
boolean c=conn.checkPassword(id, password);
%>
<%
if (c==false) {
%>
<script>
alert("密码错误!");
</script>
<%
response.setHeader("Refresh","2;URL=onecard_zhuanzhang.jsp");
}
%>
<%
Account g=null;
g=conn.getMoney1(id,moneytype,"1",time0);  
int i=0;
String b=null;
//out.println(g.money);
//out.println(g.subnumber);
b=conn.getHuoQiMoney(id,g.subnumber,num,time0);
%>
<script>
alert("<%=b%>");
</script>
<%
b=conn.addHuoQiAccountInformation(id1,num,moneytype,"1","0",time0,"0");
%>
<script>
alert("<%=b%>");
</script>
<%
response.setHeader("Refresh","2;URL=onecard_zhuanzhang.jsp");
%>
</body>
</html>