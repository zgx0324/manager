package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.AdminMapper;
import com.aishang.manager.po.Admin;
import com.aishang.manager.po.AdminBean;
import com.aishang.manager.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/12 16:51
 * @Description:
 */
@Service
public class AdminServiceImpl implements AdminService {
    //TODO 注入参数
    @Resource
    private AdminMapper adminMapper;

    //登录校验
    @Override
    public Admin doLogin(Admin admin) {
        return adminMapper.doLogin(admin);
    }
    //验证用户名是否存在
    @Override
    public boolean checkUserName(String userName) {
        Integer count = adminMapper.checkUserName(userName);
        return count==0?true:false;
    }
    //修改
    @Override
    public Boolean update(Admin admin) {
        adminMapper.update(admin);
        return true;
    }
    //分页集合
    @Override
    public List<Admin> getAdminList(AdminBean adminBean) {
        adminBean.setTotalCount(adminMapper.getTotalCount(adminBean));
        return adminMapper.getAdminList(adminBean);
    }
    //删除
    @Override
    public boolean del(Integer adminID) {
        adminMapper.del(adminID);
        return true;
    }
    //添加
    @Override
    public boolean add(Admin admin) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        admin.setDate(sdf.format(date));
        adminMapper.add(admin);
        return true;
    }
}
