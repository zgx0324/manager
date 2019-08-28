package com.aishang.manager.mapper;

import com.aishang.manager.po.Product;
import com.aishang.manager.po.ProductBean;
import com.aishang.manager.po.ProductExt;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 14:50
 * @Description:
 */
@Mapper
public interface ProductMapper {

    //获取商品集合
    List<Product> getProductList(ProductBean productBean);
    //得到商品总记录数
    Integer getToTalCount(ProductBean productBean);
    //修改商品为热门
    void updateIsHot(Product product);
    //根据商品id获取商品信息
    Product getProductByID(Integer pid);
    //根据商品id获取商品ProductBean
    ProductExt getProductBeanByID(Integer pid);
    //修改商品
    void update(ProductExt productExt);
    //添加商品返回主键
    Integer add(ProductExt productExt);
    //删除数据库
    void del(Integer pid);
    //根据三级类目id获取商品数量
    Integer getCountByCtid(Integer ctid);

    void delImgPath(Product product);
}
