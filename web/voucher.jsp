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
        <title>cruise.ARIwebsite.com</title>
        <link rel="shortcut icon" href="img/titl_ari.png"/>
        <link rel="stylesheet" href="css/voucher.css">
    </head>
    <body>
  <page size="A4" layout="landscape">
            <div class="wrapper">
            <div class="box a">BOARDING PASS</div>
            <div class="box b"><img id="navLogo" src="img/cruise_logo_stroke_png24.png">

                <div id="life">
                    <img src="img/life1.png">
                </div>
            </div>
            <div class="box c">
                <table id="voucher_table">

                <tr>
                    <td class="voucher_label">PASSENGER</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getClient().getFirstname() + " " + r.getClient().getLastname());%></td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getClient().getCity() + ",");%></td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getClient().getStreet() + " " + r.getClient().getHouse_n());%></td>                   
                </tr>             
                <tr>
                    <td class="voucher_label">DEPARTURE</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getDeparturearrival().getDeparture());%></td>                   
                </tr>
                <tr>
                    <td class="voucher_label">ARRIVAL</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getDeparturearrival().getArrival());%></td>                   
                </tr>
                <tr>
                    <td class="voucher_label">RESERVATION NUMBER</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print("00000" + res_id);%></td>                   
                </tr>               
                <tr>
                    <td class="voucher_label">ROOM</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getRoom().getNumber());%></td>                   
                </tr>
                <tr>
                    <td class="voucher_label">CLASS</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getRoom().getType());%></td>                   
                </tr>
                <tr>
                    <td class="voucher_label">PRICE</td>                   
                </tr>
                <tr>
                    <td class="voucher_data"><%out.print(r.getPrice() + " eur");%></td>                   
                </tr>
              
            </table> 
                
                
            </div>           
        </div>
       </page>     
       
    </body>
</html>
