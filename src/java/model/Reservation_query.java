package model;

import java.util.Date;

public class Reservation_query {
        
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
    private int count;

    
    
    public Reservation_query() {
    }

    public Reservation_query(int id) {
        this.id = id;
    }
    

    public Reservation_query(double price) {
        this.price = price;
    }

    public Reservation_query(int id, int count) {
        this.id = id;
        this.count = count;
    }
    
    

    public Reservation_query(int id, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price) {
        this.id = id;
        this.user = user;
        this.client = client;
        this.room = room;
        this.activity = activity;
        this.meal = meal;
        this.bank = bank;
        this.departurearrival = departurearrival;
        this.price = price;
    }
    
    

    public Reservation_query(int id, Date datetime, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price) {
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

    public Reservation_query(Date datetime, User user, Client client, Room room, Activity activity, Meal meal, Bank bank, DepartureArrival departurearrival, double price) {
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
    
    
}
