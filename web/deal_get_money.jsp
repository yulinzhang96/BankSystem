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
<title>Insert title here</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
<%
String id=request.getParameter("id");
String num=request.getParameter("num");
String moneytype=request.getParameter("moneytype");
String type=request.getParameter("type");
String time0=request.getParameter("time0");
String sex=request.getParameter("sex");
//out.println(id);
//out.println(sex);
ConnDB conn=new ConnDB();
conn.first();
int i=Integer.parseInt(sex);
String b=null;
ArrayList<Account> s=null;
s=conn.getMoney(id,moneytype,type,time0);    
Account g=s.get(i);
if(conn.isClose(id)){
    b="账户已销户";
}
else if(conn.isLoss(id)){
    b="账户已挂失";
}
else{if(type.equals("1")){
	b=conn.getHuoQiMoney(id,g.subnumber,num,time0);
}
if(type.equals("2")){
	b=conn.getZhengCunMoney(id,g.subnumber,num,time0);
}
if(type.equals("3")){
	b=conn.getDingHuoMoney(id,g.subnumber,time0);
}}
%>
<script>
alert("<%=b%>");
</script>
<%
response.setHeader("Refresh","2;URL=get_money.jsp");
%>
</body>
</html>