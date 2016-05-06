<%-- 
    Document   : login
    Created on : Nov 4, 2015, 4:47:03 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<link rel="stylesheet" href="mystyle.css" type="text/css"/>
    </head>
    <body>
        <!--<div style='height: 100px'></div>-->
         <%--<%@include file="header.jsp"  %>--%>
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
        <div id="container">
           <div id="menu1"></div> 
           <div class="formcontent">
               <h2 style="color: #0088ff; margin:300px 0px 0px 40px;">Login</h2>
           
               <form method="post" action="Customerlogin">
            <%
                if (request.getParameter("err") != null) {
            %>
            <p id="msg">Sorry An Error occurred in Login</p>
            <%
                }
            %>
            <table style="margin-top:0px;margin-left:200px;">

                <tr>
                    <td>Email</td><td><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td>Password</td><td><input type="password" name="pwd"></td>
                </tr>
                <tr>
                    <td></td><td><input type="submit" value="submit"></td>
                </tr>
                <tr>
                    <td></td><td><a href="Registration.jsp">not yet Registered??</a></td>
                </tr>
            </table>
            <br/>
            <br/>
            <script>
                // document.getElementById('msg').innerHTML="+email+";
            </script>
        </form>
            
        </div> 
            
            
        </div>
        
        
        
        
        
    </body>
</html>
