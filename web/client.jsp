<%@page import="model.Client"%>
<%@page import="java.util.List"%>
<%@page import="database.DBQueriesCRUD"%>
<%!
    public static String convertListToTable(List<Client> clients) {
        String html = "<table id=\"client_user\">";
        html += "<tr><th> Id </th>";
        html += " <th> First name </th>";
        html += " <th> Last name </th>";
        html += " <th> Gender </th>";
        html += " <th> Age </th>";
        html += " <th> City </th>";
        html += " <th> Street </th>";
        html += " <th> House number </th>";
        html += " <th> Phone number </th>";
        html += " <th> Passport number </th></tr>";

        for (int i = 0; i < clients.size(); i++) {
            html += "<tr>";
            html += "<td>" + clients.get(i).getId() + "</td>";
            html += "<td>" + clients.get(i).getFirstname() + "</td>";
            html += "<td>" + clients.get(i).getLastname() + "</td>";
            html += "<td>" + clients.get(i).getGender() + "</td>";
            html += "<td>" + clients.get(i).getAge() + "</td>";
            html += "<td>" + clients.get(i).getCity() + "</td>";
            html += "<td>" + clients.get(i).getStreet() + "</td>";
            html += "<td>" + clients.get(i).getHouse_n() + "</td>";
            html += "<td>" + clients.get(i).getPhone() + "</td>";
            html += "<td>" + clients.get(i).getPassport() + "</td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }

    //padajuci manu sa selectom firstname
    public static String convertListToSelect(List<Client> clients) {
        String html = "<SELECT class='input_text' name=\"id\" onchange='updateForm()'>";
        for (int i = 0; i < clients.size(); i++) {
            html += "<option value='"
                    + clients.get(i).getId() + "'> id = "
                    + clients.get(i).getId() + " (" + clients.get(i).getFirstname() + " " + clients.get(i).getLastname() + ") </option>";
        }
        html += "</select>";
        return html;
    }


%>
<% List<Client> clients = DBQueriesCRUD.getClients();%>
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
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>
        <%if (!role.equals("0") && !role.equals("1")) {
                response.sendRedirect("forbidden.jsp");
            }%>
        <br><br><br><br><br><br>
        <h3>CLIENTS:</h3>
        <%=convertListToTable(clients)%>
        <br><br><br><br>
        <div class="wrapper">

            <div id="newClient_user">
                <form method="POST" action="ClientServlet" >
                    <H2> ADD NEW CLIENT: </H2><br>

                    FIRST NAME: <input class="input_text"  type="text" name="firstname"> <br>
                    LAST NAME: <input class="input_text"  type="text" name="lastname"> <br>
                    GENDER:    <select class="input_text"  name="gender">
                        <option value="m">Male</option>
                        <option value="fm">Female</option>
                    </select>  <br>
                    AGE: <input class="input_text"  type="text" name="age"> <br>
                    CITY: <input class="input_text"  type="text" name="city"> <br> 
                    STREET: <input class="input_text"  type="text" name="street"> <br> 
                    HOUSE NUMBER: <input class="input_text"  type="text" name="house_n"> <br> 
                    PHONE NUMBER: <input class="input_text"  type="text" name="phone"> <br> 
                    PASSPORT NUMBER: <input class="input_text"  type="text" name="passport"> <br> 

                    <input class="input_submit"  type="submit" name="action"
                           value="ADD"> <br>  
                </form>
            </div> 

            <div id="updateClient_user">
                <H2> UPDATE CLIENT: </H2><br>
                <form method="POST" action="ClientServlet" >
                    SELECT CLIENT ID:
                    <%= convertListToSelect(clients)%> <br>
                    FIRST NAME: <input id="firstname" class="input_text"  type="text" name="firstname"> <br>
                    LAST NAME: <input id="lastname" class="input_text"  type="text" name="lastname"> <br>
                    GENDER:    <select id="gender" class="input_text" name="gender">
                        <option value="m">Male</option>
                        <option value="fm">Female</option>
                    </select>  <br>
                    AGE: <input id="age" class="input_text"  type="text" name="age"> <br>
                    CITY: <input id="city" class="input_text"  type="text" name="city"> <br> 
                    STREET: <input id="street" class="input_text"  type="text" name="street"> <br> 
                    HOUSE NUMBER: <input id="house_n" class="input_text"  type="text" name="house_n"> <br> 
                    PHONE NUMBER: <input id="phone" class="input_text"  type="text" name="phone"> <br> 
                    PASSPORT NUMBER: <input id="passport" class="input_text"  type="text" name="passport"> <br> 
                    <input class="input_submit"  type="submit" name="action"
                           value="UPDATE"> <br>  
                </form> 
            </div>


            <div id="deleteClient_user">
                <H2> DELETE CLIENT: </H2><br>
                <form method="POST" action="ClientServlet" >
                    SELECT CLIENT ID:
                    <%= convertListToSelect(clients)%> 
                    <input class="input_submit"  type="submit" name="action"
                           value="DELETE"> <br>  
                </form> 
            </div>
        </div>
        <br><br><br><br>

        <%@include file="footer.jsp" %>
        <script type = "text/javascript" src="js/updateClient.js"></script>
    </body>
</html>
