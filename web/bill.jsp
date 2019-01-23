<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.Reservation"%>
<%@page import="database.DBQueries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String reservation_id = "";
    try {
        Object resId = request.getSession().getAttribute("reservation_id");
        reservation_id = resId.toString();
    } catch (Exception e) {
    }
    int res_id = Integer.parseInt(reservation_id);
%>
<% Reservation r = DBQueries.getReservationById(res_id);%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bill.css">
    </head>
    <body>
    <page size="A4">

        <div id="logo">
            <img src="img/cruise_logo_stroke_png24.png">
        </div>


        <div id="companyData">
            <p>
                ARIWEBSITE d.o.o.<BR>
                Omladinskih brigada 140, 11070 Novi Beograd<BR>
                PIB: 3151233546, MB: 036848373161638<BR>
                TR: 180-31814681381-75, TEL: +381641604350
            </p>
        </div>

        <div id="underLogo">
            <p>PREDUZECE ZA PROJEKTOVANJE I IZRADU SOFTVERA D.O.O.</p>
        </div>

        <div id="billNumber">
            <h3>RACUN BROJ: <%out.print(r.getId());%> / <%
                Date d = r.getDatetime();
                DateFormat df = new SimpleDateFormat("yyyy");
                String date = df.format(d);
                out.print(date);

                %></h3>
        </div>
        
        <div id="dateUser">
            <p>Vreme izdavanja racuna: <%DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy. HH:mm:ss");
                                 Date date1 = new Date();
                                 out.println(dateFormat.format(date1));%>
            </p>
        </div>

        <div id="clientData">
            <p><%out.print(r.getClient().getFirstname() + " " + r.getClient().getLastname());%><BR>
                <%out.print(r.getClient().getCity() + ", ");%><%out.print(r.getClient().getStreet() + " " + r.getClient().getHouse_n());%><BR>
                PASOS: <%=r.getClient().getPassport()%><BR>
                TELEFON: <%=r.getClient().getPhone()%><BR>
            </p>
        </div>

        <div id="pricelist">
            <table>
                <tr>
                    <td>TIP TROSKA</td>
                    <td>TROSAK</td>
                    <td>CENA<br>[EUR]</td>
                    <td>KURS</td>
                    <td>CENA<br>[DIN]</td>
                    <td>PDV</td>
                    <td>KOLICINA</td> 
                    <td>CENA[DIN]<br>SA PDV</td>
                    <td>UKUPNO[DIN]<br>SA PDV</td>
                </tr>
                <tr>
                    <td>AKTIVNOST</td>
                    <td><%=r.getActivity().getType()%></td>
                    <td><%=r.getActivity().getPrice()%></td>
                    <td><%
                        DecimalFormat e1 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e1.format(r.getBank().getEur_mid())));

                        %></td>
                    <td><%                        DecimalFormat e2 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e2.format(r.getActivity().getPrice() * r.getBank().getEur_mid())));
                        %></td>
                    <td>20%</td>
                    <td>1kom.</td>
                    <td><%
                        DecimalFormat e3 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e3.format(r.getActivity().getPrice() * r.getBank().getEur_mid() * 1.2)));
                        %></td>
                    <td><%
                        DecimalFormat e4 = new DecimalFormat("#.##");
                        double actPrice = Double.parseDouble(e4.format(r.getActivity().getPrice() * r.getBank().getEur_mid() * 1.2));
                        out.print(actPrice);
                        %></td>
                </tr>
                
                
                <tr>
                    <td>ISHRANA</td>
                    <td><%=r.getMeal().getType()%></td>
                    <td><%=r.getMeal().getPrice()%></td>
                    <td><%
                        DecimalFormat e5 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e5.format(r.getBank().getEur_mid())));

                        %></td>
                    <td><%                        
                        DecimalFormat e6 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e6.format(r.getMeal().getPrice() * r.getBank().getEur_mid())));
                        %></td>
                    <td>20%</td>
                    <td>1kom.</td>
                    <td><%
                        DecimalFormat e7 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e7.format(r.getMeal().getPrice() * r.getBank().getEur_mid() * 1.2)));
                        %></td>
                <td><%
                    
                        DecimalFormat e8 = new DecimalFormat("#.##");
                        double mealPrice = Double.parseDouble(e8.format(r.getMeal().getPrice() * r.getBank().getEur_mid() * 1.2));
                        out.print(mealPrice);
                        %></td>
                </tr>

                
                
                <tr>
                    <td>SOBA/DAN</td>
                    <td><%=r.getRoom().getNumber()%></td>
                    <td><%=r.getRoom().getPrice()%></td>
                    <td><%
                        DecimalFormat e9 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e9.format(r.getBank().getEur_mid())));

                        %></td>
                    <td><%                        DecimalFormat e10 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e10.format(r.getRoom().getPrice() * r.getBank().getEur_mid())));
                        %></td>
                    <td>20%</td>
                    <td>30 dana</td>
                    <td><%
                        DecimalFormat e11 = new DecimalFormat("#.##");
                        out.print(Double.parseDouble(e11.format(r.getRoom().getPrice() * r.getBank().getEur_mid() * 1.2)));
                        %></td>
                <td><%
                        DecimalFormat e12 = new DecimalFormat("#.##");
                        double roomPrice = Double.parseDouble(e12.format(r.getRoom().getPrice() * r.getBank().getEur_mid() * 1.2 * 30));
                        out.print(roomPrice);
                        %></td>
                </tr>
                
                <tr>
                    <td colspan="7" style="border-left:0px; border-bottom:0px;"></td>                    
                    <td>UKUPNO:</td>
                    <td><%
                        double tot = actPrice + mealPrice + roomPrice;
                        DecimalFormat e13 = new DecimalFormat("#.##");
                        double total = Double.parseDouble(e13.format(tot));
                        out.print(total);
                        %></td>
                </tr>
            </table>
        </div>
        <div id="star">
            <p>*cena je obracunata po srednjem kursu evra NBS na dan rezervacije: <%
                DateFormat dateFormat1 = new SimpleDateFormat("dd.MM.yyyy.");               
                out.println(dateFormat1.format(r.getBank().getDate()));
            %><br>
                *refundiranje u slucaju odustajanja se vrsi u visini od 70%, najkasnije mesec dana pre putovanja
                *Napomena o poreskom oslobadjanju: Nema poreskog oslobadjanja
            <h4>Racun je placen avansno.</h4>
            </p>
        </div>
                
                <div id="billed">
                    <p>RACUN IZRADIO:</p>                                       
                </div>
                
                <div id="underBilled">
                    <p><%out.print(r.getUser().getFirstname() + " " + r.getUser().getFirstname());%><br>
                        U Beogradu, <%DateFormat dateFormat2 = new SimpleDateFormat("dd.MM.yyyy.");
                                 Date date3 = new Date();
                                 out.println(dateFormat2.format(date3));%>
                    </p>                                       
                </div>
                    
    </page>  
</body>
</html>