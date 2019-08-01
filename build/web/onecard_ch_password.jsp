<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>一卡通修改密码</title>
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
 <form name="form2" action="onecard_ch_password.jsp" method="post" onsubmit="return checkform()">
	<table align="center">
		<tr>
			<td>一卡通账号：</td>
			<td><input type="text" name="number" id="number"></td>
		</tr>
		<tr>
			<td>旧6位数字密码：</td>
			<td><input type="text" name="old_password" id="old_password"></td>
		</tr>
		<tr>
			<td>新6位数字密码：</td>
			<td><input type="text" name="password" id="password"></td>
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
String number=request.getParameter("number");
String old=request.getParameter("old_password");
String ne=request.getParameter("password");
if(number==null){
	
}
else{
	ConnDB conn=new ConnDB();
	conn.first();
	boolean b=conn.changePassword(number,old,ne);%>
	<%
	if (b==false) {
	%>
	<script>
	alert("修改失败!");
	</script>
	<%
	//response.sendRedirect("Five.jsp");
	}
	%>
	<%if (b==true) {%>
	<script>
	alert("修改成功!");
	</script>
	<%}%>
<%}%>
</body>
</html>