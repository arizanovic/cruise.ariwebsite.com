package servlets;

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
import model.User;

@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            if (action.equals("ADD")) {
                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                String gender = request.getParameter("gender");

                User newUser = new User(firstname, lastname, email, username, password, role, gender);
                try {
                    DBQueriesCRUD.insertUser(newUser);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                response.sendRedirect("user.jsp");
            }

            if (action.equals("UPDATE")) {
                int id = Integer.parseInt(request.getParameter("id"));
                String firstname = request.getParameter("firstname");
                String lastname = request.getParameter("lastname");
                String email = request.getParameter("email");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String role = request.getParameter("role");
                String gender = request.getParameter("gender");               
                User u = new User(id, firstname, lastname, email, username, password, role, gender);
                                
                if (password.equals("")) {
                try {                    
                    DBQueriesCRUD.updateUserWithoutPass(u);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                response.sendRedirect("user.jsp");
            }
            
            else{
                try {                   
                    DBQueriesCRUD.updateUser(u);
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
                response.sendRedirect("user.jsp");
            }
            }
            

             if(action.equals("DELETE")){
               int id = Integer.parseInt(request.getParameter("id"));              
               User u = new User();
               u.setId(id);  
                try {        
                    DBQueriesCRUD.deleteUser(u);
                } catch (SQLException ex) {
                    
                }
               response.sendRedirect("user.jsp");
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
