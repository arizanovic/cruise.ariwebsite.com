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
            <select id="input_text_da" name="departure_arrival_id" <!--onchange="cruTabValue()"--> > 
                <% for (int i = 0; i < deparr.size(); i++) {%>
                <option value="<%=deparr.get(i).getId()%>"> 
                <p>&nbsp&nbsp from  &nbsp<%=deparr.get(i).getDeparture()%> &nbsp to  &nbsp
                    <%=deparr.get(i).getArrival()%></p>               
                </option>
                <% } %>
            </select>                                                  
            <input id="input_submit_da" type="submit" value="SUBMIT">           
        </form>

        <div id="cruiser_wrapper">


            <div id="tab_3f_1">
                <%for (int i = 0; i <= 20; i++) {%>
                <div class="tooltip" id="field_3f_1<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%>

                </div>
                <% } %>
            </div>

            <div id="tab_3f_2">
                <%for (int i = 21; i <= 37; i++) {%>
                <div class="tooltip" id="field_3f_2<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_4f_1">
                <%for (int i = 38; i <= 41; i++) {%>
                <div class="tooltip" id="field_4f_1<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_4f_2">
                <%for (int i = 42; i <= 45; i++) {%>
                <div class="tooltip" id="field_4f_2<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_4f_3">
                <%for (int i = 46; i <= 51; i++) {%>
                <div class="tooltip" id="field_4f_3<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_4f_4">
                <%for (int i = 52; i <= 57; i++) {%>
                <div class="tooltip" id="field_4f_4<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>


            <div id="tab_6f_1">
                <%for (int i = 58; i <= 62; i++) {%>
                <div class="tooltip" id="field_6f_1<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_6f_2">
                <%for (int i = 63; i <= 67; i++) {%>
                <div class="tooltip" id="field_6f_2<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_7f_1">
                <%for (int i = 68; i <= 87; i++) {%>
                <div class="tooltip" id="field_7f_1<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_7f_2">
                <%for (int i = 88; i <= 107; i++) {%>
                <div class="tooltip" id="field_7f_2<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_8f_1">
                <%for (int i = 108; i <= 110; i++) {%>
                <div class="tooltip" id="field_8f_1<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% } %>
            </div>

            <div id="tab_8f_2">
                <%for (int i = 111; i <= 113; i++) {%>
                <div class="tooltip" id="field_8f_2<%out.print(da.get(i).getFree());%>"><% String st = da.get(i).getFree();
                    if (st.equals("reserved")) {
                        out.print(da.get(i).getId());%><p class="tooltiptext">ROOM <%out.print(da.get(i).getId());%> IS RESERVED</p><%
                    } else {
                    %> <a id="underline" href="Reservation_queryClientServlet?room_id=<%out.print(da.get(i).getId());%>&departure_arrival_id=<%=das%>">
                        <%out.print(da.get(i).getId());%></a> <%
                            }%></div>
                    <% }%>
            </div>
        </div>
            

        <%@include file="navBar.jsp" %>
        <%@include file="footer.jsp" %>
        <script type = "text/javascript" src="js/cruiserTable.js"></script>
    </body>
</html>
