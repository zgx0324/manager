package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.OrderItemMapper;
import com.aishang.manager.mapper.OrderMapper;
import com.aishang.manager.mapper.ProductMapper;
import com.aishang.manager.po.*;
import com.aishang.manager.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/18 15:07
 * @Description:
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private ProductMapper productMapper;
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private OrderItemMapper orderItemMapper;

    //分页查询历史订单
    @Override
    public List<OrderExt> getOrderPageBeanList(OrderBean orderBean) {
       // 得到该用户的订单总数
        orderBean.setTotalCount(orderMapper.getTotalCount(orderBean));
        // 返回历史订单集合
        List<OrderExt> orderPageBeanList = orderMapper.getOrderPageBeanList(orderBean);
     /*   for (OrderExt orderExt : orderPageBeanList) {
          orderExt.setOrderItemExtsList(orderItemMapper.getOrderitemListByOid(orderExt.getOid()));
            System.out.println(orderExt);
        }*/
        return orderPageBeanList;
    }

    @Override
    public boolean changeState(Order order) {
        orderMapper.changeState(order);
        return true;
    }
}
