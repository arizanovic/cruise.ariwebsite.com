package model;

public class Room {

    private int id;
    private int number;
    private int price;
    private String type;
    private int persons;
    private String free;

    public String getFree() {
        return free;
    }

    public Room(int id, String free) {
        this.id = id;
        this.free = free;
    }

    public Room(int id) {
        this.id = id;
    }
    
    

    public void setFree(String free) {
        this.free = free;
    }

    public Room(int id, int number, String free) {
        this.id = id;
        this.number = number;
        this.free = free;
    }
  
    public Room() {
    }

    public Room(int id, int number) {
        this.id = id;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
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

    public int getPersons() {
        return persons;
    }

    public void setPersons(int persons) {
        this.persons = persons;
    }

    public Room(int id, int number, int price, String type, int persons) {
        this.id = id;
        this.number = number;
        this.price = price;
        this.type = type;
        this.persons = persons;
    }

    public Room(int number, int price, String type, int persons) {
        this.number = number;
        this.price = price;
        this.type = type;
        this.persons = persons;
    }



  


}
