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
        <h1>信用还款！</h1>


        <%
            String x1 = request.getParameter("a3");
            session.setAttribute("kahao1", x1);
            // String x2=request.getParameter("a4");

            if ((!x1.equals(""))) {
                if (x1.startsWith("2")) {
                    if (x1.length() == 10) {

                        String driverName = "com.mysql.jdbc.Driver";
                        try {
                            Class.forName(driverName);
                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                        }

                        String url = "jdbc:mysql://127.0.0.1:3306/liuyang?user=root&password=19960822&characterEncoding=utf-8";

                        try {
                            Connection conn = DriverManager.getConnection(url);

                            Statement statement = conn.createStatement();
                            Statement statement1 = conn.createStatement();
                            Statement statement2 = conn.createStatement();
                            String sql2 = "select * from xinyongka where kahao='" + x1 + "' ";
                            ResultSet rs2 = statement1.executeQuery(sql2);
                            if (rs2.next()) {

                                String sql1 = "select * from xinyongka where kahao='" + x1 + "' ";
                                ResultSet rs = statement1.executeQuery(sql1);
                                out.println("<br>" + "信用卡情况：");
        %>

        <%
            out.print("</tr>");
            while (rs.next()) {
                out.print("<tr>");

                int b = rs.getInt("keyongyue");
                int c = rs.getInt("xinyongedu");

                out.print("<br>");
                out.print("剩余应还：");
                out.print(c - b);
                out.print("元");
            }


        %>



        <%--       String sql3=" select xiaofeiedu,datediff(huankuanri,now()) from xiaofeibiao where kahao='" +x1+"' ";
         ResultSet rs3=statement2.executeQuery(sql3);  
        //out.println("<br>"+"信用卡情况：");
       %>

 <%
   
     
        while(rs3.next())
    {     

   int d=rs3.getInt("datediff(huankuanri,now())");
   int e=rs3.getInt("xiaofeiedu");      
   out.print("<br>");
   out.print(e);
         out.print("元距离还款日还剩");
        out.print(d);
       out.print("天");
     }
  
  
        --%>    

        <%                      } else {
                                out.print("该银行卡不存在");
                            }

                            statement.close();
                            statement1.close();
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    } else
                        out.print("不是10位数字！");

                } else
                    out.print("首位数字不是2！");
            } else {
                out.print("格式错误！");
            }
      // <input type="button" name="submit" onclick="window.location.href('zuidihuankuan.jsp')"value="选择最低还款">  
        %>


             <form action="huankuan4.jsp"method="post"name="frmmain">

            请输入还款的额度：    
            <input type="text" name="a4"/>
            <br>

            <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/>
        </form>   




        <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="javascript:history.back(-1);"value="返回上一页">  
        <input type="button" name="submit" style= "background-color: transparent;font-size:16px;height:50px;width:200px " onclick="window.location.href('zuidihuankuan.jsp')"value="选择最低还款">  
    </body>
</html>
