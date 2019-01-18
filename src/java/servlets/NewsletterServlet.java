
package servlets;

import database.DBQueries;
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
import model.Newsletter;
import model.User;

@WebServlet(name = "NewsletterServlet", urlPatterns = {"/NewsletterServlet"})
public class NewsletterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
               String email_newsletter = request.getParameter("email_newsletter");
               
               String user_id = "";
            try {
                Object u = request.getSession().getAttribute("id");
                user_id = u.toString();

            } catch (Exception e) {
            }              
if (user_id.equals("")) {
                
                Newsletter n = new Newsletter();
                
                n.setEmail(email_newsletter);
                
                DBQueries.insertNewsletterWithoutUserId(n);
                response.sendRedirect("index.jsp");
            } else {
                int sug_user_id = Integer.parseInt(user_id);
                out.print("sug_user_id" + sug_user_id + "<br>");
                User user = new User(sug_user_id);
                Newsletter n = new Newsletter();

                n.setEmail(email_newsletter);
                n.setUser(user);

                DBQueries.insertNewsletter(n);
                response.sendRedirect("index.jsp");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
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
