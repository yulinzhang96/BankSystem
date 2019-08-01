

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>信用卡首页</title>
    </head>
    <body style="background:url(Image/qinglake.jpg);background-size:cover;">
        <b>
            <font face="隶书" size="6">信用卡业务主界面</font>
        </b>
        <hr>
        <table border="1" width="100%">

            <form action="" method="post" name="frmmain" >
                <input type="radio"name="anwser2" value="1">开卡
                <br>
                <input type="radio"name="anwser2" value="6">调整信用额度
                <br>
                <input type="radio"name="anwser2" value="2">刷卡消费
                <br>
                <input type="radio"name="anwser2" value="3">预借现金
                <br>
                <input type="radio"name="anwser2" value="4">信用还款
                <br>
                <input type="radio"name="anwser2" value="5">网上月结单查询
                <br>
                <input type="submit" value="确定" style= "background-color: transparent;font-size:16px;height:50px;width:200px ">
            </form>

            <%
                String gongneng = request.getParameter("anwser2");

                if (gongneng != null) {
                    if (gongneng.equals("1")) {
                        //  out.print("你好！");
            %>
            <jsp:forward page="kaika.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
            } else if (gongneng.equals("2")) {
            %>
            <jsp:forward page="xiaofei.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
            } else if (gongneng.equals("3")) {
            %>
            <jsp:forward page="yujie.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
            } else if (gongneng.equals("4")) {
            %>
            <jsp:forward page="huankuan.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
            } else if (gongneng.equals("5")) {
            %>
            <jsp:forward page="chaxun.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
            } else if (gongneng.equals("6")) {
            %>
            <jsp:forward page="xinyongedu.jsp">
                <jsp:param name="" value=""/>
            </jsp:forward>
            <%
                    }

                }
            %>
            <form action="index.jsp" target="_self">
                <p><input type="submit" value="退出登录" style= "background-color: transparent;font-size:16px;height:50px;width:200px "/></p>
            </form>

    </body>
</html>
