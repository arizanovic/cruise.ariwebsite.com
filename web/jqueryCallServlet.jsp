<%@page import="database.CruiserTableQueries"%>
<%@page import="model.Room"%>
<%@page import="model.DepartureArrival"%>
<% ArrayList<DepartureArrival> deparr = DBQueries.getDepArr(); %>

<%
    ArrayList<Room> da = null;
    try {
        if (request.getSession().getAttribute("da") != null) {
            da = (ArrayList<Room>) request.getSession().getAttribute("da");
        } else {
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }
%>

<%
    String das = "";
    try {

        Object gen = request.getSession().getAttribute("departure_arrival_session");
        das = gen.toString();
    } catch (Exception e) {
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" type="text/css" href="css/style_ct.css">
        <link rel="stylesheet" type="text/css" href="css/cruiserTable.css">
        <link rel="stylesheet" href="css/temp_cruiserTable.css">
        <script src="js/navBar.js"></script> 
    </head>
    <body>
        <%@include file="temp.jsp" %>
        <%@include file="exchangeRate.jsp" %>
        <br><br><br><br><br><br>

        <form action="CruiserTableJavaServlet" method="get" id="input_da">
            <p> DEPARTURE-ARRIVAL:   </p>
            <select id="input_text_da" name="departure_arrival_id" onchange="cruTabValue()" > 
                <% for (int i = 0; i < deparr.size(); i++) {%>
                <option value="<%=deparr.get(i).getId()%>"> 
                <p>&nbsp&nbsp from  &nbsp<%=deparr.get(i).getDeparture()%> &nbsp to  &nbsp
                    <%=deparr.get(i).getArrival()%></p>               
                </option>
                <% } %>
            </select>                                                  
            <input id="input_submit_da" type="submit" value="SUBMIT">           
        </form>
        <script type = "text/javascript" src="js/cruiserTable.js"></script>
    </body>
</html>
