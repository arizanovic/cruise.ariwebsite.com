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
import model.Reservation;
import model.Room;
import model.User;

public class CruiserTableQueries {
          
        public static ArrayList<Room> getFreeRoomsForDepArr(int deparr_id) 
                throws SQLException {
        ArrayList<Room> rooms = new ArrayList<Room>();
        String upit =   "select id, \"free\" from room where id not in (select r.id from reservation res join room r on r.id = res.room_id where res.departure_arrival_id = ?)\n" +
                        "union\n" +
                        "select r.id, \"reserved\" from reservation res join room r on r.id = res.room_id where res.departure_arrival_id = ?\n" +
                        "order by id asc;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, deparr_id);
        pst.setInt(2, deparr_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Room r = new Room(rs.getInt(1), rs.getString(2));
            rooms.add(r);
        }
        return rooms;
    }   
               
        
      
}
