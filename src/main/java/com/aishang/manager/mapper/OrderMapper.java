package com.aishang.manager.mapper;

import com.aishang.manager.po.Order;
import com.aishang.manager.po.OrderBean;
import com.aishang.manager.po.OrderExt;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/1 15:58
 * @Description:
 */
@Mapper
public interface OrderMapper {

    //添加订单
    void addOrder(OrderExt orderExt);
    //获取oid
    Integer getOid(OrderExt orderExt);

    //根据单号查询订单
    List<Order> getOrderByOrderNumber(String orderNumber);

    // 根据订单oid 查询并返回OrderExt对象
    OrderExt getOrderByoid(Integer oid);

    // 修改订单支付状态
    void updatePayIDByOid(Order order);

    //返回以state字段为四种订单状态所定义的map集合
    List<OrderExt> getOrderByState(Integer state);
    //删除订单
    void delOrder(Integer parseInt);




    //分页查询历史订单
    List<OrderExt> getOrderPageBeanList(OrderBean orderBean);
    //order总数
    Integer getTotalCount(OrderBean orderBean);
    //更改发货状态
    void changeState(Order order);
}
