<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>存款处理</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
<%
String id=request.getParameter("card");
String password=request.getParameter("password");
String num=request.getParameter("num");
String moneytype=request.getParameter("money");
String type=request.getParameter("type");
String time=request.getParameter("time");
String xucun=request.getParameter("xucun");
String time0=request.getParameter("time0");
ConnDB conn=new ConnDB();
conn.first();
String f=null;
boolean c=true;
if(!conn.checkPassword(id, password)){
    f="密码错误";
    c=false;
}
if(conn.isClose(id)){
    f="账户已销户";
    c=false;
}
if(conn.isLoss(id)){
    f="账户已挂失";
    c=false;
}
%>
<%
if (f!=null) {
%>
<script>
    alert("<%=f%>");
</script>
<%
response.setHeader("Refresh","2;URL=save_money.jsp");
}
%>
<%
if (f==null) {
String b=null;
if(type.equals("1")){
	b=conn.addHuoQiAccountInformation(id,num,moneytype,type,time,time0,xucun);
}
else{b=conn.addAccountInformation(id,num,moneytype,type,time,time0,xucun);}
%>
<script>
alert("<%=b%>");
</script>
<%
response.setHeader("Refresh","2;URL=save_money.jsp");
%>
<%}%>
</body>
</html>