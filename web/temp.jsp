<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.Bank"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.nodes.Document"%>
<%
Document hdoc = Jsoup.connect("http://www.hidmet.gov.rs/latin/osmotreni/automatske.php").get();

            Element hid_div = hdoc.select("div").get(6);
            Element hid_h1 = hid_div.select("h1").get(0);
            String hid_datum = hid_h1.toString();
            String dat = hid_datum.substring(55);
            String datum = dat.substring(dat.length() - 15, dat.length() - 5);

            Element hid_tab = hdoc.select("table").get(0);
            Element hid_tr = hid_tab.getElementsByTag("tr").get(2);

            Element hid_vreme = hid_tr.getElementsByTag("td").get(1);
            Element hid_temp = hid_tr.getElementsByTag("td").get(2);
            Element hid_pritisak = hid_tr.getElementsByTag("td").get(3);
            Element hid_vlaga = hid_tr.getElementsByTag("td").get(4);
            Element hid_vetar = hid_tr.getElementsByTag("td").get(6);

            String hid_v = hid_vreme.toString();
            String vreme = hid_v.substring(10, 18);
            //out.println("Hidmet: " + datum + ". godine u " + vreme + " casova<br><br>");

            String hid_t = hid_temp.toString();
            double temperatura = Double.parseDouble(hid_t.substring(10, hid_t.length() - 13));
            //out.println("T: " + temperatura + " °C<br>");

            String hid_pri = hid_pritisak.toString();
            double pritisak = Double.parseDouble(hid_pri.substring(10, hid_pri.length() - 14));
            //out.println("P: " + pritisak + " hPa<br>");

            String hid_vl = hid_vlaga.toString();
            double vlaga = Double.parseDouble(hid_vl.substring(10, hid_vl.length() - 12));
            //out.println("H: " + vlaga + " %<br>");

            String hid_vet = hid_vetar.toString();
            double vetar = Double.parseDouble(hid_vet.substring(10, hid_vet.length() - 14));
            //out.println("W: " + vetar + " m/s<br><br><br>");

  %>          

  <div id="kosutnjak">      
      <a href="http://www.hidmet.gov.rs/ciril/osmotreni/kosutnjak.php"><table id="kosutnjak_tab">
          <tr>
              <th colspan="2"><p id="kosutnjak_p">WEATHER:</p></th>             
          </tr>
          <tr>
              <td><img src="img/thermometer100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(temperatura + " °C");%></p></td>
          </tr> 
          <tr>
              <td><img src="img/barometer100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(pritisak + " hPa");%></p></td>
          </tr>
          <tr>
              <td><img src="img/humidity100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(vlaga + " %");%></p></td>
          </tr>
          <tr>
              <td><img src="img/wind100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(vetar + " m/s");%></p></td>
          </tr>
          </table>   </a>  
  </div>