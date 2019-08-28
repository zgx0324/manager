package com.aishang.manager.controller;

import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.service.CategoryService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 16:50
 * @Description:
 */
@Controller
@RequestMapping("/category.do")
public class CategoryController {
    //注入参数
    @Resource
    private CategoryService categoryService;
    //TODO 一级类目操作

    //ajax响应二级类目集合
    @RequestMapping("SecondCategory")
    @ResponseBody
    public String SecondCategory(Integer cid) {
        List<CategorySecond> categorySecondList =categoryService.getSecondCategoryByCid(cid);
        JSONArray jsonArray = JSONArray.fromObject(categorySecondList);
        return jsonArray.toString();
    }

    //ajax删除一级类目
    @RequestMapping("del")
    @ResponseBody
    public String del(Integer cid){
      boolean flag=categoryService.delCategory(cid);
        return flag+"";
    }

    //验证一级类目名是否可用
    @ResponseBody
    @RequestMapping("checkCname")
    public String checkCname(String cname){
       boolean flag=categoryService.checkCname(URLDecoder.decode(cname));
        return flag?"ok":"";
    }
    //修改一级类目
    @ResponseBody
    @RequestMapping("update")
    public String update(Category category){
        boolean flag=categoryService.update(category);
        return flag?"ok":"";
    }
    //添加一级类目
    @ResponseBody
    @RequestMapping("add")
    public String add(Category category){
        categoryService.add(category);
        return category.getCid()+"";
    }

    //TODO 跳转页面

    //去往类目管理页面
    @RequestMapping("toCategory")
    public String toCategory(Model model){
        model.addAttribute("categoryList",categoryService.findAll());
        return "category";
    }

}
