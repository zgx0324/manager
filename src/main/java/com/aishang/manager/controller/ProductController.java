package com.aishang.manager.controller;

import com.aishang.manager.po.*;
import com.aishang.manager.service.ProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 14:43
 * @Description:
 */
@Controller
@RequestMapping("/product.do")
public class ProductController {

    //注入service对象,根据类型来注入
    @Resource
    private ProductService productService;
    @Resource
    private HttpSession session;
    @Resource
    private ServletContext applicationContext;

    //TODO 跳转页面
    //去往商品管理页面
    @RequestMapping("toProduct")
    public String toProduct(Model model, ProductBean productBean) {

        List<Product> productList = productService.getProductList(productBean);
        List<Category> CategoryList = productService.findAll();

        model.addAttribute("productBean", productBean);
        model.addAttribute("CategoryList", CategoryList);//返回一级类目集合
        model.addAttribute("productList", productList);
        return "product";

    }

    //去往商品详情页
    @RequestMapping("detail")
    public String detail(Integer pid, Model model) {
        ProductExt productExt = productService.getProductBeanByID(pid);
        List<CategoryThird> ctList = productService.getCtlistByCtid(productExt);
        List<CategorySecond> csList = productService.getCslistByCsid(productExt);
        List<Image> images = productService.getImages(pid);
        model.addAttribute("images", images);
        model.addAttribute("product", productExt);
        model.addAttribute("ctList", ctList);//回显的三级类目集合
        model.addAttribute("csList", csList);//回显的二级类目集合
        model.addAttribute("CategoryList", productService.findAll());//返回一级类目集合
        return "productDetail";
    }
    //去往添加商品页面
    @RequestMapping("addProduct")
    public String addProduct(Model model){

        model.addAttribute("CategoryList", productService.findAll());//返回一级类目集合
        return "addProduct";
    }



    //TODO 商品操作

    //更改产品热门
    @RequestMapping("isHot")
    @ResponseBody
    public String isHot(Product product) {
        boolean flag = productService.updateIsHot(product);
        return flag + "";
    }
    //修改商品信息
    @RequestMapping("update")
    public String update(@RequestParam(value = "pic") MultipartFile files[], ProductExt productExt,@RequestParam(value = "suolue")MultipartFile file) {
        productService.updateProduct(files, productExt, applicationContext.getRealPath(""),file);
        return "redirect:/product.do/toProduct";
    }
    //ajax删除图片文件
    @RequestMapping("delPic")
    @ResponseBody
    public String delPic(Image image) {
        productService.delPic(image,applicationContext.getRealPath(""));
        return "ok";
    }
    @RequestMapping("delSuolue")
    @ResponseBody
    public String delSuolue(Product product) {
        System.out.println(product);
        productService.delSuolue(product,applicationContext.getRealPath(""));
        System.out.println("删除成功");
        return "ok";
    }
    //添加商品
    @RequestMapping("add")
    public String add(@RequestParam(value = "pic") MultipartFile files[], ProductExt productExt,@RequestParam(value = "suolue")MultipartFile file){
        productService.addProduct(files, productExt, applicationContext.getRealPath(""),file);
        return "redirect:/product.do/toProduct";
    }

    //下架商品
    @RequestMapping("del")
    @ResponseBody
    public String del(Integer pid){
        productService.delProduct(pid,applicationContext.getRealPath(""));
        return "ok";
    }


}
