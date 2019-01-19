<%@page import="database.DBQueriesCRUD"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%!
    public static String convertListToTable(List<User> users) {
        String html = "<table id=\"client_user\">";
        html += "<tr><th> Id </th>";
        html += " <th> First Name </th>";
        html += " <th> Last Name </th>";
        html += " <th> Gender </th>";
        html += " <th> E-mail </th>";
        html += " <th> Username </th>";
        html += " <th> Password </th>";
        html += " <th> Role </th>";

        for (int i = 0; i < users.size(); i++) {
            html += "<tr>";
            html += "<td>" + users.get(i).getId() + "</td>";
            html += "<td>" + users.get(i).getFirstname() + "</td>";
            html += "<td>" + users.get(i).getLastname() + "</td>";
            html += "<td>" + users.get(i).getGender() + "</td>";
            html += "<td>" + users.get(i).getEmail() + "</td>";
            html += "<td>" + users.get(i).getUsername() + "</td>";
            html += "<td>" + users.get(i).getPassword() + "</td>";
            html += "<td>" + users.get(i).getRole() + "</td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }

    //padajuci manu sa selectom firstname
    public static String convertListToSelect(List<User> users) {
        String html = "<SELECT class='input_text' name=\"id\" onchange='updateForm()'>";
        for (int i = 0; i < users.size(); i++) {
            html += "<option value='"
                    + users.get(i).getId() + "'> id = "
                    + users.get(i).getId() + " (" + users.get(i).getFirstname() + " " + users.get(i).getLastname() + ") </option>";
        }
        html += "</select>";
        return html;
    }


%>

<% List<User> users = DBQueriesCRUD.getUsers();%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/client_user.css">
        <link rel="stylesheet" href="css/temp.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/navBar.js"></script> 
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%if (!role.equals("0")) {
                response.sendRedirect("forbidden.jsp");
            }%>

        <br><br><br><br><br><br>
        <h3>USERS:</h3>
        <%=convertListToTable(users)%>
        <br><br><br><br>
        <div class="wrapper">

            <div id="newClient_user">
                <form method="POST" action="UserServlet" >
                    <H2> ADD NEW USER: </H2><br>

                    FIRST NAME: <input class="input_text"  type="text" name="firstname"> <br>
                    LAST NAME: <input class="input_text"  type="text" name="lastname"> <br>
                    GENDER:    <select class="input_text" name="gender">
                        <option value="m">MALE</option>
                        <option value="fm">FEMALE</option>
                    </select>  <br>
                    E-MAIL: <input class="input_text"  type="text" name="email"> <br>
                    USERNAME: <input class="input_text"  type="text" name="username"> <br> 
                    PASSWORD: <input class="input_text"  type="text" name="password"> <br> 
                    ROLE: <input class="input_text"  type="text" name="role"> <br> 

                    <input class="input_submit"  type="submit" name="action"
                           value="ADD"> <br>  
                </form>
            </div> 

            <div id="updateClient_user">
                <H2> UPDATE USER: </H2><br>
                <form method="POST" action="UserServlet" >
                    SELECT USER ID:
                    <%= convertListToSelect(users) %> <br>
                    FIRST NAME: <input id="firstname" class="input_text" type="text" name="firstname"> <br>
                    LAST NAME: <input id="lastname" class="input_text" type="text" name="lastname"> <br>
                    GENDER:    <select id="gender" class="input_text" name="gender">
                        <option value="m">Male</option>
                        <option value="fm">Female</option>
                    </select>  <br>
                    E-MAIL: <input id="email" class="input_text" type="text" name="email"> <br>
                    USERNAME: <input id="username" class="input_text" type="text" name="username"> <br> 
                    PASSWORD: <input id="password" class="input_text" type="text" name="password"> <br> 
                    ROLE: <input id="role" class="input_text" type="text" name="role"> <br> 
                    <input class="input_submit" type="submit" name="action"
                           value="UPDATE"> <br>  
                </form> 
            </div>



            <div id="deleteClient_user">
                <H2> DELETE USER: </H2><br>
                <form method="POST" action="UserServlet" >
                    SELECT USER ID:
                    <%= convertListToSelect(users) %> 
                    <input  class="input_submit"  type="submit" name="action"
                            value="DELETE"> <br>  
                </form> 
            </div>
        </div>
        <br><br><br><br>

        <%@include file="footer.jsp" %>
        <script type = "text/javascript" src="js/updateUser.js"></script>
    </body>
</html>
