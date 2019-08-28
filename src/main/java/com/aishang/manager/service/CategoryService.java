package com.aishang.manager.service;

import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 16:53
 * @Description:
 */

public interface CategoryService {
    //根据一级类目id返回二级类目集合
    List<CategorySecond> getSecondCategoryByCid(Integer cid);

    //返回一级类目列表
    List<Category> findAll();

    //删除一级类目
    boolean delCategory(Integer cid);
    //验证类目名是否可用
    boolean checkCname(String cname);
    //修改
    boolean update(Category category);
    //添加
    Integer add(Category category);


    //根据一级类目id查询一级类目对象
    Category getCategoryByCid(Integer cid);
}
