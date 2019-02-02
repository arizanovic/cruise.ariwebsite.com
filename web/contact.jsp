<%-- 
    Document   : contact
    Created on : Dec 26, 2018, 12:00:28 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/contact.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cruise.ARIwebsite.com</title>
        <link rel="shortcut icon" href="img/titl_ari.png"/>
        <script src="js/navBar.js"></script> 
        <script type="text/javascript" src="js/validation.js" ></script>
    </head>
    <body>
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>
        <br><br><br><br><br><br>
        <div id="map">
            <iframe width="800" height="400" frameborder="0" src="https://www.bing.com/maps/embed?h=400&w=800&cp=44.80012436332662~20.399632451854032&lvl=14&typ=d&sty=r&src=SHELL&FORM=MBEDV8" scrolling="no">
            </iframe>           
        </div>
        
        <div id='contactus'>
            <form method="POST" action="SuggestionServlet"  onsubmit="return validateSugesstionForm()" name="myForm" >

                <input id="name" class="input_form" type="text" name="sugName" placeholder="FIRST and LAST NAME">
                <input id="email" class="input_form" type="text" name="sugEmail" placeholder="E-MAIL" pattern="[a-zA-Z0-9]+[._a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]*[a-zA-Z]*@[a-zA-Z0-9]{2,8}.[a-zA-Z.]{2,6}" >
                <textarea id="message" class="input_form" type="text" name="suggestion" placeholder="MESSAGE"></textarea>
                <input id="submit" class="submit_form" type="submit" value="SEND YOUR SUGESTIONS" name="submit">
            </form>
        </div> 

        <div id="contactus_info">
            <p>CONTACT US:</p>
            <p>
                Omladinskih brigada street 140<br />
                Serbia, 11070 New Belgrade<br />
                Phone number: 064/160-43-50
            </p>
            <p>
                E-mail:
                
                <a id="email_link" href="mailto:dusanarizanovic@yahoo.com">dusanarizanovic@yahoo.com</a>
            </p>
        </div>
        <div  id="qr">
            <img src="img/qr_crop.png">
        </div>
        <br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br>

        <%@include file="footer.jsp" %>
    </body>
</html>
