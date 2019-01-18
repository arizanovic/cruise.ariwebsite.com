package model;
public class Suggestion {

    private int id;
    private String name;
    private String email;
    private String comment;
    private User user;

    public Suggestion() {
    }

    public Suggestion(int id) {
        this.id = id;
    }

    public Suggestion(int id, String name, String email, String comment, User user) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.comment = comment;
        this.user = user;
    }

    public Suggestion(String name, String email, String comment, User user) {
        this.name = name;
        this.email = email;
        this.comment = comment;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
    
}
