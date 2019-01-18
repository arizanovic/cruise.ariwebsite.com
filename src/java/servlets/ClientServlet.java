package servlets;


import database.DBQueries;
import database.DBQueriesCRUD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Client;

@WebServlet(name = "ClientServlet", urlPatterns = {"/ClientServlet"})
public class ClientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          String action = request.getParameter("action");
           if(action.equals("ADD")){
               String gender = request.getParameter("gender");
               String firstname = request.getParameter("firstname");
               String lastname = request.getParameter("lastname");
               String passport = request.getParameter("passport");
               String phone = request.getParameter("phone");
               String street = request.getParameter("street");
               String city = request.getParameter("city");
               int house_n = Integer.parseInt(request.getParameter("house_n"));
               int age = Integer.parseInt(request.getParameter("age"));
               
              
               Client newClient = new Client(gender, firstname, lastname, passport, phone, street, city, house_n, age);
              try {
                  DBQueriesCRUD.insertClient(newClient);
              } catch (SQLException ex) {
                  ex.printStackTrace();
              }
               response.sendRedirect("client.jsp");
           }
           if(action.equals("DELETE")){
               int id = Integer.parseInt(request.getParameter("id"));             
               Client c = new Client();
               c.setId(id);  
              try {        
                  DBQueriesCRUD.deleteClient(c);
              } catch (SQLException ex) {
                  ex.printStackTrace();
              }
               response.sendRedirect("client.jsp");
           }
           if(action.equals("UPDATE")){
               int id = Integer.parseInt(request.getParameter("id"));
               String gender = request.getParameter("gender");
               String firstname = request.getParameter("firstname");
               String lastname = request.getParameter("lastname");
               String passport = request.getParameter("passport");
               String phone = request.getParameter("phone");
               String street = request.getParameter("street");
               String city = request.getParameter("city");
               int house_n = Integer.parseInt(request.getParameter("house_n"));
               int age = Integer.parseInt(request.getParameter("age"));
               
               Client newClient = new Client(id, gender, firstname, lastname, passport, phone, street, city, house_n, age);
              try {
                  DBQueriesCRUD.updateClient(newClient);
              } catch (SQLException ex) {
                  ex.printStackTrace();
              }
               
               response.sendRedirect("client.jsp");
           }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
