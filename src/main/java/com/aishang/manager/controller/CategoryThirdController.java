package com.aishang.manager.controller;

import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.service.CategorySecondService;
import com.aishang.manager.service.CategoryService;
import com.aishang.manager.service.CategoryThirdService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 17:28
 * @Description:
 */
@Controller
@RequestMapping("/categoryThird.do")
public class CategoryThirdController {
    @Resource
    private CategorySecondService categorySecondService;
    @Resource
    private CategoryThirdService categoryThirdService;


    //ajax删除三级类目
    @RequestMapping("del")
    @ResponseBody
    public String del(Integer ctid){
        boolean flag=categoryThirdService.del(ctid);
        return flag+"";
    }

    //验证二级类目名是否可用
    @ResponseBody
    @RequestMapping("checkCtname")
    public String checkCtname(String ctname){
        boolean flag=categoryThirdService.checkCtname(URLDecoder.decode(ctname));
        return flag?"ok":"";
    }
    //修改二级类目
    @ResponseBody
    @RequestMapping("update")
    public String update(CategoryThird categoryThird){
        boolean flag=categoryThirdService.update(categoryThird);
        return flag?"ok":"";
    }
    //添加一级类目
    @ResponseBody
    @RequestMapping("add")
    public String add(CategoryThird categoryThird){
        System.out.println(categoryThird);
        categoryThirdService.add(categoryThird);
        return categoryThird.getCsid()+"";
    }


    //TODO 跳转页面

    //去往类目管理页面
    @RequestMapping("toCategoryThird")
    public String toCategoryThird(Model model,Integer csid){

        List<CategoryThird> categoryThirdList=categoryThirdService.getThirdCategoryByCsid(csid);
        CategorySecond categorySecond = categorySecondService.getCategorySecondByCsid(csid);

        model.addAttribute("categoryThirdList",categoryThirdList);
        model.addAttribute("categorySecond",categorySecond);
        return "categoryThird";
    }
}
