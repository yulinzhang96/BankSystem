<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡5</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>最低还款!</h1>
        
         <%String kaka = (String) session.getAttribute("kaka1");%>
<%
// out.print(kaka);
    String number=request.getParameter("a4");
    if(number!=null){
 //       out.print(number);
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
    Statement statement3=conn.createStatement();
    Statement statement4=conn.createStatement();
     Statement statement5=conn.createStatement();
      Statement statement6=conn.createStatement();
       Statement statement7=conn.createStatement();
   String sql1="update xinyongka set yihuankuan=yihuankuan+'"+number+"',keyongyue=keyongyue+'"+number+"' where kahao='"+kaka+"'"; 
   String sql3="insert into huankuanbiao(kahao,huankuanedu,huankuanriqi) values('"+kaka+"','"+number+"',now())"; 
      int n=statement.executeUpdate(sql1);
   int n3=statement3.executeUpdate(sql3);
   
   
  //  Statement statement5=conn.createStatement();
 //   String sql5="select * from yujiehuankuanbiao where kahao='"+kaka+"'";
 //   ResultSet rs5=statement5.executeQuery(sql5);
//   Double dd=rs5.getDouble("yujiejingzonge");
 //  Double dd2=rs5.getDouble("yujiezonglixi");
 
 
 String sql4="update yujiehuankuanbiao set yujiejingzonge=yujiejingzonge-'"+number+"' where kahao='"+kaka+"' and yujiejingzonge>='"+number+"'"; 
  int n4=statement4.executeUpdate(sql4);
  
    String sql5="update yujiehuankuanbiao set yujiejingzonge='0',yujiezonglixi='0' where kahao='"+kaka+"' and yujiejingzonge+yujiezonglixi<='"+number+"'"; 
   int n5=statement5.executeUpdate(sql5);
  
     String sql6="update yujiehuankuanbiao set yujiezonglixi=yujiejingzonge-'"+number+"'+yujiezonglixi,yujiejingzonge=0 where kahao='"+kaka+"' and yujiejingzonge<'"+number+"' and yujiejingzonge+yujiezonglixi>'"+number+"'"; 
  int n6=statement6.executeUpdate(sql6);
  
 //    String sql7="update yujiehuankuanbiao set yujiejingzonge='0' where kahao='"+kaka+"' and yujiejingzonge<'"+number+"' and yujiejingzonge+yujiezonglixi>'"+number+"'"; 
  //int n7=statement7.executeUpdate(sql7);
   Statement statement17=conn.createStatement();
  String sql17="update zuidihuankuanbiao set zhi=zhi2 where kahao='"+kaka+"'"; 
  int n17=statement17.executeUpdate(sql17);
  
     Statement statement18=conn.createStatement();
  String sql18="update zuidihuankuanbiao set zhi2=0 where '"+number+"'>=zuidihuankuane and kahao='"+kaka+"'"; 
  int n18=statement18.executeUpdate(sql18);
  
     Statement statement19=conn.createStatement();
  String sql19="update zuidihuankuanbiao set zhi2=zuidihuankuane-'"+number+"' where '"+number+"'<zuidihuankuane and kahao='"+kaka+"'"; 
  int n19=statement19.executeUpdate(sql19);
  
  
   out.print("还款成功");
   
   
   
      
   
   

    conn.close();
}catch(SQLException e)
{
e.printStackTrace();
}

    }  
%>
    </body>
</html>
