<%-- 
    Document   : yourAuc_items
    Created on : Nov 19, 2015, 12:51:58 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="Catlist" class="MyPack.youritems" scope="page" />
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    </head>
    <body>

        <div style="height:auto;" id="contain">

            <%@include file="header.jsp"%>
            <div style="clear:both; ">.</div>
            <div id="container">
                
                <div id="content" style="min-height:600px;" >
                    <h2>YOUR ITEMS >></h2>
                        <c:if test="${fn:length(bt) <= 0}">
                        <center><p>Currently No  Items Available</p></center>
                        </c:if>
                        <c:forEach var="item" items="${bt}">
                        <div style="margin:50px 50px 50px 80px; width:400px; float:left;">
                            <div style="margin-left:00px;">
                                <p style="color: #0088ff;font-size:20px;"><b>${item.pname}</b> </p>
                                <img src="upimage/${item.img}" style="margin:20px 20px 20px 70px;height:80px; width:80px;"/>


                                <p class=""><span>Minimum Bid Amount :- </span><span style="" >${item.price} </span></p>
                                <p class=""> <span >AUCTION DATE :-</span> <span id="auc_date">${item.date} </span></p>

                                <p class=""><span >AUCTION TIME :- </span><span id="auc_time">${item.time} </span></p>
            <!--                    <p>${item.catObj.id} </p>-->
                            </div>
                            <form action="biddata" method="post">
                                <input type="text" name="itemid" value="${item.item_id}"  hidden/>


                                <br>
                                <!--                                <input type="submit" name="bid" value="Block"  />-->
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div id="footer">

        </div>
    </body>
</html>
