package com.aishang.manager.service;


import com.aishang.manager.po.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface ProductService {

    //返回集合
    List<Product> getProductList(ProductBean productBean);

    //返回一级类目列表
    List<Category> findAll();

    //修改商品为热门
    boolean updateIsHot(Product product);

    //根据商品id获取商品信息
    Product getProductByID(Integer pid);
    //根据三级类目id拿到这个类目集合
    List<CategoryThird> getCtlistByCtid(ProductExt product);
    //根据三级类目id拿到二级类目集合
    List<CategorySecond> getCslistByCsid(ProductExt product);
    //根据商品id获取商品ProductBean
    ProductExt getProductBeanByID(Integer pid);

    //修改商品信息
    void updateProduct(MultipartFile[] files, ProductExt productExt, String realpath, MultipartFile file);
    //根据商品id获取图片集合
    List<Image> getImages(Integer pid);
    //删除图片
    void delPic(Image image,String realpath);
    //添加商品
    void addProduct(MultipartFile[] files, ProductExt productExt, String realPath, MultipartFile file);
    //删除 商品
    void delProduct(Integer pid,String realPath);
    //根据三级类目id获取商品数量
    Integer getCountByCtid(Integer ctid);
    //删除缩略图
    void delSuolue(Product product, String realPath);
}
