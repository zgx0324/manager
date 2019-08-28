package com.aishang.manager.service;

import com.aishang.manager.po.Admin;
import com.aishang.manager.po.AdminBean;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/12 16:48
 * @Description:
 */

public interface AdminService {
    //登录校验
    Admin doLogin(Admin admin);
    //验证用户名是否存在
    boolean checkUserName(String userName);
    //修改
    Boolean update(Admin admin);
    //分页集合
    List<Admin> getAdminList(AdminBean adminBean);
    //删除
    boolean del(Integer adminID);
    //添加
    boolean add(Admin admin);
}
