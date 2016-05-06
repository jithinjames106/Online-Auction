<%-- 
    Document   : Profile
    Created on : Nov 17, 2015, 4:44:44 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="Cuslist" class="MyPack.myprofile" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
        <script>
            
            function edit(){
               // alert ("adas");
                 document.getElementById('content').id = 'content_a';
                document.getElementById('content1').id = 'content1_a';
            }
            function b(){
               
                document.getElementById('content_a').id = 'content';
                document.getElementById('content1_a').id = 'content1'; 
                return false;
            }
        </script>
    </head>
    <body>
             <div style="height:auto;">
            <%@include file="header.jsp"%>
            <div style="clear:both; ">.</div>
            <div id="container">
<!--                <div id="menu1">
                    <ul>
                        <li><a href="viewitems">HOME</a></li>
                        <li><a href="myprofile">Profile</a></li>
                        <li><a href="newItemServ">Add Auction Items</a></li>
                        <li><a href="AcqAuction">Acquired Auctions</a></li>
                        <li><a href="youritems">Items in Auctions</a></li>
                        <li><a href="CustomerQuit">Leave from BidNShop</a></li>

                    </ul>
                </div>-->
                <div id="content" style="height:600px;margin:70px 0px 0px 300px">
                    <h1 style="color:#4a8fff ">Profile</h1>
                    <table style='padding: 40px;margin:0px 0px 0px 90px;'>
                        <tr><td>First Name:</td><td>${ob.fname}</td></tr>
                     <tr><td>Last Name:</td><td>${ob.lname}</td></tr>
                     <tr><td>Address:</td><td>${ob.address}</td></tr>
                     <tr><td>Phone No:</td><td>${ob.phno}</td></tr>
                     <tr><td></td><td><button onclick="edit();">EDIT</button></td></tr>
                    </table>
                </div>
                <div id="content1" style="height:600px;margin:50px 0px 0px 300px" >
                    <h1 style="color:#4a8fff" >Profile Edit</h1>
                    <form action="updateprofile" method="post">
                        <table>
                            <tr>
                                <td>First Name</td>
                                <td><input type="text" value="${ob.fname}" name="fname"/></td>
                            </tr>
                            <tr>
                                <td>Last Name</td>
                                <td><input type="text" value="${ob.lname}" name="lname"/></td>
                            </tr>
                            
                            <tr>
                                <td>Address</td>
                                <td><textarea name="address" >${ob.address}</textarea></td>
                            </tr>
                            <tr>
                                <td>Phone Number</td>
                                <td><input type="text" value="${ob.phno}" name="phno"/></td>
                            </tr>
                            
                            <tr>
                                <td>
                                    
                                </td>
                                <td><input type="submit" value="UPDATE"/></td>
                            </tr>
                        </table>
                    </form>
                    <button style='margin-left:105px;width:300px' onclick="b();">CANCEL</button>
        
        
        
                </div>
            </div>
             </div>
                 <div id="footer">
                kyhgkj
            </div>
    </body>
</html>
