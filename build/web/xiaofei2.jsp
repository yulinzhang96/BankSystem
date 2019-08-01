<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡3</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <h1>刷卡消费</h1>
        <table border="1" width="100%">   
            
            <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">
<%
 String x1=request.getParameter("a3");
  String x2=request.getParameter("a4");

   if((!x1.equals("")) &&(!x2.equals("")))
   {     
if(x1.startsWith("2"))
 {
  if(x1.length()==10)
  { 

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
Statement statement1=conn.createStatement();    
String sql2="select * from xinyongka where kahao='" +x1+"' ";
  ResultSet rs2=statement1.executeQuery(sql2);  
  if(rs2.next())
  {
  String sql1="update xinyongka set yishiyongedu=yishiyongedu+'"+x2+"',keyongyue=keyongyue-'"+x2+"' where kahao='"+x1+"' and '"+x2+"'<keyongyue"; 
  String sql3="insert into xiaofeibiao(kahao,xiaofeiedu,xiaofeiriqi) values('"+x1+"','"+x2+"',now())"; 
  String sql4="update xiaofeibiao set huankuanri=date_add(xiaofeiriqi,interval (20-day(xiaofeiriqi)) day)"; 
  String sql5="update xiaofeibiao set huankuanri=date_add(huankuanri,interval 1 month)"; 
 int n=statement.executeUpdate(sql1);
 if(n==0)
 {
 out.print("超出最大额度！");
 }
 else
 {
 int n2=statement.executeUpdate(sql3);
 int n4=statement.executeUpdate(sql4);
 int n5=statement.executeUpdate(sql5);
 out.print("更新成功");
  }
  }
  
  else { out.print("该银行卡不存在"); }
 
    
    statement.close();
     statement1.close();
    conn.close();
   }catch(SQLException e)
{e.printStackTrace();}
 }
  else out.print("不是10位数字！");
 
}
else  out.print("首位数字不是2！");
   }
else  
   {
       out.print("格式错误！");
   }  

%>

    
        
        
    </body>
</html>
