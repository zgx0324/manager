package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.UserMapper;
import com.aishang.manager.po.User;
import com.aishang.manager.po.UserBean;
import com.aishang.manager.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 9:28
 * @Description:
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    //分页获取用户集合
    @Override
    public List<User> getUserList(UserBean userBean) {
        userBean.setTotalCount(userMapper.getTotalCount(userBean));
        return userMapper.getUserList(userBean);
    }
    //冻结与解冻账户
    @Override
    public Integer frozenUser(User user) {
        userMapper.frozenUser(user);
        return user.getState() ;
    }
}
