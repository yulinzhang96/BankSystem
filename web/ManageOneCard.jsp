<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="bean.ConnDB" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>一卡通业务办理主页</title>
</head>
   <body style="background:url(Image/qinglake.jpg);background-size:cover;">
       <center>
                   <font face="隶书" color="black" size="6">一卡通业务办理</font>
        <br>
  <tr> 
   <td colspan="2"><hr /> 
   </td> 
  </tr> 
  <tr> 
   <td> 
     <br/>
     <tr> 
      <input type = "button" value = "一卡通办理" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_new.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "一卡通销户或挂失"style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_loss_or_close.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "一卡通补办" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_buban.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "一卡通取消挂失" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_quxiao.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "一卡通修改密码" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_ch_password.jsp'">      
     </tr> 
     <br/>  
     <tr> 
      <input type = "button" value = "一卡通转账" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'onecard_zhuanzhang.jsp'">      
     </tr> 
     <br/>
     <tr> 
      <input type = "button" value = "返回储蓄主页" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick = "window.location.href = 'Save_Index.jsp'">      
     </tr> 
     </td> 
  </tr> 
 <%--response.sendRedirect("First.jsp");--%>
       </center>
</body>
</html>