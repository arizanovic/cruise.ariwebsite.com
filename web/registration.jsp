<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String badreg = "";

    try {
        Object u = request.getSession().getAttribute("badreg");
        badreg = u.toString();
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/registration.css">
        <script src="js/navBar.js"></script> 
    </head>
    <body>
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>
        <br><br><br><br><br><br>
        <div class="registrationClient">
            <h1>REGISTRATION:</h1><p style='color: red'><%=badreg%></p>
            <form method="POST" action="RegistrationServlet" onsubmit="return validateFieldsRegistrationForm()" name="myForm" >
                <span style='color: black'>FIRST NAME:</span><span style='color: red'> *</span>
                <input class="input_text"  type="text" name="firstname"> <br>
                <span style='color: black'>LAST NAME:</span><span style='color: red'> *</span>
                <input class="input_text"  type="text" name="lastname"> <br>
                GENDER:    <select class="input_text" name="gender">
                    <option value="m">Male</option>
                    <option value="fm">Female</option>
                </select>  <br>
                <span style='color: black'>E-MAIL:</span><span style='color: red'> *</span>
                <input class="input_text" id="email" type="text" name="email" onchange="validRegistrationEmailFunction()">
                <div id="not_valid"></div>
                <span style='color: black'>USERNAME:</span><span style='color: red'> *</span>
                <input class="input_text"  type="text" name="username"> <br> 
                <span style='color: black'>PASSWORD:</span><span style='color: red'> *</span>
                <input class="input_text"  type="text" name="password"> <br> 

                <div id="submit">
                    <input class="input_submit"  type="submit" name="submit" value="REGISTER" disabled>               
                </div>
                

            </form>
        </div>

        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <script type="text/javascript" src="js/validation.js" ></script>
        <%@include file="footer.jsp" %>
    </body>
</html>
