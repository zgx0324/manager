package com.aishang.manager.mapper;

import com.aishang.manager.po.OrderItemExt;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/1 16:18
 * @Description: 订单项mapper
 */
@Mapper
public interface OrderItemMapper {

    // 根据订单ID查询订单项集合
    List<OrderItemExt> getOrderitemListByOid(Integer oid);

}
