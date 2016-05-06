<%-- 
    Document   : acquired_auction
    Created on : Nov 25, 2015, 1:04:13 PM
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
         <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <jsp:useBean id="Catlist" class="MyPack.AcqAuction" scope="page" />
    </head>
    <body>
        <div style="height:auto;" id="contain">

            <%@include file="header.jsp"%>
             <div style="clear:both; ">.</div>
            <div id="container">

                <div id="content" style="min-height:600px; " >
                    
                      <c:if test="${fn:length(bt) <= 0}">
                          <center><p>Currently No  Item Available</p></center>
            </c:if>
                    <c:forEach var="item" items="${bt}">
                        <div style="margin:20px; width:400px; padding: 25px;float:left; ">
                            <div >

                                <img src="upimage/${item.img}" style="margin:20px;height:80px; width:80px;"/>
                            </div>                       
                            <div>
                            
                                <p class=""><span id="auc_time">Product : ${item.product_name} </span></p>   
                                <p class=""><span id="auc_time">Amount : ${item.bidamount} </span></p>
                                    <p class=""><span id="auc_time">Date: ${item.bidDate} </span></p>
                                <p class=""><span id="auc_time">  <b>Owner Details</b> </span></p>
                                <p class=""><span id="time">Name : ${item.fname} ${item.lname}</span></p>

                                <p class="">  <span id="auc_date">Address : ${item.address} </span></p>
                                <p class=""><span id="auc_time">Phone No: ${item.phno} </span></p>



                            </div>
                        </div>
                    </c:forEach></div>
               
            </div>
             <div id="footer">
                    <%@include file="footer.jsp" %>
                </div>
        </div>
    </body>
</html>
