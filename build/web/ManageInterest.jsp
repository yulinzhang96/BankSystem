<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>利息计算主页</title>
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
     <input type = "button" value = "利息计算" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'cal_interest.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "返回储蓄主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'Save_Index.jsp'">      
     </tr> 
     <br/>
     </td> 
  </tr> 
 <%--response.sendRedirect("First.jsp");--%>
</body>
</html>