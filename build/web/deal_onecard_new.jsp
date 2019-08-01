<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <%
        //String name=request.getParameter("name");
        String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
        String number=request.getParameter("number");
        String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
        String phone=request.getParameter("phone");
        String password=request.getParameter("password");
        out.println(name);
        out.println(address);
        ConnDB conn=new ConnDB();
        conn.first();
        String s=conn.addCardInformation(name,number,address,phone,password);
        //conn.addCard();%>

        <%
        if (s!=null) {
        %>
        <%
        response.sendRedirect("onecard_new.jsp?id="+s);
        }
        %>
        <%
        if (s==null) {
        %>
        <%
        s="";
        response.sendRedirect("onecard_new.jsp?id="+s);
        }
        %>
    </body>
</html>