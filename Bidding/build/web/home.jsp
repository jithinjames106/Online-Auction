<%-- 
    Document   : home
    Created on : Nov 4, 2015, 4:59:29 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
        <script src="ajaxcal.js" type="text/javascript"></script>
        
        <style>


        </style>
        <script>window.history.forward();</script>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="Catlist" class="MyPack.viewitems" scope="page" />
    </head>
    <body onload="ajaxbidreset();">

        <div style="height:auto;">
           <%@include file="header.jsp"%>
           <div style="clear:both; ">.</div>
            <div id="content" >
                <%
                    if (request.getParameter("msg") != null) {
                        String res = request.getParameter("msg");
                %>
                <p id="message"><%=res%></p>
                <%
                    }
                %>
                <p style="margin-left:20px;"> Live Auctions</p>
                <hr style="color: #cecece">
                <c:if test="${fn:length(bt) <= 0}">
                    <center><p>Currently No  Item Available</p></center>
                    </c:if>
                    <c:forEach var="item" items="${bt}">
                    <div class="blocks">
                        <center><p style="height:50px;color: #1a74f4;font-size:20px;"><b>${item.pname}</b> </p></center>
                        <hr style="color: #cecece">
                        <img src="upimage/${item.img}" style="margin:10px;height:190px; width:200px;"/>

                        <span>MINIMUM AMOUNT:- ${item.price} </span>
                        <p>AUCTION DATE:-${item.date} </p>
                        <p>START TIME:-${item.time} </p>
    <!--                    <p>${item.catObj.id} </p>-->
                        <form action="individualItems" method="post">
                            <input type="text" name="itemid" value="${item.item_id}" hidden/>
                            <input style="margin-left:30px;background-color:#4a8fff ;width:150px;" type="submit" value="VIEW"/>


                        </form>

                    </div>

                </c:forEach>








            </div>

            <div id="footer">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
