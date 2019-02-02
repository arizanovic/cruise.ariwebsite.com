<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DBQueries"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/client_user.css">
        <link rel="stylesheet" href="css/userDetails.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>cruise.ARIwebsite.com</title>
        <link rel="shortcut icon" href="img/titl_ari.png"/>
        <script src="js/navBar.js"></script> 
    </head>
    <body>      

        
        
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>
                <%if (!role.equals("0") && !role.equals("1") && !role.equals("2")) {
                response.sendRedirect("forbidden.jsp");
            }%>
            
        <%
            int user_id = Integer.parseInt(id);
            ArrayList<User> users = DBQueries.getUsersFromId(user_id);
        %>
        <br><br><br><br><br><br>

        <div id="updateClient_user">
            <h2>UPDATE USER DETAILS:</h2>  <h1><%=users.get(0).getUsername()%></h1><br>
            <form method="POST" action="UserDetailsServlet" >
                <input id="id" class="input_text" value="<%=users.get(0).getId()%>" type="hidden" name="id"> <br>
                FIRSTNAME: <input id="firstname" class="input_text" value="<%=users.get(0).getFirstname()%>" type="text" name="firstname"> <br>
                LASTNAME: <input id="lastname" class="input_text" value="<%=users.get(0).getLastname()%>" type="text" name="lastname"> <br>
                E-MAIL: <input id="email" class="input_text" value="<%=users.get(0).getEmail()%>" type="text" name="email"> <br>
                PASSWORD: <input id="password" class="input_text" type="text" name="password"> <br>               
                <input class="input_submit"  type="submit" name="submit" value="UPDATE"> <br>
            </form> 
        </div>


        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <%@include file="footer.jsp"%>
        <script type = "text/javascript" src="js/updateUser.js"></script>
    </body>
</html>
