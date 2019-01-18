package servlets;

import database.DBQueries;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DepartureArrival;
import model.Room;

@WebServlet(name = "Reservation_queryClientServlet", urlPatterns = {"/Reservation_queryClientServlet"})
public class Reservation_queryClientServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int room_id = Integer.parseInt(request.getParameter("room_id"));
            int departure_arrival_id = Integer.parseInt(request.getParameter("departure_arrival_id"));
            int departure_arrival = departure_arrival_id - 1;

            //out.println("departure_arrival_id" + departure_arrival_id + "<br><br><br>");
            //out.println("room_id" + room_id + "<br><br><br>");

            request.getSession().setAttribute("roomId", room_id);
            request.getSession().setAttribute("departureArrivalId", departure_arrival_id);

            try {
                
                
                
                ArrayList<DepartureArrival> deparr = DBQueries.getDepArr();

                Date arr = deparr.get(departure_arrival).getArrival();
                Date dep = deparr.get(departure_arrival).getDeparture();
 
                DateFormat ar = new SimpleDateFormat("yyyy-MM-dd");
                String arrival = ar.format(arr);
                DateFormat de = new SimpleDateFormat("yyyy-MM-dd");
                String departure = de.format(dep);                
                //out.println("arrival" + arrival + "<br>" + "departure" + "<br>" + departure + "<br><br><br>");                
                //out.println("dep" + dep + "<br>" + "arr" + arr);
                request.getSession().setAttribute("arrival", arrival);
                request.getSession().setAttribute("departure", departure);

            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            response.sendRedirect("reservation_queryClient.jsp");
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
