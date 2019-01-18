<%@page import="database.DBQueries"%>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%boolean bankDate = DBQueries.checkBankDate();%>


<% if (bankDate == false) {
try {
    
        Document doc = Jsoup.connect("http://www.nbs.rs/kursnaListaModul/zaDevize.faces?lang=lat").get();
        
        Element tab = doc.select("table").get(1);
        Element eur_dan = doc.getElementById("index:id31");
        String naDan = eur_dan.toString();
        String kursNaDan = naDan.substring(22, 33);
        //out.println("<h2>Zvanicna kursna lista Narodne banke Srbije:</h2><br>");

        Element eur_tab = tab.getElementsByTag("tr").get(1);
        Element eur_kup = eur_tab.getElementsByTag("td").get(4);
        Element eur_prod = eur_tab.getElementsByTag("td").get(5);

        Element chf_tab = tab.getElementsByTag("tr").get(14);
        Element chf_kup = chf_tab.getElementsByTag("td").get(4);
        Element chf_prod = chf_tab.getElementsByTag("td").get(5);

        Element usd_tab = tab.getElementsByTag("tr").get(16);
        Element usd_kup = usd_tab.getElementsByTag("td").get(4);
        Element usd_prod = usd_tab.getElementsByTag("td").get(5);

        //------------------------------------------------------------------
        String ekupovni = eur_kup.toString();
        String eprodajni = eur_prod.toString();

        double ek = Double.parseDouble(ekupovni.substring(48, 56));
        double ep = Double.parseDouble(eprodajni.substring(48, 56));
        double es1 = (ek + ep) / 2;
        DecimalFormat edf = new DecimalFormat("#.####");
        double es = Double.parseDouble(edf.format(es1));

        //out.println("Kupovni kurs EUR: " + ek + " din.<br>Prodajni kurs EUR: " + ep + " din.<br>Srednji kurs EUR: " + es + " din.<br><br>");
        //------------------------------------------------------------------
        String ckupovni = chf_kup.toString();
        String cprodajni = chf_prod.toString();

        double ck = Double.parseDouble(ckupovni.substring(48, 56));
        double cp = Double.parseDouble(cprodajni.substring(48, 56));
        double cs1 = (ck + cp) / 2;
        DecimalFormat cdf = new DecimalFormat("#.####");
        double cs = Double.parseDouble(cdf.format(cs1));

        //out.println("Kupovni kurs CHF: " + ck + " din.<br>Prodajni kurs CHF: " + cp + " din.<br>Srednji kurs CHF: " + cs + " din.<br><br>");
        //------------------------------------------------------------------
        String ukupovni = usd_kup.toString();
        String uprodajni = usd_prod.toString();

        double uk = Double.parseDouble(ukupovni.substring(48, 56));
        double up = Double.parseDouble(uprodajni.substring(48, 56));
        double us1 = (uk + up) / 2;
        DecimalFormat df = new DecimalFormat("#.####");
        double us = Double.parseDouble(df.format(us1));

        //out.println("Kupovni kurs USD: " + uk + " din.<br>Prodajni kurs USD: " + up + " din.<br>Srednji kurs USD: " + us + " din.<br><br>");
        //------------------------------------------------------------------
        //out.println("Formirana na dan " + kursNaDan + " godine.");
        //out.println("<br><br>----------------------------------------------<br><br>");
        //out.println("");
        //------------------------------------------------------------------
//konvertovanje stringa kursNaDan formata(dd.mm.yyyy.) u string date2 formata (yyyy-mm-dd)
        SimpleDateFormat format1 = new SimpleDateFormat("dd.mm.yyyy.");
        SimpleDateFormat format2 = new SimpleDateFormat("yyyy-mm-dd");
        Date date1 = format1.parse(kursNaDan);
        String date2 = format2.format(date1);

//konvertovanje stringa u java.sql.Date
        DateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
        Date myDate = formatter2.parse(date2);
        java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());

        //insertovanje u bazu
        Bank b = new Bank(ep, ek, es, up, uk, us, cp, ck, cs, sqlDate);
        try {
            DBQueries.insertBank(b);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        
            
    } catch (Exception ex) {
        ex.printStackTrace();
    }
    }
    ;%>
