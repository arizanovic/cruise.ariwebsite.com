<%@page import="model.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="model.Bank"%>
<%@page import="model.Meal"%>
<%@page import="model.Activity"%>
<%@page import="model.Client"%>
<%@page import="model.DepartureArrival"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.DBQueries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% ArrayList<DepartureArrival> deparr = DBQueries.getDepArr(); %>
<% ArrayList<Client> clients = DBQueries.getClients(); %>
<% ArrayList<Activity> activities = DBQueries.getActivities(); %>
<% ArrayList<Meal> meals = DBQueries.getMeals();%>
<% ArrayList<Bank> bank = DBQueries.getLastIdFromBank();%>

<%!
    public static String convertListToTable(List<Reservation> reserv) {
        String html = "<table id=\"client_user\">";
        html += "<tr><th> Id </th>";
        html += " <th> Vreme Unosa </th>";
        html += " <th> Ime </th>";
        html += " <th> Prezime </th>";
        html += " <th> Broj sobe </th>";
        html += " <th> Aktivnost </th>";
        html += " <th> Ishrana </th>";
        html += " <th> Kurs </th>";
        html += " <th> Polazak </th>";
        html += " <th> Dolazak </th>";
        html += " <th> Cena </th>";
        html += " <th> Operater </th>";

        for (int i = 0; i < reserv.size(); i++) {
            html += "<tr>";
            html += "<td>" + reserv.get(i).getId() + "</td>";
            html += "<td>" + reserv.get(i).getDatetime() + "</td>";           
            html += "<td>" + reserv.get(i).getClient().getFirstname() + "</td>";
            html += "<td>" + reserv.get(i).getClient().getLastname() + "</td>";
            html += "<td>" + reserv.get(i).getRoom().getId() + "</td>";
            html += "<td>" + reserv.get(i).getActivity().getType() + "</td>";
            html += "<td>" + reserv.get(i).getMeal().getType() + "</td>";
            html += "<td>" + reserv.get(i).getBank().getEur_mid() + "</td>";
            html += "<td>" + reserv.get(i).getDeparturearrival().getDeparture()+ "</td>";
            html += "<td>" + reserv.get(i).getDeparturearrival().getArrival()+ "</td>";
            html += "<td>" + reserv.get(i).getPrice() + "</td>";
            html += "<td>" + reserv.get(i).getUser().getUsername() + "</td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }
%>

<% List<Reservation> reserv = DBQueries.getReservations();%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/reservation.css">
        <link rel="stylesheet" href="css/temp.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%if (!role.equals("0") && !role.equals("1")) {
                response.sendRedirect("forbidden.jsp");
            }%>
        <br><br><br><br><br><br><br><br><br>
        <div id="reservationTable">
            <%=convertListToTable(reserv)%>
        </div>
        <br><br>

        <div id="reservationInput">
            <form ACTION="ReservationServlet" method="POST">

                <input id="bank" class="input_text" value="<%=bank.get(0).getId()%>" type="hidden" name="bank_id">                
                <input id="username_reservation" class="input_text" value="<%=id%>" type="hidden" name="user_id">
                <h2>REZERVACIJA:</h2><br>
                <p> POLASCI-DOLASCI:
                    <select class="input_text" id="departure_arrival_id" onchange="val()" name="departure_arrival_id"> 
                        <% for (int i = 0; i < deparr.size(); i++) {%>
                        <option value="<%=deparr.get(i).getId()%>"> 
                        <%=deparr.get(i).getDeparture()%> <p> do </p>
                        <%=deparr.get(i).getArrival()%>
                        </option>
                        <% } %>
                    </select> 
                </p>
                <p> SLOBODNE SOBE:  
                    <select class="input_text" id="rooms" onchange="roomNumber()" name="room_id">

                    </select> 
                </p>
                <p>CENA SOBE:</p>
                <input id="roomPrice" class="input_text" type="text" name="roomPrice">



                <p> KLIJENTI:   
                    <select class="input_text" id="clients" name="client_id"> 
                        <% for (int i = 0; i < clients.size(); i++) {%>
                        <option value="<%=clients.get(i).getId()%>"> 
                        <%=clients.get(i).getFirstname()%> <p> </p>
                        <%=clients.get(i).getLastname()%>
                        </option>
                        <% } %>
                    </select> 
                </p>



                <p> AKTIVNOST:   
                    <select class="input_text" id="activity" name="activity_id" onchange="activityNumber()"> 
                        <% for (int i = 0; i < activities.size(); i++) {%>
                        <option value="<%=activities.get(i).getId()%>"> 
                            <%=activities.get(i).getType()%>
                        </option>
                        <% } %>
                    </select> 
                </p>
                <p>CENA AKTIVNOSTI:</p>
                <input id="activityPrice" class="input_text" type="text" name="activityPrice">



                <p> ISHRANA:                      
                    <select class="input_text" id="meal" name="meal_id" onchange="mealNumber()"> 
                        <% for (int i = 0; i < meals.size(); i++) {%>
                        <option value="<%=meals.get(i).getId()%>"> 
                            <%=meals.get(i).getType()%>
                        </option>
                        <% }%>
                    </select> 
                </p>
                <p>CENA ISHRANE:</p>
                <input id="mealPrice" class="input_text" type="text" name="mealPrice">



                <input class="input_submit" id="input_submit" type="submit" name="submit" value="REZERVISI">           
            </form>
        </div>
        <div id="reservation_notice">
            <p>*sve cene su izrazene u eurima po osobi</p>
            <p>*cene soba su izrazene u eurima po osobi za jedan dan</p>
        </div>
        <br><br><br><br><br><br><br><br>


        <%@include file="footer.jsp" %>
        <script type = "text/javascript" src="js/reservation.js"></script>

    </body>
</html>