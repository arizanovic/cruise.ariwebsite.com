package model;

import java.util.Date;

public class Reservation {
    private int id;
    private Date datetime;
    private User user;
    private Client client;
    private Room room;
    private Activity activity;
    private Meal meal;
    private Bank bank;
    private DepartureArrival departurearrival;
    private double price;
    private Reservation_query reservation_query;

    public Reservation() {
    }

    public Reservation(Reservation_query reservation_query) {
        this.reservation_query = reservation_query;
    }

    public Reservation(int id) {
        this.id = id;
    }

    public Reservation(int id, Date datetime, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price) {
        this.id = id;
        this.datetime = datetime;
        this.user = user;
        this.client = client;
        this.room = room;
        this.activity = activity;
        this.meal = meal;
        this.bank = bank;
        this.departurearrival = departurearrival;
        this.price = price;
    }
    
    
     

    public Reservation(int id, Date datetime, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price, Reservation_query reservation_query) {
        this.id = id;
        this.datetime = datetime;
        this.user = user;
        this.client = client;
        this.room = room;
        this.activity = activity;
        this.meal = meal;
        this.bank = bank;
        this.departurearrival = departurearrival;
        this.price = price;
        this.reservation_query = reservation_query;
    }

    public Reservation(Date datetime, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price, Reservation_query reservation_query) {
        this.datetime = datetime;
        this.user = user;
        this.client = client;
        this.room = room;
        this.activity = activity;
        this.meal = meal;
        this.bank = bank;
        this.departurearrival = departurearrival;
        this.price = price;
        this.reservation_query = reservation_query;
    }

    public Reservation(int id, Date datetime, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, User user, double price) {
        this.id = id;
        this.datetime = datetime;
        this.client = client;
        this.room = room;
        this.activity = activity;
        this.meal = meal;
        this.bank = bank;
        this.departurearrival = departurearrival;
        this.user = user;       
        this.price = price;
    }

    public Reservation_query getReservation_query() {
        return reservation_query;
    }

    public void setReservation_query(Reservation_query reservation_query) {
        this.reservation_query = reservation_query;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Activity getActivity() {
        return activity;
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
    }

    public Meal getMeal() {
        return meal;
    }

    public void setMeal(Meal meal) {
        this.meal = meal;
    }

    public Bank getBank() {
        return bank;
    }

    public void setBank(Bank bank) {
        this.bank = bank;
    }

    public DepartureArrival getDeparturearrival() {
        return departurearrival;
    }

    public void setDeparturearrival(DepartureArrival departurearrival) {
        this.departurearrival = departurearrival;
    }


}
