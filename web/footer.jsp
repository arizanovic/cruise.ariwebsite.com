<%

    String gender_footer = "";
    
    try {
        Object gen = request.getSession().getAttribute("gender");
        gender_footer = gen.toString();
        
    } catch (Exception e) {
    }
%>


<link rel="stylesheet" href="css/footer<% if(gender_footer.equals("fm")){out.print("_fm");}%>.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="js/scrollToTop.js"></script>




</div>


<footer>

    <div id="footer">


        <form method="POST" action="NewsletterServlet" onsubmit="return validateFieldsNewsletterForm()" name="myForm" >
            <table id="newsletter_table">
                <tr>
                    <td>
                        
                        <input type="text" id="email_newsletter_text" name="email_newsletter" placeholder="Send your e-mail to receive Newsletter" onchange="validNewsletterEmailFunction()">
                        
                    </td>
                    <td>
                        <div id="submit">
                        <input type="submit" id="email_newsletter_submit" name="submit" value="SUBMIT" disabled>
                        </div>
                    </td>                   
                </tr>
            </table>
            
        </form>




        <div>

            <table id="about_table">

                <tr>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">About us</td>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Help</td>
                </tr>
                <tr>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Carrier</td>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Internship</td>
                </tr>
                <tr>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Information</td>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Share with friends</td>
                </tr>
                <tr>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">YUTA</td>
                    <td id="pointer" onclick="window.location.href = 'underConstruction.jsp'">Certificates</td>
                </tr>

            </table>

        </div>

        <div id="social_networks">
            <table>
                <tr><a href="https://www.facebook.com/" id="fb_logo"><img src="img/fb_logo1.png" height="50px"></a></tr>
                <tr><a href="https://www.linkedin.com/" id="in_logo"><img src="img/linkedin_logo.png" height="50px"></a></tr>
                <tr><a href="https://twitter.com/" id="tw_logo"><img src="img/twiter_logo.png" height="50px"></a></tr>
            </table>
        </div>

        <div id="logo_footer"><img src="img/cruise_logo_stroke<% if(gender_footer.equals("fm")){out.print("_fm");}%>.png" onclick="window.location.href = 'index.jsp'"></div> 
        <a href="#" class="back-to-top"><img src="img/arrow_up_100x100.png" height="80px"></a>
        <p id="AllRights">Copyright © 2019. ARIwebsite creative team. All Rights Reserved</p>

<div id="not_valid_footer"></div>

    </div>



</footer>
        <script type="text/javascript" src="js/validation.js" ></script>
