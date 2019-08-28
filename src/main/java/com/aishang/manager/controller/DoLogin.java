package com.aishang.manager.controller;

import com.aishang.manager.po.Admin;
import com.aishang.manager.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @Author: ZGX
 * @Date: 2019/3/12 13:56
 * @Description:
 */
@Controller
@RequestMapping("/")
public class DoLogin {
    //TODO 注入参数
    @Resource
    private AdminService adminService;
    @Resource
    private HttpSession session;
    // TODO 1，跳转登录页面
    @RequestMapping("login")
    public String login(String msg, Model model) {
        if (msg != null) {
            model.addAttribute("msg","账号或密码错误请重试");
        }
        return "login";
    }
    // TODO 2, 登录校验以及跳转主页

    @RequestMapping("doLogin")
    public String doLogin(Admin admin, String remember, HttpServletResponse response) {
        // 调用userService方法验证用户登录信息返回值为User对象

        Admin admin1= adminService.doLogin (admin);
        // 若User对象不为空意为登陆成功跳转index页，否则为登陆失败返回登录页
        if(admin1!=null){ //----------------------------登录成功
            // 创建session
            session.setAttribute("admin",admin1);
            // 创建cookie
            Cookie cookie1 = null;
            Cookie cookie2 = null;
            if (remember != null) {
                cookie1 = new Cookie("adminName",admin1.getUserName());
                cookie2 = new Cookie("adminWord",admin1.getPassWord());
                cookie1.setMaxAge(60*60*24*7);
                cookie2.setMaxAge(60*60*24*7);
                cookie1.setPath("/");
                cookie2.setPath("/");
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }else{
                cookie1 = new Cookie("userName",admin1.getUserName());
                cookie2 = new Cookie("passWord",admin1.getPassWord());
                cookie1.setMaxAge(0);
                cookie2.setMaxAge(0);
                cookie1.setPath("/");
                cookie2.setPath("/");
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }
            System.out.println("-------------------------------登陆成功");
            return "redirect:admin.do/index";
        }else { //----------------------------登录失败,返回login页
            System.out.println("-------------------------------登陆失败");
            return "redirect:login?msg=error";
        }

    }


    @RequestMapping("outLogin")
    public String outLogin(){
        session.removeAttribute("admin");
        return "login";
    }

}
