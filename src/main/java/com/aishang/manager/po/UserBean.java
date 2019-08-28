package com.aishang.manager.po;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 9:32
 * @Description:
 */

public class UserBean extends Pagebean {
    private String sUserName;
    private Integer sState;



    public String getsUserName() {
        return sUserName;
    }

    public void setsUserName(String sUserName) {
        this.sUserName = sUserName;
    }


    public Integer getsState() {
        return sState;
    }

    public void setsState(Integer sState) {
        this.sState = sState;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "sUserName='" + sUserName + '\'' +
                ", sState=" + sState +
                '}';
    }
}
