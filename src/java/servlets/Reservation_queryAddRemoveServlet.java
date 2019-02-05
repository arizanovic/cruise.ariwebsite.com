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
import model.Reservation_query;
import model.Room;
import model.User;

@WebServlet(name = "Reservation_queryAddRemoveServlet", urlPatterns = {"/Reservation_queryAddRemoveServlet"})
public class Reservation_queryAddRemoveServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int addRemove = Integer.parseInt(request.getParameter("addRemove"));
            int reservationQueryId = Integer.parseInt(request.getParameter("reservationQueryId"));
            //out.println("addRemove" + addRemove + "<br>reservationQueryId" + reservationQueryId);

            Reservation_query reserv_q = DBQueries.getReservation_queryById(reservationQueryId);

            int res_q_id = reserv_q.getId();
            out.print("<br>res_q_id" + res_q_id);
//ne uzima user id iz registration query zato sto je ta tabela predvidjena za popunjavanje od strane neregistrovanog ili registrovanog posetioca
//svakako iako je registrovani posetilac, nije relevantan njegov username jer nije zaposlen
            String res_q_us_id = "";
            try {
                Object u = request.getSession().getAttribute("id");
                res_q_us_id = u.toString();

            } catch (Exception e) {
            }
            int res_q_user_id = Integer.parseInt(res_q_us_id);

            out.print("<br>res_q_user_id" + res_q_user_id);

            int res_q_client_id = reserv_q.getClient().getId();
            out.print("<br>res_q_client_id" + res_q_client_id);

            int res_q_room_id = reserv_q.getRoom().getId();
            out.print("<br>res_q_room_id" + res_q_room_id);

            int res_q_activity_id = reserv_q.getActivity().getId();
            out.print("<br>res_q_activity_id" + res_q_activity_id);

            int res_q_meal_id = reserv_q.getMeal().getId();
            out.print("<br>res_q_meal_id" + res_q_meal_id);

            int res_q_bank_id = reserv_q.getBank().getId();
            out.print("<br>res_q_bank_id" + res_q_bank_id);

            int res_q_departure_arrival_id = reserv_q.getDeparturearrival().getId();
            out.print("<br>res_q_departure_arrival_id" + res_q_departure_arrival_id);

            double res_q_price_id = reserv_q.getPrice();
            out.print("<br>res_q_price_id" + res_q_price_id);

            Reservation getr = new Reservation();
            Room getroom = new Room(res_q_room_id);
            DepartureArrival getdepartureArrival = new DepartureArrival(res_q_departure_arrival_id);

            getr.setRoom(getroom);
            getr.setDeparturearrival(getdepartureArrival);

            boolean checkReg = DBQueries.checkReservationByRoomIdAndDeparrId(getr);

            if (addRemove == 1) {

                
                
                if (checkReg) {
                    out.print("<br><br>ne moze...vec je !!!!!!!!!!!!!");
                    response.sendRedirect("notice.jsp?redirect=reservation_query.jsp&text=That room is already reserved in that period!");
                } else {
                    out.print("<br><br>insertuj!!!!!!!!!!!!!");
                    User user = new User(res_q_user_id);
                    Client client = new Client(res_q_client_id);
                    Room room = new Room(res_q_room_id);
                    Activity activity = new Activity(res_q_activity_id);
                    Meal meal = new Meal(res_q_meal_id);
                    Bank bank = new Bank(res_q_bank_id);
                    DepartureArrival departureArrival = new DepartureArrival(res_q_departure_arrival_id);
                    Reservation_query reservation_query = new Reservation_query(res_q_id);
                    Reservation r = new Reservation();

                    r.setReservation_query(reservation_query);
                    r.setPrice(res_q_price_id);
                    r.setUser(user);
                    r.setClient(client);
                    r.setRoom(room);
                    r.setActivity(activity);
                    r.setMeal(meal);
                    r.setBank(bank);
                    r.setDeparturearrival(departureArrival);
                    DBQueries.insertReservation(r);

                    Reservation_query rqdel = new Reservation_query();
                    rqdel.setId(reservationQueryId);
                    DBQueries.deleteReservation_query(reservationQueryId);

                    response.sendRedirect("reservation_query.jsp");
                }

            } else if (addRemove == 0) {
                Reservation_query rqdel = new Reservation_query();
                rqdel.setId(reservationQueryId);

                DBQueries.deleteReservation_query(reservationQueryId);

                response.sendRedirect("reservation_query.jsp");
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
