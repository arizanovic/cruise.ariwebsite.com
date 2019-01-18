package model;

public class Activity {

    private int id;
    private int price;
    private String type;

    public Activity() {
    }

    public Activity(int id) {
        this.id = id;
    }
    

    public Activity(int id, int price, String type) {
        this.id = id;
        this.price = price;
        this.type = type;
    }

    public Activity(int price, String type) {
        this.price = price;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    
}
