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
public class UserError {
    private int id;
    private String fistname;
    private String lastname;
    private String email;
    private String avatar;
    private String username;
    private String password;
    private String confirm;
    private String address;
    private String phone;
    private boolean admin;
    private String errorMess;

    public UserError() {
        this.id = 0;
        this.fistname = "";
        this.lastname = "";
        this.email = "";
        this.avatar = "";
        this.username = "";
        this.password = "";
        this.confirm = "";
        this.address = "";
        this.phone = "";
        this.admin = false;
        this.errorMess = "";
    }

    public UserError(int id, String fistname, String lastname, String email, String avatar, String username, String password, String confirm, String address, String phone, boolean admin, String errorMess) {
        this.id = id;
        this.fistname = fistname;
        this.lastname = lastname;
        this.email = email;
        this.avatar = avatar;
        this.username = username;
        this.password = password;
        this.confirm = confirm;
        this.address = address;
        this.phone = phone;
        this.admin = admin;
        this.errorMess = errorMess;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFistname() {
        return fistname;
    }

    public void setFistname(String fistname) {
        this.fistname = fistname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
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

    public boolean isAdmin() {
        return admin;
    }

    public void setAdmin(boolean admin) {
        this.admin = admin;
    }

    public String getErrorMess() {
        return errorMess;
    }

    public void setErrorMess(String errorMess) {
        this.errorMess = errorMess;
    }

}