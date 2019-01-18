package model;

import java.util.Date;

public class DepartureArrival {

    private int id;
    private Date departure;
    private Date arrival;

    public DepartureArrival() {
    }

    public DepartureArrival(int id) {
        this.id = id;
    }

    public DepartureArrival(int id, Date departure, Date arrival) {
        this.id = id;
        this.departure = departure;
        this.arrival = arrival;
    }

    public DepartureArrival(Date departure, Date arrival) {
        this.departure = departure;
        this.arrival = arrival;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDeparture() {
        return departure;
    }

    public void setDeparture(Date departure) {
        this.departure = departure;
    }

    public Date getArrival() {
        return arrival;
    }

    public void setArrival(Date arrival) {
        this.arrival = arrival;
    }
    
    
}
