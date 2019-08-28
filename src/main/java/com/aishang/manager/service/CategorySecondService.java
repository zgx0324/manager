package com.aishang.manager.service;

import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 17:30
 * @Description:
 */

public interface CategorySecondService {
    //根据二级级类目id返回二级类目集合
    List<CategoryThird> getThirdCategoryByCsid(Integer csid);

    //根据一级类目id返回二级类目集合
    List<CategorySecond> getSecondCategoryByCid(Integer cid);

    boolean checkCname(String csname);

    boolean update(CategorySecond categorySecond);

    void add(CategorySecond categorySecond);

    boolean delCategorySecond(Integer csid);
    //根据二级类目id查询二级类目对象
    CategorySecond getCategorySecondByCsid(Integer csid);
}
