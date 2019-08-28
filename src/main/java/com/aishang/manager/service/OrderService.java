package com.aishang.manager.service;

import com.aishang.manager.po.Order;
import com.aishang.manager.po.OrderBean;
import com.aishang.manager.po.OrderExt;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/18 15:06
 * @Description:
 */

public interface OrderService {

    //分页查询订单
    List<OrderExt> getOrderPageBeanList(OrderBean orderBean);
    //更改为已发货
    boolean changeState(Order order);
}
