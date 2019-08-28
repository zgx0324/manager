package com.aishang.manager.po;

/**
 * @Author: ZGX
 * @Date: 2019/3/12 13:52
 * @Description:
 *              后台用户po类
 */

public class Admin {
    private Integer adminID;
    private String userName;
    private String passWord;
    private Integer power;
    private String date;

    public Integer getAdminID() {
        return adminID;
    }

    public void setAdminID(Integer adminID) {
        this.adminID = adminID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public Integer getPower() {
        return power;
    }

    public void setPower(Integer power) {
        this.power = power;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminID=" + adminID +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", power=" + power +
                ", date='" + date + '\'' +
                '}';
    }
}
