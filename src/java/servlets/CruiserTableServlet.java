package servlets;

import com.google.gson.Gson;
import database.CruiserTableQueries;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Room;

@WebServlet(name = "CruiserTableServlet", urlPatterns = {"/CruiserTableServlet"})
public class CruiserTableServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("application/json;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int departure_arrival_id = Integer.parseInt(request.getParameter("departure_arrival_id"));

            
            ArrayList<Room> da = CruiserTableQueries.getFreeRoomsForDepArr(departure_arrival_id);
            
            request.getSession().setAttribute("da", da);
            request.getSession().setAttribute("departure_arrival_session", departure_arrival_id);
            
                //String i = rt.get(10).getFree();
                //out.println("i = " + i);
                response.sendRedirect("cruiserTable.jsp");
            /*
            String json = new Gson().toJson(da);            
            out.println(json);
            */

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
