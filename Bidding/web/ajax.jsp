<%-- 
    Document   : ajax
    Created on : Nov 19, 2015, 5:41:49 PM
    Author     : User
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="MyPack.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>

        <%
            String itemid = request.getParameter("val");
            DBConnection db = new DBConnection();
            int flag = 0, flag1 = 2;
        %>

        <%
            if (itemid != null) {

                String sql = "select bid_amount from tb_auction where item_id='" + itemid + "' and bid_amount=(select max(bid_amount) from tb_auction where item_id='" + itemid + "')";
                ResultSet rs = db.FetchData(sql);
                if(rs.next()) {

        %>
        <p><%=rs.getFloat(1)%></p>        
        <%
                }
               
                String sql1 = "select * from tb_auction_items where item_id='" + itemid + "' and timediff(now(),concat(open_date ,' ' , open_time))> '00:05:00'";
                ResultSet res1 = db.FetchData(sql1);
                if (res1.next()) {
                    String sql2 = "select * from tb_auction where item_id='" + itemid + "' and bid_amount=(select max(bid_amount) from tb_auction where item_id='" + itemid + "')";
                    ResultSet res2 = db.FetchData(sql2);//open
                    if (res2.next()) {
                        // String sqlq = "select * from tbl_winners where auction_id=" + res2.getInt("auc_id");
                        String sqlq = "select * from tbl_winners where item_id=" + itemid;
                        System.out.println(sqlq);
                        ResultSet ckhrex = db.FetchData(sqlq);
                        if (!ckhrex.next()) {
                            String sql3 = "insert into tbl_winners(auction_id,item_id) values(" + res2.getInt("auc_id") + "," + itemid + ")";
                            db.UpdateQuery(sql3); //open con1
                             //close con1
                            flag = 1;
                            String sql4="update tb_auction_items set auction_status=2 where item_id='" + itemid + "'";
                            
                            db.UpdateQuery(sql4); //open con1
                            
                        }
                         db.Close();
                    } 
 //                       else {
////                        if (flag1 == 0) {
//                             System.out.println("update tb_auction_items");
//                            String myTime = res2.getString("open_time");
//                            SimpleDateFormat df = new SimpleDateFormat("HH:mm");
//                            Date d = df.parse(myTime);
//                            Calendar cal = Calendar.getInstance();
//                            cal.setTime(d);
//                            cal.add(Calendar.MINUTE, 5);
//                            String newTime = df.format(cal.getTime());
//                            String sql3 = "update tb_auction_items set open_time='" + newTime + "' where item_id=" + itemid;
//                            int row = db.UpdateQuery(sql3);//open con2
//                            db.Close(); //close con2
//                            flag1 = 1;
//                       // }
//                    }
                    db.Close();
                }

            }
        %>


    </body>
</html>
