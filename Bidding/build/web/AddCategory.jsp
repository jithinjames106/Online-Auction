<%-- 
    Document   : AddCategory
    Created on : Nov 7, 2015, 2:50:09 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="mystyle.css"/>
    </head>
    <body>
        <%@include file="header.jsp"  %>
        <div style="clear:both; ">.</div>
        <div id="container">
           <div id="menu1"></div> 
           <div class="formcontent">
               <h2>Add Category>></h2>
           
               <form method="post" action="AddCategory">
           <p id="wer"></p>
           <a href="home.jsp">back</a>
            <table style="margin-top:20px;margin-left:200px;">
                <tr>
                    <td>Category</td><td><input type="text" name="category"/></td>
                </tr>
                 <tr>
                     <td></td><td><input type="submit" value="Save" /></td>
                </tr>
                 
               
            </table>
            
        </form>
            
        </div> 
            
            
        </div>
        
        
        
        
       
    </body>
</html>
