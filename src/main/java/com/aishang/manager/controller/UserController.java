package com.aishang.manager.controller;

import com.aishang.manager.po.User;
import com.aishang.manager.po.UserBean;
import com.aishang.manager.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 9:13
 * @Description:
 */
@Controller
@RequestMapping("/user.do")
public class UserController {
    //TODO 注入参数
    @Resource
    private UserService userService;

    //去往用户管理页面
    @RequestMapping("toUser")
    public String toUser(Model model, UserBean userBean){
        //若查询条件参数不为空为其去空格
        if(userBean!=null){
            if(userBean.getsUserName()!=null){
                userBean.setsUserName(userBean.getsUserName().trim());
            }
        }

        userBean.setPageSize(10);
        List<User> userList=userService.getUserList(userBean);

        model.addAttribute("userList",userList);
        model.addAttribute("userBean",userBean);
        return "user";
    }

    @RequestMapping("frozen")
    @ResponseBody
    public String frozen(User user){
      if(user.getState()==1){
          user.setState(0);
      }else{
          user.setState(1);
      }
        Integer state = userService.frozenUser(user);
        return state==1?"解冻成功":"冻结成功";
    }
}
