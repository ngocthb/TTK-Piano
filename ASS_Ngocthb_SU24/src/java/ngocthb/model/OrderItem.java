/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ngocthb.model;

import java.util.List;

/**
 *
 * @author Lenovo
 */
public class OrderItem {
    private int order_id;
    private List<Course> list;

    public OrderItem() {
    }

    public OrderItem(int order_id, List<Course> list) {
        this.order_id = order_id;
        this.list = list;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public List<Course> getList() {
        return list;
    }

    public void setList(List<Course> list) {
        this.list = list;
    }
    
    
}
