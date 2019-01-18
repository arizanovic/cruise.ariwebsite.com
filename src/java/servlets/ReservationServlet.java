package servlets;

import database.DBQueries;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Activity;
import model.Bank;
import model.Client;
import model.DepartureArrival;
import model.Meal;
import model.Reservation;
import model.Room;
import model.User;


@WebServlet(name = "ReservationServlet", urlPatterns = {"/ReservationServlet"})
public class ReservationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            int client_id = Integer.parseInt(request.getParameter("client_id"));
            int room_id = Integer.parseInt(request.getParameter("room_id"));
            int activity_id = Integer.parseInt(request.getParameter("activity_id"));
            int meal_id = Integer.parseInt(request.getParameter("meal_id"));
            int bank_id = Integer.parseInt(request.getParameter("bank_id"));
            int departure_arrival_id = Integer.parseInt(request.getParameter("departure_arrival_id"));
            double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
            double activityPrice = Double.parseDouble(request.getParameter("activityPrice"));
            double mealPrice = Double.parseDouble(request.getParameter("mealPrice"));
            double price = 30*roomPrice + activityPrice + mealPrice;
            
            User user = new User(user_id);
            Client client = new Client(client_id);
            Room room = new Room(room_id);
            Activity activity = new Activity(activity_id);
            Meal meal = new Meal(meal_id);
            Bank bank = new Bank(bank_id);
            DepartureArrival departureArrival = new DepartureArrival(departure_arrival_id);           
            Reservation r = new Reservation();
            
            
            r.setPrice(price);
            r.setUser(user);
            r.setClient(client);
            r.setRoom(room);
            r.setActivity(activity);
            r.setMeal(meal);
            r.setBank(bank);
            r.setDeparturearrival(departureArrival);

            DBQueries.insertReservation(r);
            
            response.sendRedirect("reservation.jsp");
  
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
