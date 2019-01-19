<%@page import="model.Bank"%>
<%@page import="database.DBQueries"%>
<% Bank ban = DBQueries.getBankLastRate(); %>


<div id="nbs">      
      <a href="https://www.nbs.rs/kursnaListaModul/zaDevize.faces?lang=lat"><table id="nbs_tab">
          <tr>
              <th><p id="nbs_p">NBS:</p></th>             
          </tr>
          <tr>
              <th><p id="nbs_date_p"><%out.print(ban.getDate());%></p></th>             
          </tr>
          
          <tr>
              <td align="center"><img src="img/eur100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>             
          </tr>
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getEur_sell());%></p></td>
          </tr> 
          <tr>              
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getEur_mid());%></p></td>
          </tr> 
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getEur_buy());%></p></td>
          </tr> 
          
          <tr>
              <td align="center"><img src="img/usd100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>             
          </tr>
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getUsd_sell());%></p></td>
          </tr> 
          <tr>              
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getUsd_mid());%></p></td>
          </tr> 
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getUsd_buy());%></p></td>
          </tr>
          
          <tr>
              <td align="center"><img src="img/chf100.png" height="50px" onclick="window.location.href = 'index.jsp'"></td>             
          </tr>
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getChf_sell());%></p></td>
          </tr> 
          <tr>              
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getChf_mid());%></p></td>
          </tr> 
          <tr>             
              <td valign="center" align="left"><p id="kosutnjak_p"><%out.print(ban.getChf_buy());%></p></td>
          </tr> 
          
          </table>   </a>  
  </div>