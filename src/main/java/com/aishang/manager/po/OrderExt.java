package com.aishang.manager.po;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/2/27 13:49
 * @Description: 订单扩展类，一个订单可以用多个订单项
 */

public class OrderExt extends Order {
    private List<OrderItemExt> orderItemExtsList;
    private Address address;
    private Pay pay;
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public Pay getPay() {
        return pay;
    }

    public void setPay(Pay pay) {
        this.pay = pay;
    }

    public List<OrderItemExt> getOrderItemExtsList() {
        return orderItemExtsList;
    }

    public void setOrderItemExtsList(List<OrderItemExt> orderItemExtsList) {
        this.orderItemExtsList = orderItemExtsList;
    }

    @Override
    public String toString() {
        return "OrderExt{" +
                "orderItemExtsList=" + orderItemExtsList +
                ", address=" + address +
                ", pay=" + pay +
                ", user=" + user +
                '}';
    }
}
