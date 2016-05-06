  <%String email=(String)session.getAttribute("email"); 
    if(email!=null){ %>
       
            
 

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
            <div style="width:1550px;">
            <div class="title" style="width:300px; height:200px;float:left">
                <img src="images/bid.jpg" style="height:200px;"/> 
            </div>


            <div id="header1" style="width:900px; height:200px;float:left">
                <div  id="top1" style="margin-left:600px;font-size:18px; width:300px; height:100px;">
<!--                    <a href="Registration.jsp">SignUp</a>-->
<span style="color: #ffffff;font-size:16px">Welcome,<%=email %></span>
 <% } %>
                    <span style="min-width:30px;"></span>
                    <a href="logout">logout</a>

                </div>

                <div id="slidecontainer" style="width:800px; height:100px; ">
                    <div id="menu1">
                        <ul>
                             <li><a href="viewitems">HOME</a></li>
                        <li><a href="myprofile">My Profile</a></li>
                        <li><a href="newItemServ">Products</a></li>
                        <li><a href="AcqAuction">Results</a></li>
                        <li><a href="youritems">Items</a></li>
                       <li><a href="AddCategory.jsp">Add category</a></li>

                        </ul>
                    </div>
                    <!--            <div id="slider">
                    
                    
                                </div>-->
                </div>
            </div>
            <div id="container">
                <div id="menu1" style="height:860px;">
                    <ul>
<!--                        <li><a href="AddCategory.jsp">Add category</a></li>                  -->

                  </ul>
                </div>
                
                <div id="content1"  >
                    
        .
        
        
                </div>
            </div>
             </div>
                 <div id="footer">
                kyhgkj
            </div>
            
    </body>
</html>
