<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String badlog = "";

    try {
        Object u = request.getSession().getAttribute("badlog");
        badlog = u.toString();
    } catch (Exception e) {
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cruise.ARIwebsite.com</title>
        <link rel="shortcut icon" href="img/titl_ari.png"/>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/login.css">
        <script src="js/navBar.js"></script> 
    </head>
    <body>
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>
        <br><br><br><br><br><br>
        <div class="loginInput">
            <h1>LOGIN:</h1><p style='color: red'><%=badlog%></p>
            <form ACTION="LoginServlet" method="POST" onsubmit="return validateFieldsLoginForm()" name="myForm">
                <span style='color: black'>USER NAME:</span><span style='color: red'> *</span>
                <input class="input_text" type="text" name="username"> <br/>
                <span style='color: black'>PASSWORD:</span><span style='color: red'> *</span>
                <input class="input_text" type="password" name="password">     <br/>
                <input class="input_submit" type="submit" name="submit" value="SUBMIT">

            </form>
        </div>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <script type="text/javascript" src="js/validation.js" ></script>
        <%@include file="footer.jsp" %>
    </body>
</html>
