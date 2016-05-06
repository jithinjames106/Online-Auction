<!--<div id="top">-->
    <%String email=(String)session.getAttribute("email"); 
    if(email!=null){ %>
<!--    <span style="color: #ffffff;font-size:16px">Welcome,<%=email %></span>-->
  
<!--            <h1 id="top1" style="color:  #ffffff">-->

                
<!--                <span style="min-width:30px;"></span>-->
                
<!--            </h1> -->
<!--        </div>-->
        
            
            
            <div style="width:1550px; background-color: red;">
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
                        <li><a href="CustomerQuit">Quit</a></li>

                        </ul>
                    </div>
                    <!--            <div id="slider">
                    
                    
                                </div>-->
                </div>
            </div>

        </div>
