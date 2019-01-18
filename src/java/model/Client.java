package model;

public class Client {

    private int id;
    private String gender;
    private String firstname;
    private String lastname;
    private String passport;
    private String phone;
    private String street;
    private String city;
    private int house_n;
    private int age;
    

    public Client() {
    }

    public Client(int id) {
        this.id = id;
    }
    

    public Client(int id, String firstname, String lastname) {
        this.id = id;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public Client(String firstname, String lastname) {
        this.firstname = firstname;
        this.lastname = lastname;
    }
    
    

    public Client(int id, String gender, String firstname, String lastname, String passport, String phone, String street, String city, int house_n, int age) {
        this.id = id;
        this.gender = gender;
        this.firstname = firstname;
        this.lastname = lastname;
        this.passport = passport;
        this.phone = phone;
        this.street = street;
        this.city = city;
        this.house_n = house_n;
        this.age = age;
    }

    public Client(String gender, String firstname, String lastname, String passport, String phone, String street, String city, int house_n, int age) {
        this.gender = gender;
        this.firstname = firstname;
        this.lastname = lastname;
        this.passport = passport;
        this.phone = phone;
        this.street = street;
        this.city = city;
        this.house_n = house_n;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassport() {
        return passport;
    }

    public void setPassport(String passport) {
        this.passport = passport;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getHouse_n() {
        return house_n;
    }

    public void setHouse_n(int house_n) {
        this.house_n = house_n;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    
    
}
