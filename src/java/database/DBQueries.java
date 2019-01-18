package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Activity;
import model.Bank;
import model.Client;
import model.DepartureArrival;
import model.Meal;
import model.Newsletter;
import model.Reservation;
import model.Reservation_query;
import model.Room;
import model.Suggestion;
import model.User;

public class DBQueries {

    public static boolean checkUser(User u)
            throws SQLException {
        String upit = "select count(*) from user where username = ? and password = md5(?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setString(1, u.getUsername());
        pst.setString(2, u.getPassword());

        ResultSet rs = pst.executeQuery();

        int N = 0;
        if (rs.next()) {
            N = rs.getInt(1);
        }
        return (N == 1) ? true : false;
    }

    public static boolean insertUser(User u) throws SQLException {
        String upit = "insert into user (firstname, lastname, email, username, password, gender) values (?, ?, ?, ?, md5(?), ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, u.getFirstname());
        pst.setString(2, u.getLastname());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getUsername());
        pst.setString(5, u.getPassword());
        pst.setString(6, u.getGender());

        try {
            pst.execute();
        } catch (SQLException ex) {
            System.out.println("Vec postoji korisnik ili sa tim username-om ili emailom");
            ex.printStackTrace();
            return false;
        }
        return true;
    }

    public static String getRoleByUsername(String un) throws SQLException {
        String upit = "select * from user where username = ?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setString(1, un);

        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return rs.getString(7);
        }
        return "prazan rs";
    }

    public static String getIdByUsername(String un) throws SQLException {
        String upit = "select * from user where username = ?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setString(1, un);

        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return rs.getString(1);
        }
        return "prazan rs";
    }

    public static String getGenderByUsername(String un) throws SQLException {
        String upit = "select * from user where username = ?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setString(1, un);

        ResultSet rs = pst.executeQuery();
        if (rs.next()) {
            return rs.getString(8);
        }
        return "prazan rs";
    }

    public static boolean insertBank(Bank b) throws SQLException {
        String upit = "insert into bank (eur_sell, eur_buy, eur_mid, usd_sell, usd_buy, usd_mid, chf_sell, chf_buy, chf_mid, date) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setDouble(1, b.getEur_sell());
        pst.setDouble(2, b.getEur_buy());
        pst.setDouble(3, b.getEur_mid());
        pst.setDouble(4, b.getUsd_sell());
        pst.setDouble(5, b.getUsd_buy());
        pst.setDouble(6, b.getUsd_mid());
        pst.setDouble(7, b.getChf_sell());
        pst.setDouble(8, b.getChf_buy());
        pst.setDouble(9, b.getChf_mid());
        pst.setDate(10, (Date) b.getDate());

        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public static ArrayList<User> getUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        String upit = "select * from user;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(5));
            users.add(u);
        }
        return users;
    }

    public static ArrayList<DepartureArrival> getDepArr() throws SQLException {
        ArrayList<DepartureArrival> deparr = new ArrayList<DepartureArrival>();
        String upit = "SELECT * FROM departurearrival;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            DepartureArrival da = new DepartureArrival(rs.getInt(1), rs.getDate(2), rs.getDate(3));
            deparr.add(da);
        }
        return deparr;
    }

    public static ArrayList<Room> getFreeRoomsForDepArr(int deparr_id)
            throws SQLException {
        ArrayList<Room> rooms = new ArrayList<Room>();
        String upit = "select * from room\n"
                + "where id not in (select r.id\n"
                + "from reservation res\n"
                + "join room r on r.id = res.room_id\n"
                + "where res.departure_arrival_id = ?)";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, deparr_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Room r = new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
            rooms.add(r);
        }
        return rooms;
    }

    public static ArrayList<Client> getClients() throws SQLException {
        ArrayList<Client> clients = new ArrayList<Client>();
        String upit = "select * from client;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Client c = new Client(rs.getInt(1), rs.getString(3), rs.getString(4));
            clients.add(c);
        }
        return clients;
    }

    public static ArrayList<Activity> getActivities() throws SQLException {
        ArrayList<Activity> activities = new ArrayList<Activity>();
        String upit = "select * from activity;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Activity a = new Activity(rs.getInt(1), rs.getInt(2), rs.getString(3));
            activities.add(a);
        }
        return activities;
    }

    public static ArrayList<Meal> getMeals() throws SQLException {
        ArrayList<Meal> meals = new ArrayList<Meal>();
        String upit = "select * from meal;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Meal m = new Meal(rs.getInt(1), rs.getInt(2), rs.getString(3));
            meals.add(m);
        }
        return meals;
    }

    public static ArrayList<User> getUsersFromId(int user_id)
            throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        String upit = "select * from user where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, user_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            users.add(u);
        }
        return users;
    }

    public static boolean updateUser(User u) throws SQLException {
        String upit = "update user set firstname=?, lastname=?, email=?, password = md5(?) where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, u.getFirstname());
        pst.setString(2, u.getLastname());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getPassword());
        pst.setInt(5, u.getId());

        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public static boolean updateUserWithoutPass(User u) throws SQLException {
        String upit = "update user set firstname=?, lastname=?, email=? where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, u.getFirstname());
        pst.setString(2, u.getLastname());
        pst.setString(3, u.getEmail());
        pst.setInt(4, u.getId());

        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    public static ArrayList<Bank> getLastIdFromBank() throws SQLException {
        ArrayList<Bank> bank = new ArrayList<Bank>();
        String upit = "select * from bank order by id desc limit 1;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Bank b = new Bank(rs.getInt(1), rs.getDouble(2), rs.getDouble(3), rs.getDouble(4), rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8), rs.getDouble(9), rs.getDouble(10));
            bank.add(b);
        }
        return bank;
    }

    //insert izabranih podataka u rezervaciji
    public static boolean insertReservation(Reservation r) throws SQLException {
        String upit = "insert into reservation (user_id, client_id, room_id, activity_id, meal_id, bank_id, departure_arrival_id, price) values (?, ?, ?, ?, ?, ?, ?, ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setInt(1, r.getUser().getId());
        pst.setInt(2, r.getClient().getId());
        pst.setInt(3, r.getRoom().getId());
        pst.setInt(4, r.getActivity().getId());
        pst.setInt(5, r.getMeal().getId());
        pst.setInt(6, r.getBank().getId());
        pst.setInt(7, r.getDeparturearrival().getId());
        pst.setDouble(8, r.getPrice());

        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }


    public static Room getRoomData(int room_id) throws SQLException {
        String upit = "select * from room where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, room_id);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Room r = new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getInt(5));
        return r;
    }

    public static Activity getActivityData(int activity_id) throws SQLException {
        String upit = "select * from activity where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, activity_id);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Activity a = new Activity(rs.getInt(1), rs.getInt(2), rs.getString(3));
        return a;
    }

    public static Meal getMealData(int meal_id) throws SQLException {
        String upit = "select * from meal where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, meal_id);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Meal m = new Meal(rs.getInt(1), rs.getInt(2), rs.getString(3));
        return m;
    }
    
public static ArrayList<Reservation> getReservations() throws SQLException {
        ArrayList<Reservation> reservations = new ArrayList<Reservation>();

        String upit = "SELECT res.id, res.datetime,  c.firstname, c.lastname, ro.number, a.type, m.type, b.eur_mid, da.departure, da.arrival, res.price, u.username\n"
                + "                        FROM reservation res\n"
                + "                        join client c on c.id = res.client_id\n"
                + "                        join user u on u.id = res.user_id\n"
                + "                        join activity a on a.id = res.activity_id\n"
                + "                        join meal m on m.id = res.meal_id\n"
                + "                        join bank b on b.id = res.bank_id\n"
                + "                        join departurearrival da on da.id = res.departure_arrival_id\n"
                + "                        join room ro on ro.id = res.room_id\n"
                + "                        order by res.id desc;";

        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            User user = new User();
            Client client = new Client();
            Activity activity = new Activity();
            Meal meal = new Meal();
            Bank bank = new Bank();
            Room room = new Room();
            DepartureArrival departurearrival = new DepartureArrival();
            Reservation reservation = new Reservation();
            
            reservation.setId(rs.getInt(1));
            reservation.setDatetime(rs.getDate(2));
            client.setFirstname(rs.getString(3));
            client.setLastname(rs.getString(4));
            room.setId(rs.getInt(5));
            activity.setType(rs.getString(6));
            meal.setType(rs.getString(7));
            bank.setEur_mid(rs.getDouble(8));
            departurearrival.setDeparture(rs.getDate(9));
            departurearrival.setArrival(rs.getDate(10));
            reservation.setPrice(rs.getDouble(11));
            user.setUsername(rs.getString(12));

            reservation.setUser(user);
            reservation.setClient(client);
            reservation.setRoom(room);
            reservation.setActivity(activity);
            reservation.setMeal(meal);
            reservation.setBank(bank);
            reservation.setDeparturearrival(departurearrival);
            reservations.add(reservation);
        }
        return reservations;
    }


    //provera da li je vikend, ako je vikend, reci ta je tacno da postoji lista na danasnji dan, ako nije vikend proveri da li posotji lista sa danasnjim danom
    public static boolean checkBankDate()
            throws SQLException {
        String upit = "SELECT IF(WEEKDAY(CURDATE()) IN (5, 6),    1,    (select count(*) from bank where date = CURDATE())   );";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();

        int N = 0;
        if (rs.next()) {
            N = rs.getInt(1);
        }
        return (N == 1) ? true : false;
    }

    public static Bank getBankLastRate() throws SQLException {
        String upit = "select * from bank order by id desc limit 1;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Bank b = new Bank(rs.getInt(1), rs.getDouble(2), rs.getDouble(3), rs.getDouble(4), rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8), rs.getDouble(9), rs.getDouble(10), rs.getDate(11));
        return b;
    }

    //insert izabranih podataka u rezervaciji od korisnika/klijenta
    public static boolean insertReservation_query(Reservation_query r) throws SQLException {
        String upit = "insert into reservation_query (client_id, room_id, activity_id, meal_id, bank_id, departure_arrival_id, price) values (?, ?, ?, ?, ?, ?, ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);


        pst.setInt(1, r.getClient().getId());
        pst.setInt(2, r.getRoom().getId());
        pst.setInt(3, r.getActivity().getId());
        pst.setInt(4, r.getMeal().getId());
        pst.setInt(5, r.getBank().getId());
        pst.setInt(6, r.getDeparturearrival().getId());
        pst.setDouble(7, r.getPrice());

        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }

    //metod za tabelu u rezervacijama
    public static ArrayList<Reservation_query> getReservation_query() throws SQLException {
        ArrayList<Reservation_query> reservations = new ArrayList<Reservation_query>();

        String upit = "SELECT res.id, res.datetime,  c.firstname, c.lastname, ro.number, a.type, m.type, b.eur_mid, da.departure, da.arrival, res.price\n"
                + "                        FROM reservation_query res\n"
                + "                        join client c on c.id = res.client_id\n"
                + "                        join activity a on a.id = res.activity_id\n"
                + "                        join meal m on m.id = res.meal_id\n"
                + "                        join bank b on b.id = res.bank_id\n"
                + "                        join departurearrival da on da.id = res.departure_arrival_id\n"
                + "                        join room ro on ro.id = res.room_id\n"
                + "                        order by res.id desc;";

        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Client client = new Client();
            Activity activity = new Activity();
            Meal meal = new Meal();
            Bank bank = new Bank();
            Room room = new Room();
            DepartureArrival departurearrival = new DepartureArrival();
            Reservation_query reservation = new Reservation_query();
            
            reservation.setId(rs.getInt(1));
            reservation.setDatetime(rs.getDate(2));
            client.setFirstname(rs.getString(3));
            client.setLastname(rs.getString(4));
            room.setId(rs.getInt(5));
            activity.setType(rs.getString(6));
            meal.setType(rs.getString(7));
            bank.setEur_mid(rs.getDouble(8));
            departurearrival.setDeparture(rs.getDate(9));
            departurearrival.setArrival(rs.getDate(10));
            reservation.setPrice(rs.getDouble(11));



            reservation.setClient(client);
            reservation.setRoom(room);
            reservation.setActivity(activity);
            reservation.setMeal(meal);
            reservation.setBank(bank);
            reservation.setDeparturearrival(departurearrival);
            reservations.add(reservation);
        }
        return reservations;
    }
    //koristi se za dobijanje id-a klijenta da bi se odradio upit rezervacije
    public static Client getLastClientId() throws SQLException {
        String upit = "select id from client order by id desc limit 1;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Client c = new Client(rs.getInt(1));
        return c;
    }
    
    
    public static Reservation_query getReservation_queryById(int reservationQueryId) throws SQLException {
        String upit = "select * from reservation_query where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, reservationQueryId);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Reservation_query rq = new Reservation_query(rs.getInt(1));
        User user = new User(rs.getInt(3));
        rq.setUser(user);        
            Client client = new Client(rs.getInt(4));
            rq.setClient(client);          
            Room room = new Room(rs.getInt(5));
            rq.setRoom(room);            
            Activity activity = new Activity(rs.getInt(6));
            rq.setActivity(activity);            
            Meal meal = new Meal(rs.getInt(7));
            rq.setMeal(meal);           
            Bank bank = new Bank(rs.getInt(8));
            rq.setBank(bank);            
            DepartureArrival departurearrival = new DepartureArrival(rs.getInt(9));
            rq.setDeparturearrival(departurearrival);            
            rq.setPrice(rs.getDouble(10));       
        return rq;
    }
    
    public static boolean deleteReservation_query(int reservationQueryId) throws SQLException {
        String upit = "delete from reservation_query where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setInt(1, reservationQueryId);
        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean deleteReservation(int reservationQueryId) throws SQLException {
        String upit = "delete from reservation where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setInt(1, reservationQueryId);
        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean insertSuggestion(Suggestion s) throws SQLException {
        String upit = "insert into suggestion (name, email, comment, user_id) values(?,?,?,?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, s.getName());
        pst.setString(2, s.getEmail());
        pst.setString(3, s.getComment());
        pst.setInt(4, s.getUser().getId());
        
        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean insertSuggestionWithoutUserId(Suggestion s) throws SQLException {
        String upit = "insert into suggestion (name, email, comment) values(?,?,?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, s.getName());
        pst.setString(2, s.getEmail());
        pst.setString(3, s.getComment());
        
        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean insertNewsletter(Newsletter n) throws SQLException {
        String upit = "insert into newsletter (email, user_id) values(?,?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, n.getEmail());        
        pst.setInt(2, n.getUser().getId());
        
        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean insertNewsletterWithoutUserId(Newsletter n) throws SQLException {
        String upit = "insert into newsletter (email) values(?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, n.getEmail());
        
        try {
            pst.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return true;
    }
    
    public static Reservation_query getNumberOfRowsForNotification() throws SQLException {
        String upit = "SELECT *, count(*) FROM reservation_query;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Reservation_query rq = new Reservation_query(rs.getInt(1), rs.getInt(11));
        return rq;
    }
    
        public static boolean checkReservationByRoomIdAndDeparrId(Reservation r) throws SQLException {
        String upit = "select count(*) from reservation where room_id= ? and departure_arrival_id= ? ;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, r.getRoom().getId());
        pst.setInt(2, r.getDeparturearrival().getId());

        ResultSet rs = pst.executeQuery();

        int N = 0;
        if (rs.next()) {
            N = rs.getInt(1);
        }
        return (N == 1) ? true : false;
    }
    

}
