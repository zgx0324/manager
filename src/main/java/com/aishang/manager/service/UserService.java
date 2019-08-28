package com.aishang.manager.service;

import com.aishang.manager.po.User;
import com.aishang.manager.po.UserBean;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 9:27
 * @Description:
 */

public interface UserService {
    //分页获取用户集合
    List<User> getUserList(UserBean userBean);
    //冻结与解冻账户
    Integer frozenUser(User user);
}
