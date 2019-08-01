package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.*;

public class ConnDB {

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/liuyang";
    public static final String DBUSER = "root";
    public static final String DBPASS = "19960822";

    public void first() {
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
            /*String sql = "SELECT sno FROM student" ;
	    pstmt = conn.prepareStatement(sql) ;
	    rs = pstmt.executeQuery() ;*/
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void end() {
        try {
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean changePassword(String id, String old_password, String new_password) {
        try {
            String pass = null;
            String sql = "select password from card where id=" + "'" + id + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next() == false) {
                return false;
            } else {
                pass = rs.getString("password");
                if (!pass.equals(old_password)) {
                    return false;
                }
            }
            sql = "update card  set password=" + "'" + new_password + "'" + "where id=" + "'" + id + "'";
            //System.out.println(sql);  
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public Card getStudentGrade(String s) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "select * from card where number=" + "'" + s + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Card user = null;
            while (rs.next()) {
                user = new Card();
                user.id = rs.getString("id");
                //System.out.println(rs.getString("cno"));  
                user.name = rs.getString("name");
                //System.out.println(rs.getString("cname"));  
                user.number = rs.getString("number");
                user.address = rs.getString("address");
                user.phone = rs.getString("phone");
                user.password = rs.getString("password");
                user.loss = rs.getString("loss");
                user.close = rs.getString("close");
                return user;
            }
            return null;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public void addBill(String id, String subnumber, String money, String moneytype, String savetype, String time, String type) {
        try {
            String sql = "INSERT INTO bill(id,subnumber,money,moneytype,savetype,time,type) VALUES(" + "'" + id + "'" + "," + "'" + subnumber + "'" + "," + "'" + money + "'" + "," + "'" + moneytype + "'" + "," + "'" + savetype + "'" + "," + "'" + time + "'" + "," + "'" + type + "'" + ")";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public boolean checkPassword(String id, String password) {
        try {
            String pass = null;
            String sql = "select password from card where id=" + "'" + id + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next() == false) {
                return false;
            } else {
                pass = rs.getString("password");
                if (pass.equals(password)) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public Card getStudentGrade_id(String id) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "select * from card where id=" + "'" + id + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Card user = null;
            while (rs.next()) {
                user = new Card();
                user.id = rs.getString("id");
                //System.out.println(rs.getString("cno"));  
                user.name = rs.getString("name");
                //System.out.println(rs.getString("cname"));  
                user.number = rs.getString("number");
                user.address = rs.getString("address");
                user.phone = rs.getString("phone");
                user.password = rs.getString("password");
                user.loss = rs.getString("loss");
                user.close = rs.getString("close");
                user.subnumber = rs.getString("subnumber");
                return user;
            }
            return null;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public boolean bubanCard(String number, String now_time) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            Card c = getStudentGrade(number);
            if (c.loss.equals("0")) {
                return false;
            }
            String time = null;
            String sql = "select time from loss_time where number=" + "'" + number + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                time = rs.getString("time");
                String month = time.substring(4, 6);
                String day = time.substring(6);
                String month1 = now_time.substring(4, 6);
                String day1 = now_time.substring(6);
                int t = Integer.parseInt(month) * 30 + Integer.parseInt(day);
                int t1 = Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                if (t1 - t > 7) {
                    sql = "delete from loss_time where number=" + "'" + number + "'";
                    pstmt = conn.prepareStatement(sql);
                    int i = pstmt.executeUpdate();
                    if (i != 1) {
                        return false;
                    }
                    sql = "update card set loss=" + "'" + "0" + "'" + "where number=" + "'" + number + "'";
                    pstmt = conn.prepareStatement(sql);
                    i = pstmt.executeUpdate();
                    if (i != 1) {
                        return false;
                    }
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public boolean changeLoss(String s, String u) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "update card  set loss=" + "'" + u + "'" + "where id=" + "'" + s + "'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public boolean changeLoss1(String s, String u) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "update card  set loss=" + "'" + u + "'" + "where number=" + "'" + s + "'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }

    public boolean changeClose(String s) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "update card  set close=" + "'" + "1" + "'" + "where id=" + "'" + s + "'";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }
     public boolean isClose(String id) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "select close  from card where id=" + "'" + id+ "'";
           // System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                String s=rs.getString("close");
                if(s.equals("1")){
                    return true;
                }
                if(s.equals("0")){
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }
     public boolean isLoss(String id) {
        //boolean b=existSno(s);
        //if(b==false){return null;}
        try {
            String sql = "select loss  from card where id=" + "'" + id+ "'";
           // System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                String s=rs.getString("loss");
                if(s.equals("1")){
                    return true;
                }
                if(s.equals("0")){
                    return false;
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;
    }
    public String addCardInformation(String name, String number, String address, String phone, String password) {
        //boolean b=existSno(sno);
        //if(b==true){return false;}
        try {
            String sql = "select current from card_number";
            Long num = null, num1 = null;
            //String sql = "INSERT INTO card(id,name,number,address,sage) VALUES("+"'"+sno+"'"+","+"'"+sname+"'"+","+"'"+ssex+"'"+","+"'"+sdept+"'"+","+"'"+sage+"'"+")";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                num = rs.getLong("current");
                //System.out.println(num);  
            }
            num1 = num + 1;
            sql = "update card_number set current=" + "'" + num1.toString() + "'" + "where current=" + "'" + num.toString() + "'";
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            String id = num.toString();
            sql = "INSERT INTO card(id,name,number,address,phone,password,loss,close,subnumber) VALUES(" + "'" + id + "'" + "," + "'" + name + "'" + "," + "'" + number + "'" + "," + "'" + address + "'" + "," + "'" + phone + "'" + "," + "'" + password + "'" + "," + "'" + "0" + "'" + "," + "'" + "0" + "'" + "," + "'" + "0" + "'" + ")";
            pstmt = conn.prepareStatement(sql);
            i = pstmt.executeUpdate();
            if (i == 1) {
                return id;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public String getHuoQiMoney(String id, String subnumber, String num, String time) {
        try {
            String sql = "select * from account where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
            String t = null, moneytype = null, savetype = null;
            double lv = getHuoQiRate();
            float nextyear1;
            double money;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                t = rs.getString("time");
                nextyear1 = rs.getFloat("nextyear");
                money = rs.getDouble("money");
                moneytype = rs.getString("moneytype");
                savetype = rs.getString("savetype");
                double money1 = Double.parseDouble(num);
                if (money < money1) {
                    return "您的活期账户余额不足!";
                }
                String year = t.substring(0, 4);
                String month = t.substring(4, 6);
                String day = t.substring(6);
                String year1 = time.substring(0, 4);
                String month1 = time.substring(4, 6);
                String day1 = time.substring(6);
                int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
                //System.out.println(tt);  
                int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                //System.out.println(tt1);  
                //利率	          	
                double sum = money1 * lv * (tt1 - tt) / 360;
                sum = sum + nextyear1;
                //System.out.println(String.format("%.2f", sum));  
                money = money - money1;
                addBill(id, subnumber, num, moneytype, savetype, time, "0");
                sql = "update account set money=" + "'" + String.format("%.2f", money) + "'" + "," + "nextyear=" + "'" + String.format("%.2f", sum) + "'" + "," + "time=" + "'" + time + "'" + "where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                //System.out.println(sql);  
                pstmt = conn.prepareStatement(sql);
                int i = pstmt.executeUpdate();
                if (i == 1) {
                    return "success!";
                } else {
                    return "not success!";
                }
            } else {
                return "抱歉，没有找到对应活期储蓄子账户!";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public String getZhengCunMoney(String id, String subnumber, String num, String time) {
        try {
            // System.out.println("111");  
            String sql = "select * from advance where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return "您的该整存整取账号已经预支过一次!";
            }
            double lv = getHuoQiRate();
            //  System.out.println("222");  
            sql = "select * from account where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
            String t = null, moneytype = null, savetype = null;
            float nextyear1;
            double money;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                t = rs.getString("time");
                nextyear1 = rs.getFloat("nextyear");
                money = rs.getDouble("money");
                moneytype = rs.getString("moneytype");
                savetype = rs.getString("savetype");
                double money1 = Double.parseDouble(num);
                if (money < money1) {
                    return "您的整存整取账户余额不足!";
                }
                String year = t.substring(0, 4);
                String month = t.substring(4, 6);
                String day = t.substring(6);
                String year1 = time.substring(0, 4);
                String month1 = time.substring(4, 6);
                String day1 = time.substring(6);
                int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
                //System.out.println(tt);  
                int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                //System.out.println(tt1);  
                //利率
                double sum = money1 * lv * (tt1 - tt) / 360;
                sum = sum + nextyear1;
                //System.out.println(String.format("%.2f", sum));  
                money = money - money1;
                addBill(id, subnumber, num, moneytype, savetype, time, "0");
                // System.out.println("333");  
                sql = "update account set money=" + "'" + String.format("%.2f", money) + "'" + "," + "nextyear=" + "'" + String.format("%.2f", sum) + "'" + "," + "time=" + "'" + time + "'" + "where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                //System.out.println(sql);  
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();
                sql = "INSERT INTO advance (id,subnumber)values(" + "'" + id + "'" + "," + "'" + subnumber + "'" + ")";
                //System.out.println(sql);  
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();
                return "success!";
            } else {
                return "抱歉，没有找到对应整存整取储蓄子账户!";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public String getDingHuoMoney(String id, String subnumber, String time) {
        try {
            String sql = "select * from account where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
            String t = null, moneytype = null, savetype = null;
            float nextyear1;
            double money;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                t = rs.getString("time");
                nextyear1 = rs.getFloat("nextyear");
                money = rs.getDouble("money");
                moneytype = rs.getString("moneytype");
                savetype = rs.getString("savetype");
                String year = t.substring(0, 4);
                String month = t.substring(4, 6);
                String day = t.substring(6);
                String year1 = time.substring(0, 4);
                String month1 = time.substring(4, 6);
                String day1 = time.substring(6);
                int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
                //System.out.println(tt);  
                int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                //System.out.println(tt1);  
                //利率
                double lv = 0;
                if (tt1 - tt >= 360) {
                    lv = getZhengOneRate();
                    lv = lv * 0.6;
                }
                if (tt1 - tt < 360) {
                    lv = getHuoQiRate();
                }
                double sum = money * lv * (tt1 - tt) / 360;
                sum = sum + nextyear1;
                //System.out.println(String.format("%.2f", sum));  
                money = money + sum;
                addBill(id, subnumber, String.format("%.2f", money), moneytype, savetype, time, "0");
                sql = "delete from account where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                //System.out.println(sql);  
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();
                return "取款成功，取得本金加利息总共:" + String.format("%.2f", money);
            } else {
                return "抱歉，没有找到对应定活两便储蓄子账户!";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public ArrayList<Account> getMoney(String id, String moneytype, String type, String time) {
        try {
            String sql = "select * from account where id=" + "'" + id + "'" + "and savetype=" + "'" + type + "'" + "and moneytype=" + "'" + moneytype + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            ArrayList<Account> ar = new ArrayList<Account>();
            Account ac = null;
            while (rs.next()) {
                ac = new Account();
                ac.id = rs.getString("id");
                ac.money = rs.getString("money");
                ac.subnumber = rs.getString("subnumber");
                ac.moneytype = rs.getString("moneytype");
                ac.savetype = rs.getString("savetype");
                ac.time = rs.getString("time");
                ar.add(ac);
            }
            return ar;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public Account getMoney1(String id, String moneytype, String type, String time) {
        try {
            String sql = "select * from account where id=" + "'" + id + "'" + "and savetype=" + "'" + type + "'" + "and moneytype=" + "'" + moneytype + "'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            Account ac = null;
            if (rs.next()) {
                ac = new Account();
                ac.id = rs.getString("id");
                ac.money = rs.getString("money");
                ac.subnumber = rs.getString("subnumber");
                ac.moneytype = rs.getString("moneytype");
                ac.savetype = rs.getString("savetype");
                ac.time = rs.getString("time");
            }
            return ac;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public double getHuoQiRate() {
        try {
            String sql = "select currentrate from alldata";
            //String sql = "INSERT INTO card(id,name,number,address,sage) VALUES("+"'"+sno+"'"+","+"'"+sname+"'"+","+"'"+ssex+"'"+","+"'"+sdept+"'"+","+"'"+sage+"'"+")";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("currentrate");
                //System.out.println(num);  
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0.1;
    }

    public double getZhengOneRate() {
        try {
            String sql = "select regularrate1 from alldata";
            //String sql = "INSERT INTO card(id,name,number,address,sage) VALUES("+"'"+sno+"'"+","+"'"+sname+"'"+","+"'"+ssex+"'"+","+"'"+sdept+"'"+","+"'"+sage+"'"+")";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("regularrate1");
                //System.out.println(num);  
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0.1;
    }

    public double getZhengFiveRate() {
        try {
            String sql = "select regularrate5 from alldata";
            //String sql = "INSERT INTO card(id,name,number,address,sage) VALUES("+"'"+sno+"'"+","+"'"+sname+"'"+","+"'"+ssex+"'"+","+"'"+sdept+"'"+","+"'"+sage+"'"+")";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getDouble("regularrate5");
                //System.out.println(num);  
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0.1;
    }

    public String addHuoQiAccountInformation(String id, String num, String moneytype, String type, String time, String time0, String xucun) {
        try {
            String sql = "select * from account where id=" + "'" + id + "'" + "and savetype=" + "'" + "1" + "'" + "and moneytype=" + "'" + moneytype + "'";
            String subnumber = null, t = null;
            float nextyear1;
            double money;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                subnumber = rs.getString("subnumber");
                t = rs.getString("time");
                nextyear1 = rs.getFloat("nextyear");
                money = rs.getDouble("money");
            } else {
                Long num2 = null, num1 = null;
                sql = "select * from card where id=" + "'" + id + "'";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    num2 = rs.getLong("subnumber");
                }
                num1 = num2 + 1;
                sql = "update card set subnumber=" + "'" + num1.toString() + "'" + "where id=" + "'" + id + "'";
                pstmt = conn.prepareStatement(sql);
                pstmt.executeUpdate();
                String ss = num2.toString();
                if ((3 - ss.length()) == 1) {
                    ss = "0" + ss;
                } else if ((3 - ss.length()) == 2) {
                    ss = "00" + ss;
                }
                subnumber = moneytype + type + ss;
                String nextyear = "0.00";
                addBill(id, subnumber, num, moneytype, type, time0, "1");
                sql = "INSERT INTO account (id,subnumber,money,moneytype,savetype, time,nextyear,deadline,xucun,startdate)values(" + "'" + id + "'" + "," + "'" + subnumber + "'" + "," + "'" + num + "'" + "," + "'" + moneytype + "'" + "," + "'" + type + "'" + "," + "'" + time0 + "'" + "," + "'" + nextyear + "'" + "," + "'" + time + "'" + "," + "'" + xucun + "'" + "," + "'" + time0 + "'" + ")";
                pstmt = conn.prepareStatement(sql);
                int i = pstmt.executeUpdate();
                if (i == 1) {
                    return "success!";
                } else {
                    return "not success!";
                }
            }
            time = rs.getString("time");
            String year = t.substring(0, 4);
            String month = t.substring(4, 6);
            String day = t.substring(6);
            String year1 = time0.substring(0, 4);
            String month1 = time0.substring(4, 6);
            String day1 = time0.substring(6);
            int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
            System.out.println(tt);
            int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
            //System.out.println(tt1);  
            //利率
            double lv = getHuoQiRate();
            double sum = money * lv * (tt1 - tt) / 360;
            sum = sum + nextyear1;
            //System.out.println(String.format("%.2f", sum));  
            double sum1 = Double.parseDouble(num) + money;
            //System.out.println(String.format("%.2f", sum1));  
            //String.format("%.2f", sum);
            addBill(id, subnumber, num, moneytype, type, time0, "1");
            sql = "update account set money=" + "'" + String.format("%.2f", sum1) + "'" + "," + "nextyear=" + "'" + String.format("%.2f", sum) + "'" + "," + "time=" + "'" + time0 + "'" + "where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
            //System.out.println(sql);  
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return "success!";
            } else {
                return "not success!";
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return "not success!";

    }

    public String addAccountInformation(String id, String num, String moneytype, String type, String time, String time0, String xucun) {
        try {
            String sql = "select * from card where id=" + "'" + id + "'";
            String loss = null, subnumber;
            Long num2 = null, num1 = null;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                loss = rs.getString("loss");
                num2 = rs.getLong("subnumber");
            }
            if (loss.equals("1")) {
                return "the account is loss!";
            }
            num1 = num2 + 1;
            sql = "update card set subnumber=" + "'" + num1.toString() + "'" + "where id=" + "'" + id + "'";
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
            String ss = num2.toString();
            if ((3 - ss.length()) == 1) {
                ss = "0" + ss;
            } else if ((3 - ss.length()) == 2) {
                ss = "00" + ss;
            }
            subnumber = moneytype + type + ss;
            String nextyear = "0.00";
            addBill(id, subnumber, num, moneytype, type, time0, "1");
            sql = "INSERT INTO account (id,subnumber,money,moneytype,savetype, time,nextyear,deadline,xucun,startdate)values(" + "'" + id + "'" + "," + "'" + subnumber + "'" + "," + "'" + num + "'" + "," + "'" + moneytype + "'" + "," + "'" + type + "'" + "," + "'" + time0 + "'" + "," + "'" + nextyear + "'" + "," + "'" + time + "'" + "," + "'" + xucun + "'" + "," + "'" + time0 + "'" + ")";
            System.out.println(sql);
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();
            if (i == 1) {
                return "success!";
            } else {
                return "not success!";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "not success!";

    }

    public String calZhengCunLiXi(String time) {
        try {
            String sql = "select * from account where savetype=" + "'" + "2" + "'";
            String subnumber = null, id = null, time0 = null, deadline = null, xucun = null, moneytype = null, savetype = null;
            double nextyear, money, lv1, lv5;
            lv1 = getZhengOneRate();
            lv5 = getZhengFiveRate();
            String year1 = time.substring(0, 4);
            String month1 = time.substring(4, 6);
            String day1 = time.substring(6);
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                id = rs.getString("id");
                subnumber = rs.getString("subnumber");
                nextyear = rs.getFloat("nextyear");
                money = rs.getDouble("money");
                time0 = rs.getString("startdate");
                deadline = rs.getString("deadline");
                moneytype = rs.getString("moneytype");
                savetype = rs.getString("savetype");
                xucun = rs.getString("xucun");
                String year = time0.substring(0, 4);
                String month = time0.substring(4, 6);
                String day = time0.substring(6);
                int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
                int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                if ((tt1 - tt) != Integer.parseInt(deadline) * 360) {
                    continue;
                }
                //利率	        
                double lv = 0;
                if (deadline.equals("1")) {
                    lv = lv1;
                }
                if (deadline.equals("5")) {
                    lv = lv5;
                }
                //System.out.println("lv:");
                //System.out.println(lv);  
                int zheng = (int) money;
                double sum = zheng * lv * Integer.parseInt(deadline);
                sum = sum + nextyear;
                money = money + sum;
                if (xucun.equals("1")) {
                    sql = "update account set money=" + "'" + String.format("%.2f", money) + "'" + "," + "nextyear=" + "'" + "0.00" + "'" + "," + "startdate=" + "'" + time + "'" + "," + "time=" + "'" + time + "'" + "," + "deadline=" + "'" + "1" + "'" + "where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                    pstmt = conn.prepareStatement(sql);
                    int i = pstmt.executeUpdate();

                } else {
                    addHuoQiAccountInformation(id, String.format("%.2f", money), moneytype, savetype, "0", time, "0");
                    sql = "delete from account where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                    pstmt = conn.prepareStatement(sql);
                    int i = pstmt.executeUpdate();
                }

            }
            return "结息成功!";

        } catch (SQLException e) {
            System.out.println(e);
        }
        return "结息成功!";
    }

    public String calHuoQiLiXi(String time) {
        try {
            if (!time.substring(4).equals("0630")) {
                return "没到结息日!";
            } else {
                String sql = "select * from account where savetype=" + "'" + "1" + "'";
                String subnumber = null, id = null, time0 = null;
                double lv = getHuoQiRate();
                double nextyear, money;
                String year1 = time.substring(0, 4);
                String month1 = time.substring(4, 6);
                String day1 = time.substring(6);
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    id = rs.getString("id");
                    subnumber = rs.getString("subnumber");
                    nextyear = rs.getFloat("nextyear");
                    money = rs.getDouble("money");
                    time0 = rs.getString("time");
                    String year = time0.substring(0, 4);
                    String month = time0.substring(4, 6);
                    String day = time0.substring(6);
                    int tt = Integer.parseInt(year) * 360 + Integer.parseInt(month) * 30 + Integer.parseInt(day);
                    int tt1 = Integer.parseInt(year1) * 360 + Integer.parseInt(month1) * 30 + Integer.parseInt(day1);
                    if (tt1 - tt < 0) {
                        continue;
                    }
                    //利率	
                    //System.out.println(money);
                    //System.out.println("lv:");
                    //System.out.println(lv);  
                    double sum = money * lv * (tt1 - tt) / 360;
                    sum = sum + nextyear;
                    int zheng = (int) sum;
                    money = money + zheng;
                    sum = sum - zheng;//小数部分
                    sql = "update account set money=" + "'" + String.format("%.2f", money) + "'" + "," + "nextyear=" + "'" + String.format("%.2f", sum) + "'" + "," + "time=" + "'" + time + "'" + "where id=" + "'" + id + "'" + "and subnumber=" + "'" + subnumber + "'";
                    pstmt = conn.prepareStatement(sql);
                    int i = pstmt.executeUpdate();
                }
                return "结息成功!";
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return "结息成功!";
    }
    //记录card的id号

    public boolean addCard() {
        //boolean b=existSno(sno);
        //if(b==true){return false;}
        try {
            String sql = "select current from card_number";
            Long num = null, num1 = null;
            //String sql = "INSERT INTO card(id,name,number,address,sage) VALUES("+"'"+sno+"'"+","+"'"+sname+"'"+","+"'"+ssex+"'"+","+"'"+sdept+"'"+","+"'"+sage+"'"+")";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                num = rs.getLong("current");
                //System.out.println(num);  
            }
            num1 = num + 1;
            sql = "update card_number set current=" + "'" + num1.toString() + "'" + "where current=" + "'" + num.toString() + "'";
            pstmt = conn.prepareStatement(sql);
            int i = pstmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }
        return true;

    }

}
