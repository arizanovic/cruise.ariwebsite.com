<%@page import="model.Reservation"%>
<%@page import="database.DBQueries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String reservation_id = "";    
    try {
        Object resId = request.getSession().getAttribute("reservation_id");
        reservation_id = resId.toString();        
    } catch (Exception e) {
    } int res_id = Integer.parseInt(reservation_id);
%>
<% Reservation r = DBQueries.getReservationById(res_id);%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div id="wrapper">
            
            
            
        </div>
        
        
    </body>
</html>
