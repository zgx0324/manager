package com.aishang.manager.service;

import com.aishang.manager.po.CategoryThird;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/18 11:17
 * @Description:
 */

public interface CategoryThirdService {
    //返回根据二级类目返回三级类目集合
    List<CategoryThird> getThirdCategoryByCsid(Integer csid);
    //添加
    void add(CategoryThird categoryThird);
    //修改
    boolean update(CategoryThird categoryThird);
    //验证三级类目名是否可用
    boolean checkCtname(String decode);
    //删除
    boolean del(Integer ctid);
}
