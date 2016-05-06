<%-- 
    Document   : home
    Created on : Nov 4, 2015, 4:59:29 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <jsp:useBean id="Catlist" class="MyPack.FirstServlet" scope="page" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="engine1/style.css" />
        <script type="text/javascript" src="engine1/jquery.js"></script>
        <script type="text/javascript" src="engine1/wowslider.js"></script>
        <script type="text/javascript" src="engine1/script.js"></script>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
        <script type="text/javascript">

            function loginwarning() {
                alert("You have to Login First!!");
            }

        </script>

        <style>
            #menu1 ul li{
                float:left;
                margin:0px 0px 0px 30px; 
                padding-top:10px;
                border-radius:10px;
            }
            #menu1 ul li a{
                text-decoration:none;
                font-size:25px;
            }
            #menu1 ul{
                list-style: none;
            }
            #menu1 ul li:hover{
                //background-image: url("images/moduleheaders.jpg");
                height:41px;
                color:red;
            }
            #header1{
                background-image: url("images/headerbackground.png");
            }
        </style>
    </head>
    <body >
        <!--        <div id="top">
                    <h1 id="top1" style="color:  #ffffff">
        
                        <a href="Registration.jsp">New User??  SignUp</a>
                        <span style="min-width:30px;"></span>
                        <a href="login.jsp">login</a>
                    </h1> 
                </div>-->
        <!--/////////////////////////////header starts//////////////////////////////////////////////////////////////-->
        <div style="width:1550px;">
            <div class="title" style="width:300px; height:200px;float:left">
                <img src="images/bid.jpg" style="height:200px;"/> 
            </div>


            <div id="header1" style="width:900px; height:200px;float:left">
                <div  id="top1" style="margin-left:600px;font-size:18px; width:300px; height:100px;">
                    <a href="Registration.jsp">  SignUp</a>
                    <span style="min-width:30px;"></span>
                    <a href="login.jsp">login</a>

                </div>

                <div id="slidecontainer" style="width:800px; height:100px; ">
                    <div id="menu1">
                        <ul>
                            <li><a href="First">Home</a></li>
                            <li><a href="#">About us</a></li>

                        </ul>
                    </div>
                    <!--            <div id="slider">
                    
                    
                                </div>-->
                </div>
            </div>

        </div>




        <div style="clear:both; ">
            .   
        </div>

        <!--/////////////////////////////header ends//////////////////////////////////////////////////////////////-->
        
       
        
        <div id="contentFront" style="padding-top: 10px;width:1250px; ; ">
            <%
                if (request.getParameter("msg") != null) {
                    String res = request.getParameter("msg");
            %>
            <center>   <p id="message"  style="font-weight: bold;color: #0088ff;"><%=res%></p></center>
                <%
                    }
                %>
            <h3 style="margin:50px 0px 0px 20px;background-color: #4a8fff;color: #ffffff"> Live Auctions</h3>
<!--            <hr>-->

            <c:if test="${fn:length(bt) <= 0}">
                <p style="margin:20px 0px 0px 50px;">Currently No  Auctions</p>
            </c:if>
            <c:forEach var="item" items="${bt}">
                <a href="" onclick="loginwarning();"> 
                    <div class="blocks1">
                        
                        <img src="upimage/${item.img}" class="imgg" />
                        <center><p style="color: #1a74f4;font-size:20px;height:50px"><b>${item.pname}</b> </p></center>
<!--                        <hr style="color: #0088ff">-->

                        <p style="">MINIMUM PRICE:-${item.price} </p>
                        <p>AUCTION DATE:-${item.date} </p>
                        <p>START TIME:-${item.time} </p>
    <!--                    <p>${item.catObj.id} </p>-->


                    </div>
                </a>

            </c:forEach>
            <div id="blocks">

                <div id="timer"></div>               
            </div>

            <br/>
            <br/>
            <div style="clear: left"></div>
            
            
            <h3 style="margin:100px 0px 0px 20px ;background-color: #4a8fff;color: #ffffff"> Completed Auctions</h3>
<!--            <hr/>-->
            <c:if test="${fn:length(bt1) <= 0}">
                <p style="margin:20px 0px 0px 50px;">No auction currently completed</p>
            </c:if>
            <c:forEach var="item" items="${bt1}">
                <div class="blocks1"  >
                    
                    <img src="upimage/${item.img}" class="imgg"/>
                    <center><p style="color: #1a74f4;font-size:20px;height:50px"><b>${item.pname}</b> </p></center>
<!--                    <hr style="color:#0088ff">-->

<!--                    <p style="background-color: #f9e91c">MINIMUM PRICE:-${item.price} </p>
                    <p>AUCTION DATE:-${item.date} </p>
                    <p>START TIME:-${item.time} </p>-->
<!--                    <p>${item.catObj.id} </p>-->


                </div>

            </c:forEach>
        </div>
            
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
