<%-- 
    Document   : ajaxbidreset
    Created on : Nov 21, 2015, 3:29:49 PM
    Author     : User
--%>

<%@page import="MyPack.DBConnection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            DBConnection db = new DBConnection();
            System.out.println("update tb_auction_items");  
          //  String sql3 = "update tb_auction_items set open_time =addtime(open_time,'00:05:00') where concat(open_date ,' ' , open_time) < now() and auction_status=0";
            String sql3 = "update tb_auction_items set open_time =addtime(CURTIME(),'00:00:01'),open_date=curdate() where  timediff(now(),concat(open_date ,' ' , open_time))> '00:05:00' and auction_status=0";
// String sql3 = "update tb_auction_items set open_time =addtime(CURTIME(),'00:05:00'),open_date=curdate() where  timediff(now(),concat(open_date ,' ' , open_time))> '00:05:00' and auction_status=0;";
              System.out.println(sql3);  
             int row = db.UpdateQuery(sql3);//open con2
            db.Close(); //close con2


        %>
    </body>
</html>

