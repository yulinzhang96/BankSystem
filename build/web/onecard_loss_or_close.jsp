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
<title>一卡通销户或挂失</title>
<script>
function checkform(){
if(form2.id.value=="")
{
   alert("账号不能为空");
   return false;
}
return true;
}
</script>
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
      <input type = "button" value = "活期储蓄" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'First.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "返回一卡通业务办理主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'ManageOneCard.jsp'">      
     </tr> 
     <br/>
    </td> 
  </tr> 
  <%--onsubmit="return checkform()"--%>
  <form name="form2" action="onecard_loss_or_close.jsp" method="post" onsubmit="return checkform()">
	<table align="center">
		<tr>
			<td>身份证账号：</td>
			<td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<td colspan="1">
			</td>
			<td>
				<input type="submit" value="查询"/>
				<input type="reset" value="重置"/>
			</td>
		</tr>
	</table>
</form>
<%
String number=request.getParameter("id");
if(number==null){
	
}
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
	//response.sendRedirect("Five.jsp");
	}
	%>
	<%
	if(c!=null){
	%>
	<center>
	<br/>
	<h1>查询结果</h1>
	<br/>
	  <tr> 
	   <td colspan="2"><hr /> 
	   </td> 
	  </tr> 
	<table border="1" width="80%">
	    <tr>
	        <td>一卡通账号</td>
	        <td>姓名</td>
	        <td>身份证号码</td>
	        <td>联系电话</td>
	        <td>密码</td>
	        <td>是否挂失</td>
	        <td>是否销户</td>
	    </tr>
	<tr>
	    <td><%=c.id%></td>
	    <td><%=c.name%></td>
	    <td><%=c.number%></td>
	    <td><%=c.phone%></td>
	    <td><%=c.password%></td>
	    <%if(c.loss.equals("0")) {%>
	    <td>否</td>
	    <%} %>
	    <% if(c.loss.equals("1")){%>
	    <td>是</td>
	    <%} %>
	    <%if(c.close.equals("0")) {%>
	    <td>否</td>
	    <%} %>
	    <% if(c.close.equals("1")){%>
	    <td>是</td>
	    <%} %>
	</tr>
	</table>
	<form name="form3" action="deal_onecard_loss_or_close.jsp" method="post">
	        <input type="hidden" name="idnum" value=<%=c.id%>> 
			<tr>
			 <td><input type="radio" name="sex" value="0" checked onclick="hidd();">销户</td>
             <td><input type="radio" name="sex" value="1" onclick="show();">挂失</td>
		    </tr>	
			<td>
				<input type="submit" value="提交"/>
				<input type="reset" value="重置"/>
			</td>
</form>
	  <%}%>  	        	       	       
	
<%}%>

 <%--response.sendRedirect("First.jsp");--%>
</body>
</html>