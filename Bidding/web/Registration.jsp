<%-- 
    Document   : Registration
    Created on : Nov 4, 2015, 12:20:40 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mystyle.css" type="text/css"/>
         <script type="text/javascript">
            
            function validation()
            {
               
            var itemname= document.getElementById("fname");
            alert(itemname);
            var itemprice= document.getElementById("lname");
            alert(itemprice);
            var date= document.getElementById("email");
            alert(date);
            var time= document.getElementById("phno");
            alert(time);
            var file= document.getElementById("address");
            alert(file);
             var pwd= document.getElementById("password");
             alert(pwd);
            if(file.value==null||file.value==""||pwd.value==""||pwd.value==null|| itemname.value==null ||itemname.value==""||itemprice.value==null||itemprice.value==""||date.value==null||date.value==""||time.value==""||item.value==null)
            {
             document.getElementById("error").innerHTML="Please enter the fields completly.";
             return false;
            }
            }
        </script>
    </head>
    <body>
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
          <div style="clear:both; ">.</div>
        <div id="container">
           <div id="menu1"></div> 
           <div class="formcontent">
               <h2>Register>></h2>
               <p id="error" style="color:red; margin-left:200px;"></p>
               <form method="post" action="RegisterCustomer" onsubmit="return validation();">
            <table style="margin-top:20px;margin-left:200px;">
                <tr><td>First Name</td><td><input type="text" name="fname" id="fname"/></td></tr>
                 <tr><td>Last  Name</td><td><input type="text" name="lname" id="lname"/></td></tr>
                 <tr><td>Email</td><td><input type="text" name="email" id="email"/></td></tr>
                  <tr><td>Phone Number</td><td><input type="text" name="phno" id="phno"/></td></tr>
                  <tr><td>Address</td><td><textarea name="address" id="address"></textarea></td></tr>
                  <tr><td>Password</td><td><input type="password" name="pwd" id="password"/></td></tr>
                  <tr><td></td><td><input type="submit" name="submt" value="Sign Up"/></td></tr>
            </table>
        </form>
            
        </div> 
            
            
        </div>
        
        
    </body>
</html>
