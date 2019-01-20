<%@page import="model.Reservation_query"%>
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
    public static String convertListToTableQuery(List<Reservation_query> reserv_q) {
        String html = "<table id=\"client_user\">";
        html += "<tr><th> Rezervisi </th>";
        html += " <th> Id </th>";
        html += " <th> Date </th>";
        html += " <th> First name </th>";
        html += " <th> Last name </th>";
        html += " <th> Room number </th>";
        html += " <th> Activity </th>";
        html += " <th> Food </th>";
        html += " <th> Exchange rate </th>";
        html += " <th> Departure </th>";
        html += " <th> Arrival </th>";
        html += " <th> Price[EUR] </th>";
        html += " <th> Delete </th>";

        for (int i = 0; i < reserv_q.size(); i++) {
            html += "<tr>";
            html += "<td><a href='Reservation_queryAddRemoveServlet?reservationQueryId=" + reserv_q.get(i).getId() + "&addRemove=1'><img src='img/plus.png' height='50px'></a></td>";
            html += "<td>" + reserv_q.get(i).getId() + "</td>";
            html += "<td>" + reserv_q.get(i).getDatetime() + "</td>";
            html += "<td>" + reserv_q.get(i).getClient().getFirstname() + "</td>";
            html += "<td>" + reserv_q.get(i).getClient().getLastname() + "</td>";
            html += "<td>" + reserv_q.get(i).getRoom().getId() + "</td>";
            html += "<td>" + reserv_q.get(i).getActivity().getType() + "</td>";
            html += "<td>" + reserv_q.get(i).getMeal().getType() + "</td>";
            html += "<td>" + reserv_q.get(i).getBank().getEur_mid() + "</td>";
            html += "<td>" + reserv_q.get(i).getDeparturearrival().getDeparture() + "</td>";
            html += "<td>" + reserv_q.get(i).getDeparturearrival().getArrival() + "</td>";
            html += "<td>" + reserv_q.get(i).getPrice() + "</td>";
            html += "<td><a href='Reservation_queryAddRemoveServlet?reservationQueryId=" + reserv_q.get(i).getId() + "&addRemove=0'><img src='img/minus.png' height='50px'></a></td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }
%>

<%!
    public static String convertListToTable(List<Reservation> reserv) {
        String html = "<table id=\"client_user\">";
        html += "<tr><th> Voucher </th>";
        html += " <th> Id </th>";
        html += " <th> Insert time </th>";
        html += " <th> First name </th>";
        html += " <th> Last name </th>";
        html += " <th> Room number </th>";
        html += " <th> Activity </th>";
        html += " <th> Food </th>";
        html += " <th> Exchange rate </th>";
        html += " <th> Departure </th>";
        html += " <th> Arrival </th>";
        html += " <th> Price </th>";
        html += " <th> User </th>";
        html += " <th> Delete </th>";

        for (int i = 0; i < reserv.size(); i++) {
            html += "<tr>";
            html += "<td><a href='VoucherServlet?reservationId=" + reserv.get(i).getId() + "'><img src='img/voucher_v_button.png' height='50px'></a></td>";
            html += "<td>" + reserv.get(i).getId() + "</td>";
            html += "<td>" + reserv.get(i).getDatetime() + "</td>";
            html += "<td>" + reserv.get(i).getClient().getFirstname() + "</td>";
            html += "<td>" + reserv.get(i).getClient().getLastname() + "</td>";
            html += "<td>" + reserv.get(i).getRoom().getId() + "</td>";
            html += "<td>" + reserv.get(i).getActivity().getType() + "</td>";
            html += "<td>" + reserv.get(i).getMeal().getType() + "</td>";
            html += "<td>" + reserv.get(i).getBank().getEur_mid() + "</td>";
            html += "<td>" + reserv.get(i).getDeparturearrival().getDeparture() + "</td>";
            html += "<td>" + reserv.get(i).getDeparturearrival().getArrival() + "</td>";
            html += "<td>" + reserv.get(i).getPrice() + "</td>";
            html += "<td>" + reserv.get(i).getUser().getUsername() + "</td>";
            html += "<td><a href='DeleteReservationServlet?reservationQueryId=" + reserv.get(i).getId() + "&addRemove=0'><img src='img/minus.png' height='50px'></a></td>";
            html += "</tr>";
        }
        html += "</table>";
        return html;
    }
%>



<% List<Reservation_query> reserv_q = DBQueries.getReservation_query();%>
<% List<Reservation> reserv = DBQueries.getReservations();%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/reservation.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%@include file="navBar.jsp" %>
        <%if (!role.equals("0") && !role.equals("1")) {
                response.sendRedirect("forbidden.jsp");
            }%>

        <div id="wrapper">


            <div id="reservationTable_q">
                <%=convertListToTableQuery(reserv_q)%>
            </div>
            <div id="reservationTable">
                <%=convertListToTable(reserv)%>
            </div>
            <br><br>

            <div id="reservationInput">
                <form ACTION="Reservation_queryServlet" method="POST">

                    <input id="bank" class="input_text" value="<%=bank.get(0).getId()%>" type="hidden" name="bank_id">                
                    <input id="username_reservation" class="input_text" value="<%=id%>" type="hidden" name="user_id">
                    <h2>BOOKING QUERY:</h2><br>
                    <p> DEPARTURE-ARRIVAL:
                        <select class="input_text" id="departure_arrival_id" onchange="val()" name="departure_arrival_id"> 
                            <% for (int i = 0; i < deparr.size(); i++) {%>
                            <option value="<%=deparr.get(i).getId()%>"> 
                            <%=deparr.get(i).getDeparture()%> <p> do </p>
                            <%=deparr.get(i).getArrival()%>
                            </option>
                            <% } %>
                        </select> 
                    </p>
                    <p> FREE ROOMS:  
                        <select class="input_text" id="rooms" onchange="roomNumber()" name="room_id">

                        </select> 
                    </p>
                    <p>ROOM PRICE:</p>
                    <input id="roomPrice" class="input_text" type="text" name="roomPrice">



                    <p> CLIENTS:   
                        <select class="input_text" id="clients" name="client_id"> 
                            <% for (int i = 0; i < clients.size(); i++) {%>
                            <option value="<%=clients.get(i).getId()%>"> 
                            <%=clients.get(i).getFirstname()%> <p> </p>
                            <%=clients.get(i).getLastname()%>
                            </option>
                            <% } %>
                        </select> 
                    </p>



                    <p> ACTIVITY:   
                        <select class="input_text" id="activity" name="activity_id" onchange="activityNumber()"> 
                            <% for (int i = 0; i < activities.size(); i++) {%>
                            <option value="<%=activities.get(i).getId()%>"> 
                                <%=activities.get(i).getType()%>
                            </option>
                            <% } %>
                        </select> 
                    </p>
                    <p>ACTIVITY PRICE:</p>
                    <input id="activityPrice" class="input_text" type="text" name="activityPrice">



                    <p> FOOD:                      
                        <select class="input_text" id="meal" name="meal_id" onchange="mealNumber()"> 
                            <% for (int i = 0; i < meals.size(); i++) {%>
                            <option value="<%=meals.get(i).getId()%>"> 
                                <%=meals.get(i).getType()%>
                            </option>
                            <% }%>
                        </select> 
                    </p>
                    <p>FOOD PRICE:</p>
                    <input id="mealPrice" class="input_text" type="text" name="mealPrice">



                    <input class="input_submit" id="input_submit" type="submit" name="submit" value="REZERVISI">           
                </form>
            </div>
            <div id="reservation_notice">
                <p>*All prices are expressed in Euros per person</p>
                <p>*Room prices are expressed in Euros per person per day</p>
            </div>

        </div>

        <%@include file="footer.jsp" %>
        <script type = "text/javascript" src="js/reservation.js"></script>

    </body>

</html>