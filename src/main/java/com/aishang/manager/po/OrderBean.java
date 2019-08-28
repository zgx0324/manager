package com.aishang.manager.po;

/**
 * @Author: ZGX
 * @Date: 2019/3/11 15:17
 * @Description:
 */

public class OrderBean extends Pagebean {
    private OrderExt orderExt;
    private Integer selectState;
    private String selectOrderNumber;
    private String selectUserName;
    private String selectTel;

    public Integer getSelectState() {
        return selectState;
    }

    public void setSelectState(Integer selectState) {
        this.selectState = selectState;
    }

    public String getSelectOrderNumber() {
        return selectOrderNumber;
    }

    public void setSelectOrderNumber(String selectOrderNumber) {
        this.selectOrderNumber = selectOrderNumber;
    }

    public String getSelectUserName() {
        return selectUserName;
    }

    public void setSelectUserName(String selectUserName) {
        this.selectUserName = selectUserName;
    }

    public String getSelectTel() {
        return selectTel;
    }

    public void setSelectTel(String selectTel) {
        this.selectTel = selectTel;
    }

    public OrderExt getOrderExt() {
        return orderExt;
    }

    public void setOrderExt(OrderExt orderExt) {
        this.orderExt = orderExt;
    }

    @Override
    public String toString() {
        return "OrderBean{" +
                "orderExt=" + orderExt +
                ", selectState=" + selectState +
                ", selectOrderNumber='" + selectOrderNumber + '\'' +
                ", selectUserName='" + selectUserName + '\'' +
                ", selectTel='" + selectTel + '\'' +
                '}';
    }
}