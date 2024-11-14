/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.model;

/**
 *
 * @author Lenovo
 */
public class UserDTO {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String avatar;
    private String userName;
    private String password;
    private String address;
    private String phone;
    private boolean isadmin;
    
    public UserDTO() {
        this.id = 0;
        this.firstName = "";
        this.lastName = "";
        this.email = "";
        this.avatar = "";
        this.userName = "";
        this.password = "";
        this.address = "";
        this.phone = "";
        this.isadmin = false;
    }

    public UserDTO(int id, String firstName, String lastName, String email, String avatar, String userName, String password, String address, String phone, boolean isadmin) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.avatar = avatar;
        this.userName = userName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.isadmin = isadmin;
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isIsadmin() {
        return isadmin;
    }

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

   

    
    
    
    
}
