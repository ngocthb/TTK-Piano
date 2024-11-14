/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.model;

import java.sql.Date;

/**
 *
 * @author Lenovo
 */
public class Course {
    private int id;
    private String coursename;
    private int categoryid;
    private String description;
    private String images;
    private Date startdate;
    private Date enddate;
    private double price;
    private boolean status;
    private int quantity;
    
    public Course() {
    }

    public Course(int id, String coursename, int categoryid, String description, String images, Date startdate, Date enddate, double price, boolean status, int quantity) {
        this.id = id;
        this.coursename = coursename;
        this.categoryid = categoryid;
        this.description = description;
        this.images = images;
        this.startdate = startdate;
        this.enddate = enddate;
        this.price = price;
        this.status = status;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Course{" + "id=" + id + ", coursename=" + coursename + ", categoryid=" + categoryid + ", description=" + description + ", images=" + images + ", startdate=" + startdate + ", enddate=" + enddate + ", price=" + price + ", status=" + status + ", quantity=" + quantity + '}';
    }

    
}
