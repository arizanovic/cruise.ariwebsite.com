package servlets;

import database.DBQueries;
import database.DBQueriesCRUD;
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
import model.Reservation_query;
import model.Room;
import model.User;

@WebServlet(name = "Reservation_queryClientInsertServlet", urlPatterns = {"/Reservation_queryClientInsertServlet"})
public class Reservation_queryClientInsertServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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

            DBQueriesCRUD.insertClient(newClient);

            Client clientSelect = DBQueries.getLastClientId();
            int client_id = clientSelect.getId();
            
            //out.println("client_id" + client_id + "<br>");
                       
            int bank_id = Integer.parseInt(request.getParameter("bank_id"));
            //out.println("bank_id" + bank_id + "<br>");

            int room_id = Integer.parseInt(request.getParameter("roomId"));
            //out.println("room_id" + room_id + "<br>");
            int activity_id = Integer.parseInt(request.getParameter("activity_id"));
           //out.println("activity_id" + activity_id + "<br>");
        
           int meal_id = Integer.parseInt(request.getParameter("meal_id"));
            //out.println("meal_id" + meal_id + "<br>");
            
            int departure_arrival_id = Integer.parseInt(request.getParameter("departure_arrival_id"));
            //out.println("departure_arrival_id" + departure_arrival_id + "<br>");
            
            double roomPrice = Double.parseDouble(request.getParameter("roomPrice"));
            //out.println("roomPrice" + roomPrice + "<br>");
           
            double activityPrice = Double.parseDouble(request.getParameter("activityPriceClientInput"));
            double mealPrice = Double.parseDouble(request.getParameter("mealPriceClientInput"));
            double price = 30 * roomPrice + activityPrice + mealPrice;
            //out.println("price" + price + "<br>");
       



            Client client = new Client(client_id);
            Room room = new Room(room_id);
            Activity activity = new Activity(activity_id);
            Meal meal = new Meal(meal_id);
            Bank bank = new Bank(bank_id);
            DepartureArrival departureArrival = new DepartureArrival(departure_arrival_id);
            Reservation_query r = new Reservation_query();

            r.setPrice(price);            
            r.setClient(client);
            r.setRoom(room);
            r.setActivity(activity);
            r.setMeal(meal);
            r.setBank(bank);
            r.setDeparturearrival(departureArrival);

            DBQueries.insertReservation_query(r);
            
            response.sendRedirect("notice.jsp?redirect=index.jsp&text=You successfully send booking query. <p>Expect the phone call soon.<p>");

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
