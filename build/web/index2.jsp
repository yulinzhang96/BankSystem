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

<table border="1" width="100%">
    
    
   <%out.print("请输入信用卡卡号：");%>
   <form action=""method="post"name="frmmain">
       <input type="text" name="answer1"/>
       <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
       </form>
   <br>

   <form action="" method="post" name="frmmain" >
       <input type="radio"name="anwser2" value="correct">刷卡消费
         <input type="radio"name="anwser2" value="wrong">预借现金
           <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">
   </form>
    
   <%
       String gongneng=request.getParameter("anwser2");
       
       if(gongneng!=null)
       {
       if(gongneng.equals("correct")){
  //  out.print("你好！");
  %>
  <jsp:forward page="xiaofei.jsp">
      <jsp:param name="" value=""/>
      </jsp:forward>
  <%
    }
else if(gongneng.equals("wrong"))
{

  %>
  <jsp:forward page="yujie.jsp">
      <jsp:param name="" value=""/>
      </jsp:forward>
  <%

}
       }
    %>   
   
   <%
       String kahao1=request.getParameter("answer1");
       
       if(kahao1!=null)
       {
   //    if(kahao1.equals("2")){
           session.setAttribute("ka", kahao1);

  %>
  <jsp:forward page="ceshi.jsp">
      <jsp:param name="" value=""/>
      </jsp:forward>
  <%
    


       }
    %>

   
   
   <%
    String number=request.getParameter("anwser1");
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
    String sql="select * from xinyongka where kahao='" +number+"' ";
  //  
    ResultSet rs=statement.executeQuery(sql);
    
   //    out.print("<tr>");
       
     //  out.print("<td>"+"卡号"+"</td>");
      //    out.print("<td>"+"可用余额"+"</td>");
        //    out.print("<td>"+"信用额度"+"</td>");
          //    out.print("<td>"+"已使用额度"+"</td>");
            //    out.print("<td>"+"已还款"+"</td>");
       
       //out.print("</tr>");
     
        
  
   // while(rs.next())
    //{  
      //  out.print("<tr>");
        
       //int a=rs.getInt("kahao"); 
   //int b=rs.getInt("keyongyue");
     //     int c=rs.getInt("xinyongedu");
       //   int d=rs.getInt("yishiyongedu");
         // int e=rs.getInt("yihuankuan");
        
        
        
     //   out.print("<td>"+a+"</td>");
       //   out.print("<td>"+b+"</td>");
         //   out.print("<td>"+c+"</td>");
           //   out.print("<td>"+d+"</td>");
             //   out.print("<td>"+e+"</td>");
             
     //out.print("</tr>");
   
  //  }
    rs.close();
    conn.close();
}catch(SQLException e)
{
e.printStackTrace();
}


%>
</body>
</html>