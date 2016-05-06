<% System.out.println("inside individualitemDisplay.jsp");
    if (session.getAttribute("email") == null) {
        response.sendRedirect("home.jsp");

    }
    if (session.getAttribute("regid") == null) {
        response.sendRedirect("home.jsp");
    }

%>

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
        <script src="jquery-1.11.3.min.js"></script>
        <script src="ajaxcal.js" type="text/javascript"></script>
        <script type="text/javascript">
            setInterval(a, 1000);
            setInterval(loadajax, 1000);
            setTimeout(ajaxbidreset, 1000);
            function a()
            {
                ///loadajax();
                // $('#contain').load('individualItemDispaly.jsp');
                // alert("dii");
                var dat = document.getElementById("auc_date").innerHTML;
                var tim = document.getElementById("auc_time").innerHTML;
                var auc_start_time = new Date(dat + " " + tim);
                //alert(dat);
                var cur_date = new Date();
                //alert(cur_date);
                //var auc_start_time = new Date("Fri Nov 14 2015 10:53:00 GMT+0530 (India Standard Time)");
                if (cur_date >= auc_start_time)
                {
                    var x = new Date();
                    x = auc_start_time.setMinutes(auc_start_time.getMinutes() + 5);
                    countdown_start("timer", x);
                    //countdown_start("timer","11/13/2015 2:51 PM")  
                }
            }
            function countdown_start(divid, givendate)
            {
                var given_date = new Date(givendate);
                var cur_date = new Date();
                diff = new Date(given_date - cur_date);
                secs = Math.floor(diff.valueOf() / 1000);
                count_back(divid, secs);
            }
            function calculate(secs, num1, num2)
            {
                s = ((Math.floor(secs / num1)) % num2).toString();
                if (s.length < 2)
                {
                    s = "0" + s;
                }
                return (s);
            }
            function count_back(divid, secs)
            {
                var output;
                var format = "%%H%%:%%M%%:%%S%%";
                // output = format.replace(/%%D%%/g, calculate(secs, 86400, 100000));
                output = format.replace(/%%H%%/g, calculate(secs, 3600, 24));
                output = output.replace(/%%M%%/g, calculate(secs, 60, 60));
                output = output.replace(/%%S%%/g, calculate(secs, 1, 60));
                if (secs > 0)
                {
                    document.getElementById(divid).innerHTML = output;
                    setTimeout("count_back('" + divid + "'," + (secs - 1) + ");", 990);
                    document.getElementById('q').id = 'one';


                }
                else
                {
                    document.getElementById(divid).innerHTML = "Auction Over";
                    document.getElementById('one').id = 'two';
                    // ajaxbidreset();
                }

            }




            function loadajax()
            {
                var x = document.getElementById("itemid").value;
                //window.alert(x);

                var xmlhttp;

                if (window.XMLHttpRequest)
                {// code for IE7+, Firefox, Chrome, Opera, Safari
                    xmlhttp = new XMLHttpRequest();
                }

                else
                {// code for IE6, IE5
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

                xmlhttp.onreadystatechange = function()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                    {

                        document.getElementById("hbm").innerHTML = xmlhttp.responseText;
                        // a();
                    }
                }
                xmlhttp.open("GET", "ajax.jsp?val=" + x + "", true);
                xmlhttp.send();
            }







        </script>

        <style>


        </style>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="Catlist" class="MyPack.viewitems" scope="page" />

    </head>
    <!--    <body onload="loadajax()">-->
    <body onload="a()">
        <div style="height:auto;" id="contain">
            <%@include file="header.jsp"%>
            <div style="clear:both; ">.</div>
            <div id="container">


                <div id="content" style="height:600px;" >
                    <span id="msg111"></span>
                    <c:forEach var="item" items="${bt}">


                        <center><p style="color: #0088ff;font-size:20px;"><b>${item.pname}</b> </p></center>
                        <hr style="color: #ececec">


                        <div style="float:left;" >

                            <span class="dat"><span >Current Highest Bid:- </span><span id="hbm"> </span></span>
                            <span class="dat"><span>Minimum Bid Amount :- </span><span id="min_amount" style="" >${item.price} </span></span>
                            <span class="dat"> <span >AUCTION DATE :-</span> <span id="auc_date">${item.date} </span></span>

                            <span class="dat"><span >AUCTION TIME :- </span><span id="auc_time">${item.time} </span></span>

                            <center> 
                                <div id="timer" style="margin:10px 0px 0px 0px;font-size:28px; color:red;"></div>
                              
                            <img src="upimage/${item.img}" style="margin:10px 0px 20px 0px;height:400px; width:400px;"/>

                            <div id="q" style=" background-color: #0088ff;width:310px;margin-left: 0px;">

                                <form action="biddata" method="post" onsubmit="return check();">

                                    <input type="text" id="itemid" name="itemid" value="${item.item_id}"  hidden/>

                                    <input type="text" name="bidamount" value=""  />
                                    <br>
                                    <input type="submit" name="bid" value="submit bid"  />
                                    <br/>

                                </form>
                            </div>
                                    </center>
                        </div>

                        <!--                        <div id="q" style="background-color: #0088ff;width:310px;margin:120px 45px 0px 5px;">
                                                     
                                                    <form action="biddata" method="post" onsubmit="return check();">
                                                       
                                                        <input type="text" id="itemid" name="itemid" value="${item.item_id}"  hidden/>
                        
                                                        <input type="text" name="bidamount" value=""  />
                                                        <br>
                                                        <input type="submit" name="bid" value="submit bid"  />
                                                        <br/>
                        
                                                    </form>
                                                </div>-->
                        <!--                        <div style="height:400px;border:1px solid #4592ff ;width:240px;margin-top:20px;">
                                                    <p class="dat"><span >Current Highest Bid:- </span><span id="hbm"> </span></p>
                                                    <p class="dat"><span>Minimum Bid Amount :- </span><span id="min_amount" style="" >${item.price} </span></p>
                                                    <p class="dat"> <span >AUCTION DATE :-</span> <span id="auc_date">${item.date} </span></p>
                        
                                                    <p class="dat"><span >AUCTION TIME :- </span><span id="auc_time">${item.time} </span></p>
                                                    <p>${item.catObj.id} </p>
                        
                                                </div>-->
                        <!--                </div>               -->
                    </c:forEach>

                </div>



            </div>

            <script>
                function check()
                {
                    alert("jhj");
                    var min_amount = document.getElementById("min_amount").innerHTML;
                    alert(min_amount);
                    var bid_amount = document.getElementsByName("bidamount").value;
                    alert(bid_amount);
                    if (min_amonut < bid_amount)
                    {
                        //bid_amount.focus();
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            </script>
            <div style="clear: both">.</div>
            <div id="footer">
                <%@include file="footer.jsp" %>
            </div>
        </div>
    </body>
</html>
