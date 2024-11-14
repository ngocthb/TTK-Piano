/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Lenovo
 */
public class Cart {
    private Map<Integer, Course> cart;

    public Cart() {
    }

    public Cart(Map<Integer, Course> cart) {
        this.cart = cart;
    }

    public Map<Integer, Course> getCart() {
        return cart;
    }

    public void setCart(Map<Integer, Course> cart) {
        this.cart = cart;
    }
    
    public boolean addCart(Course course){
        boolean check = false;
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(course.getId())){
            int currentQuntity = this.cart.get(course.getId()).getQuantity();
            course.setQuantity(currentQuntity + course.getQuantity());
        }
        this.cart.put(course.getId(), course);
        check = true;
        return check;
    }
    
    public boolean removeCourse(int id){
        boolean check = false;
        if(this.cart!= null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
                check = true;
                if(this.cart.isEmpty()){
                    this.cart = null;
                }
            }
        }
        return check;
    }
    
    public boolean updateCourse(Course crs, int quantity){
        boolean check = false;
        if(this.cart.containsKey(crs.getId())){
            crs.setQuantity(quantity);
            this.cart.put(crs.getId(), crs);
            check = true;
        }
        return check;
    }
    
}
