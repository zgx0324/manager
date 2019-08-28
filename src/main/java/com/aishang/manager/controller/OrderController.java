package com.aishang.manager.controller;

import com.aishang.manager.po.Order;
import com.aishang.manager.po.OrderBean;
import com.aishang.manager.po.OrderExt;
import com.aishang.manager.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/18 14:12
 * @Description:
 */
@Controller
@RequestMapping("/order.do")
public class OrderController {
    @Resource
    private OrderService orderService;

    //TODO 跳转页面

    //跳转订单管理页面
    @RequestMapping("toOrder")
    public String toOrder(Model model, OrderBean orderBean){
        System.out.println(orderBean);
        orderBean.setPageSize(5);
        List<OrderExt> orderExtList = orderService.getOrderPageBeanList(orderBean);
        model.addAttribute("orderExtList",orderExtList);
        model.addAttribute("orderBean",orderBean);
        return "order";
    }
    @RequestMapping("changeState")
    @ResponseBody
    public String changeState(Order order){
        boolean flag=orderService.changeState(order);
        return flag?"ok":"";
    }
}
