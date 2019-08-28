package com.aishang.manager.mapper;

import com.aishang.manager.po.Admin;
import com.aishang.manager.po.AdminBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/12 16:53
 * @Description:
 */
@Mapper
public interface AdminMapper {

    //登录校验
    Admin doLogin(Admin admin);
    //验证用户名是否存在
    Integer checkUserName(String userName);
    //修改
    void update(Admin admin);

    //分页获取用户集合
    List<Admin> getAdminList(AdminBean adminBean);
    //获取分页用户集合的总数
    Integer getTotalCount(AdminBean adminBean);
    //删除
    void del(Integer adminID);
    //添加
    void add(Admin admin);
}
