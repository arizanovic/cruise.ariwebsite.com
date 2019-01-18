package model;

public class Meal {

    private int id;
    private int price;
    private String type;

    public Meal() {
    }

    public Meal(int id) {
        this.id = id;
    }

    public Meal(int id, int price, String type) {
        this.id = id;
        this.price = price;
        this.type = type;
    }

    public Meal(int price, String type) {
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
