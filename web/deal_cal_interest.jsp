<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>利息计算处理</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
<%
String type=request.getParameter("type");
String time0=request.getParameter("time0");
ConnDB conn=new ConnDB();
conn.first();
String b=null;
if(type.equals("1")){
	b=conn.calHuoQiLiXi(time0);
}
if(type.equals("2")){
	b=conn.calZhengCunLiXi(time0);
}
%>
<script>
alert("<%=b%>");
</script>
<%
response.setHeader("Refresh","2;URL=cal_interest.jsp");
%>
</body>
</html>