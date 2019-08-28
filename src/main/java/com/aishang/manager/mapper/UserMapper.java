package com.aishang.manager.mapper;

import com.aishang.manager.po.User;
import com.aishang.manager.po.UserBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 9:37
 * @Description:
 */
@Mapper
public interface UserMapper {

    //分页获取用户集合
    List<User> getUserList(UserBean userBean);
    //获取分页用户集合的总数
    Integer getTotalCount(UserBean userBean);
    //冻结与解冻账户
    Integer frozenUser(User user);
}
