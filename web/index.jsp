<%@page import="java.awt.*"%>
<%@page import="javax.naming.Context"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style_index.css">
        <link rel="stylesheet" href="css/temp.css">
    </head>
    <body>

        <div class="wrapper">
            <div class="box a" onclick="window.location.href = 'underConstruction.jsp'">CASINO</div>
            <div class="box b" onclick="window.location.href = 'underConstruction.jsp'">UNDERWATER</div>
            <div class="box c" onclick="window.location.href = 'underConstruction.jsp'">NIGHT PARTIES</div>
            <div class="box d" onclick="window.location.href = 'underConstruction.jsp'"><%@include file="temp.jsp" %><%@include file="exchangeRate.jsp" %></div>
            <div class="box e" onclick="window.location.href = 'underConstruction.jsp'">KAYAK EXPLORE</div>           
            <div class="box f" onclick="window.location.href = 'underConstruction.jsp'">CLEAR WATER</div>
            <div class="box g" onclick="window.location.href = 'underConstruction.jsp'">PRIVATE PARADISE</div>
            <div class="box h" onclick="window.location.href = 'underConstruction.jsp'">DIVING</div>
            <div class="box i" onclick="window.location.href = 'underConstruction.jsp'">BOAT EXPLORE</div>
            <div class="box j" onclick="window.location.href = 'underConstruction.jsp'">BEACH MASSAGE</div>
            <div class="box k" onclick="window.location.href = 'underConstruction.jsp'">RESTAURANT</div>
            <div class="box l" onclick="window.location.href = 'underConstruction.jsp'">CINEMA</div>
            <div class="box m" onclick="window.location.href = 'underConstruction.jsp'">FITNESS</div>
        </div>


        <%@include file="navBar.jsp" %>
        <%@include file="nbs.jsp" %>
        <%@include file="footer.jsp" %>
    </body>
</html>

