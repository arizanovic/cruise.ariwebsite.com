<%@page import="model.Reservation_query"%>
<%@page import="database.DBQueries"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%
    String username = "";
    String role = "";
    String id = "";
    String gender = "";
    try {
        Object u = request.getSession().getAttribute("username");
        username = u.toString();
        Object r = request.getSession().getAttribute("role");
        role = r.toString();
        Object idd = request.getSession().getAttribute("id");
        id = idd.toString();
        Object gen = request.getSession().getAttribute("gender");
        gender = gen.toString();
    } catch (Exception e) {
    }
%>
<% Reservation_query rq = DBQueries.getNumberOfRowsForNotification(); %>

<script src="js/navBar.js"></script>
<link rel="stylesheet" href="css/navBar<% if (gender.equals("fm")) {
        out.print("_fm");
    }%>.css">



<div id="navbar">
    <img id="navLogo" src="img/cruise_logo_stroke_png24.png" onclick="window.location.href = 'index.jsp'">    


    <% if (role.equals("0")) {%>
    <a href="CruiserTableServlet?departure_arrival_id=1">CLIENT BOOKING</a>   
    <a href="contact.jsp">CONTACT</a>
    <a href="client.jsp">CLIENT</a>
    <a href="user.jsp">USER</a>
    <a href="reservation.jsp">BOOKING</a>
    <a href="reservation_query.jsp">BOOKING QUERY</a>
    <% } else if (role.equals("1")) {%>
    <a href="CruiserTableServlet?departure_arrival_id=1">CLIENT BOOKING</a>   
    <a href="contact.jsp">CONTACT</a>
    <a href="client.jsp">CLIENT</a>
    <a href="reservation.jsp">BOOKING</a>
    <a href="reservation_query.jsp">BOOKING QUERY</a>
    <% } else {%>
    <a href="CruiserTableServlet?departure_arrival_id=1">BOOKING</a>   
    <a href="contact.jsp">CONTACT</a>
    <%}%>
    <div id="login">
        <% if (username.equals("")) { %>
        <a href="registration.jsp">REGISTRATION</a>
        <a href="login.jsp">LOG IN</a>
        <% } else {%>  
        
        <a href="reservation_query.jsp">
        <%
                if (role.equals("0") || role.equals("1")) {
                    int count = rq.getCount();
                    if (count != 0) {
            %> <div id="notification_bell">
                
            
                <div id="notification_count">
                    <%out.print(count);%>
                </div>
                </div> 
            <%                        
                    }
                }
            %>
        </a>
        
        <a href="userDetails.jsp"> 


            



            USER: <b><%=username%></b></a>      
        <a href="LogoutServlet">LOG OUT</a>       
        <% }%>


    </div>
</div>