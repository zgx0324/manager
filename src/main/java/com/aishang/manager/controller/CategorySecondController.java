package com.aishang.manager.controller;

import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.service.CategorySecondService;
import com.aishang.manager.service.CategoryService;
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
@RequestMapping("/categorySecond.do")
public class CategorySecondController {
    @Resource
    private CategorySecondService categorySecondService;
    @Resource
    private CategoryService categoryService;

    //ajax响应三级类目集合
    @RequestMapping("thirdCategory")
    @ResponseBody
    public String thirdCategory(Integer csid) {
        List<CategoryThird> ctList =categorySecondService.getThirdCategoryByCsid(csid);
        JSONArray jsonArray = JSONArray.fromObject(ctList);
        return jsonArray.toString();
    }
    //ajax删除二级类目
    @RequestMapping("del")
    @ResponseBody
    public String del(Integer csid){
        boolean flag=categorySecondService.delCategorySecond(csid);
        return flag+"";
    }

    //验证二级类目名是否可用
    @ResponseBody
    @RequestMapping("checkCsname")
    public String checkCsname(String csname){
        System.out.println(URLDecoder.decode(csname)+"===========");
        boolean flag=categorySecondService.checkCname(URLDecoder.decode(csname));
        return flag?"ok":"";
    }
    //修改二级类目
    @ResponseBody
    @RequestMapping("update")
    public String update(CategorySecond categorySecond){
        boolean flag=categorySecondService.update(categorySecond);
        return flag?"ok":"";
    }
    //添加一级类目
    @ResponseBody
    @RequestMapping("add")
    public String add(CategorySecond categorySecond){
        categorySecondService.add(categorySecond);
        return categorySecond.getCid()+"";
    }


    //TODO 跳转页面

    //去往类目管理页面
    @RequestMapping("toCategorySecond")
    public String toCategory(Model model,Integer cid){
        List<CategorySecond> categorySecondList=categorySecondService.getSecondCategoryByCid(cid);
        Category category = categoryService.getCategoryByCid(cid);

        model.addAttribute("categorySecondList",categorySecondList);
        model.addAttribute("category",category);
        return "categorySecond";
    }
}
