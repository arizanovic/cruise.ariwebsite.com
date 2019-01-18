package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Client;
import model.User;

public class DBQueriesCRUD {
    
    //table user.jsp
    public static ArrayList<User> getUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        String upit = "select * from user;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            User u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
            users.add(u);
        }
        return users;
    }
//koristi se za javascript ispisivanje value u poljima update usera
    public static ArrayList<User> getUsersDataById(int user_id) 
                throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        String upit =   "select * from user where id=?";
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
    
    
    public static boolean insertUser(User newUser) throws SQLException {
        String upit = "insert into user (firstname, lastname, email, username, password, role, gender) values (?, ?, ?, ?, md5(?), ?, ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, newUser.getFirstname());
        pst.setString(2, newUser.getLastname());
        pst.setString(3, newUser.getEmail());
        pst.setString(4, newUser.getUsername());
        pst.setString(5, newUser.getPassword());
        pst.setString(6, newUser.getRole());
        pst.setString(7, newUser.getGender());

        try {
            pst.execute();
        } catch (SQLException ex) {
            System.out.println("Vec postoji korisnik sa tim username-om");
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean updateUser(User u) throws SQLException {
        String upit = "update user set firstname=?, lastname=?, email=?, username=?, password=md5(?), role=?, gender=? where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setString(1, u.getFirstname());
        pst.setString(2, u.getLastname());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getUsername());
        pst.setString(5, u.getPassword());
        pst.setString(6, u.getRole());
        pst.setString(7, u.getGender());
        pst.setInt(8, u.getId());

        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    //koristi se za update podataka bez passworda, da se nebi unosio md5, koji se enkriptuje u md5
    public static boolean updateUserWithoutPass(User u) throws SQLException {
        String upit = "update user set firstname=?, lastname=?, email=?, username=?, role=?, gender=? where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setString(1, u.getFirstname());
        pst.setString(2, u.getLastname());
        pst.setString(3, u.getEmail());
        pst.setString(4, u.getUsername());
        pst.setString(5, u.getRole());
        pst.setString(6, u.getGender());
        pst.setInt(7, u.getId());

        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean deleteUser(User u) throws SQLException {
        String upit = "delete from user where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setInt(1, u.getId());
        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    //table client.jsp
    public static ArrayList<Client> getClients() throws SQLException {
        ArrayList<Client> clients = new ArrayList<Client>();
        String upit = "select * from client;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Client c = new Client(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
            clients.add(c);
        }
        return clients;
    }
    
    //koristi se za javascript ispisivanje value u poljima update clienta
    public static Client getClientsDataById(int client_id) throws SQLException {
        String upit =   "select * from client where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, client_id);
        ResultSet rs = pst.executeQuery();
        rs.next();
        Client c = new Client(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
            return c;
    }
    
    
    public static ArrayList<Client> getAllClients(int client_id) 
                throws SQLException {
        ArrayList<Client> clients = new ArrayList<Client>();
        String upit = "select * from client where id=?";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        pst.setInt(1, client_id);
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            Client c = new Client(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getInt(9), rs.getInt(10));
            clients.add(c);
        }
        return clients;
    }   
    
    public static boolean insertClient(Client newClient) throws SQLException {
        String upit = "insert into client (gender, firstname, lastname, passport, phone, street, city, house_n, age) values (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);

        pst.setString(1, newClient.getGender());
        pst.setString(2, newClient.getFirstname());
        pst.setString(3, newClient.getLastname());
        pst.setString(4, newClient.getPassport());
        pst.setString(5, newClient.getPhone());
        pst.setString(6, newClient.getStreet());
        pst.setString(7, newClient.getCity());
        pst.setInt(8, newClient.getHouse_n());
        pst.setInt(9, newClient.getAge());
        

        try {
            pst.execute();
        } catch (SQLException ex) {
            System.out.println("Vec postoji Klijent sa tim username-om ili emailom");
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean updateClient(Client c) throws SQLException {
        String upit = "update client set gender=?, firstname=?, lastname=?, passport=?, phone=?, street=?, city=?, house_n=?, age=? where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setString(1, c.getGender());
        pst.setString(2, c.getFirstname());
        pst.setString(3, c.getLastname());
        pst.setString(4, c.getPassport());
        pst.setString(5, c.getPhone());
        pst.setString(6, c.getStreet());
        pst.setString(7, c.getCity());
        pst.setInt(8, c.getHouse_n());
        pst.setInt(9, c.getAge());
        pst.setInt(10, c.getId());

        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
    public static boolean deleteClient(Client c) throws SQLException {
        String upit = "delete from client where id=?;";
        Connection baza = DBConnection.getConn();
        PreparedStatement pst = baza.prepareStatement(upit);
        
        pst.setInt(1, c.getId());
        try {
            pst.execute();
        } catch (SQLException ex) {            
            ex.printStackTrace();
        }
        return true;
    }
    
}
