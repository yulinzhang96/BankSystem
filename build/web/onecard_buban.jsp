<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<%@ page import="bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>一卡通补办</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
  <tr> 
   <td colspan="2"><hr /> 
   </td> 
  </tr> 
  <tr> 
   <td> 
     <br/>
     <tr> 
      <input type = "button" value = "返回一卡通业务办理主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageOneCard.jsp'">      
     </tr>  
     <br/>
     </td> 
  </tr> 
 <%--response.sendRedirect("First.jsp");--%>
 <form name="form2" action="onecard_buban.jsp" method="post" onsubmit="return checkform()">
	<table align="center">
		<tr>
			<td>身份证账号：</td>
			<td><input type="text" name="number1" id="number1"></td>
		</tr>
		<tr>
			<td>当前日期：</td>
			<td><input type="text" name="time" id="time"></td>
		</tr>
		<tr>
			<td colspan="1">
			</td>
			<td>
				<input type="submit" value="提交"/>
				<input type="reset" value="重置"/>
			</td>
		</tr>
	</table>
</form>

<%
String number=request.getParameter("number1");
String now_time=request.getParameter("time");
if(number==null){}
else{
	ConnDB conn=new ConnDB();
	conn.first();
	Card c=conn.getStudentGrade(number);%>
	<%
	if (c==null) {
	%>
	<script>
	alert("查找不到该账号!");
	</script>
	<%
	}
	%>
	<%
	if(c!=null){
	%>
	<%boolean b=conn.bubanCard(number,now_time);	
	if (b==true) {%>
	<script>
	alert("补办成功!请收好您的一卡通！");
	</script>
	<%}%>
	<%if (b==false) {%>
	<script>
	alert("补办失败!");
	</script>
	<%}%>
<%}%>
<%}%>
</body>
</html>