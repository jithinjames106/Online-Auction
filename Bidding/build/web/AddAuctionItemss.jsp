<% System.out.println("inside addauctionitems.jsp");
     if(session.getAttribute("email")==null){
        response.sendRedirect("home.jsp");
        
        }
        if(session.getAttribute("regid")==null){
         response.sendRedirect("home.jsp");
        }
      
            
            
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="Catlist" class="MyPack.newItemServ" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
        <script type="text/javascript">
            
            function validation()
            {
               
            var itemname= document.getElementById("itemname");
            var itemprice= document.getElementById("itemprice");
            var date= document.getElementById("itemdate");
            var time= document.getElementById("itemtime");
            //var file= document.getElementsByName("file");
            if(itemname.value==null ||itemname.value==""||itemprice.value==null||itemprice.value==""||date.value==null||date.value==""||time.value==""||item.value==null)
            {
             document.getElementById("error").innerHTML="Please enter the fields completly.";
             return false;
            }
            }
        </script>
    </head>
    <body>
       

        <%@include file="header.jsp"  %>
        <div style="clear:both; ">.</div>
        <div id="container">
<!--            <div id="menu1">
                <ul>
                 <li><a href="viewitems">HOME</a></li>
                        <li><a href="myprofile">Profile</a></li>
                        <li><a href="newItemServ">Add Auction Items</a></li>
                        <li><a href="AcqAuction">Acquired Auctions</a></li>
                        <li><a href="youritems">Items in Auctions</a></li>
                        <li><a href="CustomerQuit">Leave from BidNShop</a></li>
                </ul>
            </div> -->
            <div class="formcontent">
                <h2 style="color: #0088ff">Add Auction Items</h2>
                
                <p id="error"></p>
                <form method="post" action="NewProductServlet"  enctype="multipart/form-data" onsubmit="return validation();">
<!--                    action is NewProductServlet,since url mapping in web.xml is give accordingle-->

                    <table style="margin-top:20px;margin-left:200px;">
                        <tr>
                            <td>CATEGORY</td>
                            <td>
                                <select id="selectedRecord" name="selectedRecord">
                                    <c:forEach var="item" items="${bt}">
                                        <option value="${item.id}">${item.title}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>NAME</td>
                            <td><input type="text" name="itemname"  placeholder="Name" id="itemname"/></td>
                        </tr>
                        <tr>
                            <td>PRICE</td>
                            <td><input type="number" name="itemprice" placeholder="Price" id="itemprice"/></td>
                        </tr>
                        <tr>
                            <td>DATE</td><td><input type="date" name="itemdate" id="itemdate" /></td>
                        </tr>
                        <tr>
                            <td>TIME</td><td><input type="time" name="itemtime" id="itemtime" /></td>
                        </tr>
                        <tr>
                            <td>Upload Image</td>
                            <td><input type="file" name="file"  /></td>
                        </tr>

                        <tr>
                            <td></td>
                            <td><input type="submit" value="Add"/></td>
                        </tr>
                    </table>
                </form>

            </div> 


        </div>




    </body>
</html>
