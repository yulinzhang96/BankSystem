<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SELECT 操作</title>
</head>
<body style="background:url(Image/qinglake.jpg);background-size:cover;">
<h1>信用卡</h1>
<embed src="C:\Users\10407\Documents\Tencent Files\3347382662\FileRecv\MobileFile\1.mp4" width="150px" height="300px" autostart="1">
    <embed src="C:\Users\10407\Documents\Tencent Files\3347382662\FileRecv\MobileFile\2.mp4" width="150px" height="300px" autostart="1">
        <embed src="C:\Users\10407\Documents\Tencent Files\3347382662\FileRecv\MobileFile\3.mp4" width="150px" height="300px" autostart="1">
    <br>
<table border="1" width="100%">
    
    
   <%out.print("请输入信用卡卡号：");%>
   <form action=""method="post"name="frmmain">
       <input type="text" name="answer1"/>
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
   <br>
    <%out.print("请输入的消费额度：");%>
   <form action=""method="post"name="frmmain">
       <input type="int" name="answer2"/>
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
    
      <%String kaka=(String)session.getAttribute("ka");%>
<%
  //  out.println("nihaoaaaaaaaaaaaaaaaaaaaaa");
 
   //     out.print("你好！");
  //      int num1=Integer.parseInt(number);
     String driverName="com.mysql.jdbc.Driver";
    try{
    Class.forName(driverName); 
    }
    
    catch(ClassNotFoundException e)
    {
    e.printStackTrace();
    }
    
String url="jdbc:mysql://127.0.0.1:3306/liuyang?user=root&password=19960822&characterEncoding=utf-8";

try
{
    Connection conn=DriverManager.getConnection(url);
    
    Statement statement=conn.createStatement();
      
    String number=request.getParameter("anwser1");
     

    String sql="select * from xinyongka ";
    ResultSet rs=statement.executeQuery(sql);
    
       out.print("<tr>");
       
       out.print("<td>"+"卡号"+"</td>");
          out.print("<td>"+"可用余额"+"</td>");
            out.print("<td>"+"信用额度"+"</td>");
              out.print("<td>"+"已使用额度"+"</td>");
                out.print("<td>"+"已还款"+"</td>");
        out.print("<td>"+"还款日"+"</td>");
       out.print("</tr>");
     
        
  
    while(rs.next())
    {  
        out.print("<tr>");
        
       int a=rs.getInt("kahao"); 
   int b=rs.getInt("keyongyue");
          int c=rs.getInt("xinyongedu");
          int d=rs.getInt("yishiyongedu");
          int e=rs.getInt("yihuankuan");
          java.sql.Date f=rs.getDate("huankuanri");
        
        
        
        out.print("<td>"+a+"</td>");
          out.print("<td>"+b+"</td>");
            out.print("<td>"+c+"</td>");
              out.print("<td>"+d+"</td>");
                out.print("<td>"+e+"</td>");
               out.print("<td>"+f+"</td>");
     out.print("</tr>");
   
    
     
    }
    rs.close();
       
    conn.close();
}catch(SQLException e)
{
e.printStackTrace();
}
    //  else out.print("你不好！");

%>
</body>
</html>