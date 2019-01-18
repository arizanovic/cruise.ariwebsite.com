package model;
public class Newsletter {
    private int id;
    private String email;
    private User user;

    public Newsletter() {
    }

    public Newsletter(int id, String email, User user) {
        this.id = id;
        this.email = email;
        this.user = user;
    }

    public Newsletter(String email, User user) {
        this.email = email;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
 
    
}
