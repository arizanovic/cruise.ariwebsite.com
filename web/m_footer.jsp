<%

    String gender_footer = "";

    try {
        Object gen = request.getSession().getAttribute("gender");
        gender_footer = gen.toString();

    } catch (Exception e) {
    }
%>


<link rel="stylesheet" href="css/m_footer.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script src="js/scrollToTop.js"></script>




<div id="footer">

    <div id="footer_wrapper">





        <div class="footer cc">
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
            <a href="#" class="back-to-top"><img src="img/arrow_up_100x100.png" height="80px"></a>
        </div>









        <div class="footer bb">

            <div id="logo_footer"><img src="img/cruise_logo_stroke<% if (gender_footer.equals("fm")) {
                    out.print("_fm");
                }%>.png" onclick="window.location.href = 'index.jsp'"></div> 
            
            <p id="AllRights">Copyright © 2019. ARIwebsite creative team. All Rights Reserved</p>
        </div>










        <div class="footer aa">
            

       
        <form method="POST" action="NewsletterServlet" onsubmit="return validateFieldsNewsletterForm()" name="myForm" >
            <table id="newsletter_table">
                <tr>
                    <td>

                        <input type="text" id="email_newsletter_text" name="email_newsletter" placeholder="Send your e-mail to receive Newsletter" pattern="[a-zA-Z0-9]+[._a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]*[a-zA-Z]*@[a-zA-Z0-9]{2,8}.[a-zA-Z.]{2,6}" >

                    </td>
                    <td>
                        <div id="submit">
                            <input type="submit" id="email_newsletter_submit" name="submit" value="SUBMIT">
                        </div>
                    </td>                   
                </tr>
            </table>

        </form>
            <div id="not_valid_footer"></div>

        <div id="social_networks">
            <table>
                <tr>
                    <td><a href="https://www.facebook.com/"><div id="fb_logo"><img src="img/fb_logo1.png" height="100%"></div></a></td>
                    <td><a href="https://www.linkedin.com/"><div id="in_logo"><img src="img/linkedin_logo.png" height="100%"></div></a></td>
                    <td><a href="https://twitter.com/"><div id="tw_logo"><img src="img/twiter_logo.png" height="100%"></div></a></td>
                </tr>
            </table>
        </div>
    </div>


</div>
<script type="text/javascript" src="js/validation.js" ></script>
