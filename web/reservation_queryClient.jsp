<%@page import="model.Room"%>
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


<%

    String roomId = "";
    String departureArrivalId = "";
    String arrival = "";
    String departure = "";
    try {
        Object room_id = request.getSession().getAttribute("roomId");
        roomId = room_id.toString();
        Object dai = request.getSession().getAttribute("departureArrivalId");
        departureArrivalId = dai.toString();
        Object arriv = request.getSession().getAttribute("arrival");
        arrival = arriv.toString();
        Object depart = request.getSession().getAttribute("departure");
        departure = depart.toString();
    } catch (Exception e) {
    }

%>
<%    int roomNum = Integer.parseInt(roomId);
    Room room = DBQueries.getRoomData(roomNum);


%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/reservation.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <%@include file="navBar.jsp" %>


<div id="wrapper">

        <div id="reservationInput">
            <form ACTION="Reservation_queryClientInsertServlet" method="POST" onsubmit="return validateFieldsReservationQueryClientForm()" name="myForm" >

                <input id="bank" class="input_text" value="<%=bank.get(0).getId()%>" type="hidden" name="bank_id">                
                <input id="username_reservation" class="input_text" value="<%=id%>" type="hidden" name="user_id">
                <input id="roomId" class="input_text" value="<%=roomId%>" type="hidden" name="roomId">


                <input id="roomPrice" class="input_text" value="<%=room.getPrice()%>" type="hidden" name="roomPrice">
                <input id="departure_arrival_id" class="input_text" value="<%=departureArrivalId%>" type="hidden" name="departure_arrival_id">
                <input id="activityPriceClientInput" class="input_text" type="hidden" name="activityPriceClientInput">
                <input id="mealPriceClientInput" class="input_text" type="hidden" name="mealPriceClientInput">


                <h2>BOOKING:</h2><br>

                <p>ROOM NUMBER: &nbsp<%=roomId%> &nbsp&nbsp&nbsp&nbsp PRICE: <%=room.getPrice()%> euros</p>
                <p>PERIOD: &nbsp<%=departure%> &nbspdo&nbsp <%=arrival%>
                <p> ACTIVITY:   
                    <select class="input_text" id="activityClient" name="activity_id" onchange="activityNumberClient()"> 
                        <% for (int i = 0; i < activities.size(); i++) {%>
                        <option value="<%=activities.get(i).getId()%>"> 
                            <%=activities.get(i).getType()%>
                        </option>
                        <% } %>
                    </select> 
                </p>
                <p id="activityPriceClient"></p>


                <p> FOOD:                      
                    <select class="input_text" id="mealClient" name="meal_id" onchange="mealNumberClient()"> 
                        <% for (int i = 0; i < meals.size(); i++) {%>
                        <option value="<%=meals.get(i).getId()%>"> 
                            <%=meals.get(i).getType()%>
                        </option>
                        <% }%>
                    </select> 
                </p>
                <p id="mealPriceClient"></p>

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


                <input class="input_submit" id="input_submit" type="submit" name="submit" value="REZERVISI">           
            </form>
        </div>

        <img id="reservationQueryClientImg" src="img/cruiser room<%if (roomNum >= 300 && roomNum < 400) {
                out.print("300");
            } else if (roomNum >= 400 && roomNum < 500) {
                out.print("400");
            } else if (roomNum >= 600 && roomNum < 700) {
                out.print("600");
            } else if (roomNum >= 700 && roomNum < 800) {
                out.print("700");
            } else if (roomNum >= 800 && roomNum < 900) {
                out.print("800");
            }%>.jpg" >                                               



        <div id="reservation_notice">
            <p>*All prices are expressed in Euros per person</p>
            <p>*Room prices are expressed in Euros per person per day</p>
        </div>
</div>
        
        <%@include file="footer.jsp" %>
        <script type="text/javascript" src="js/validation.js" ></script>
        <script type = "text/javascript" src="js/reservation.js"></script>

    </body>
</html>