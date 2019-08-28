package com.aishang.manager.controller;

import com.aishang.manager.po.Admin;
import com.aishang.manager.po.AdminBean;
import com.aishang.manager.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/13 8:52
 * @Description:
 */
@Controller
@RequestMapping("/admin.do")
public class AdminController {
    // TODO 注入参数
    @Resource
    private AdminService adminService;
    @Resource
    private HttpSession session;
    //去往主页
    @RequestMapping("index")
    public String index(){
        return "index";
    }

    //去往个人信息页面
    @RequestMapping("aboutMe")
    public String aboutMe(){
        return "aboutMe";
    }

    //去往管理员管理页面
    @RequestMapping("toManager")
    public String toManager(Model model, AdminBean adminBean){
        //若查询条件参数不为空为其去空格
        if(adminBean!=null){
            if(adminBean.getsUserName()!=null){
                adminBean.setsUserName(adminBean.getsUserName().trim());
            }
        }
        adminBean.setPageSize(10);
        List<Admin> adminList = adminService.getAdminList(adminBean);

        model.addAttribute("adminList",adminList);
        model.addAttribute("adminBean",adminBean);
        return "manager";
    }
    //去往新增管理员页面
    @RequestMapping("addManager")
    public String addManager(){
        return "addManager";
    }
    //检查用户名是否重复
    @RequestMapping("checkUserName")
    @ResponseBody
    public String checkUserName(String userName){
        boolean flag=adminService.checkUserName(userName);
        return flag?"ok":"false";
    }

    //修改个人信息
    @RequestMapping("updateAdmin")
    @ResponseBody
    public String updateAdmin(Admin admin){
        Admin admin1 = (Admin) session.getAttribute("admin");
        Boolean flag= adminService.update(admin);
        if(flag){
            admin.setDate(admin1.getDate());
            session.setAttribute("admin",admin);
        }
        return flag?"ok":"false";
    }

    //修改用户权限
    @RequestMapping("update")
    @ResponseBody
    public String update(Admin admin){
        boolean flag=adminService.update(admin);
        return flag?"ok":"false";
    }

    //删除
    @RequestMapping("del")
    @ResponseBody
    public String del(Integer adminID){
        boolean flag=adminService.del(adminID);
        return flag?"ok":"false";
    }
    //添加用户
    @RequestMapping("add")
    @ResponseBody
    public String add(Admin admin){
        boolean flag=adminService.add(admin);
        return flag?"ok":"false";
    }

}
