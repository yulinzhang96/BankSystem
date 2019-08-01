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
String number=request.getParameter("idnum");
String sex=request.getParameter("sex");
out.println(number);
out.println(sex);
ConnDB conn=new ConnDB();
conn.first();
if(sex.equals("0")){
	boolean i=conn.changeClose(number);
	if(i==true){
		%>
		<script>
		alert("销户成功!");
		</script>
		<%
	}
	else{
		%>
		<script>
		alert("销户失败!");
		</script>
		<%
	}
	response.setHeader("Refresh","2;URL=onecard_loss_or_close.jsp");
}
else{
	boolean i=conn.changeLoss(number,"1");
	if(i==true){
		%>
		<script>
		alert("挂失成功!");
		</script>
		<%
	}
	else{
		%>
		<script>
		alert("挂失失败!");
		</script>
		<%
	}
	response.setHeader("Refresh","2;URL=onecard_loss_or_close.jsp");
}
%>

</body>
</html>