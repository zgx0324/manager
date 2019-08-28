package com.aishang.manager.mapper;

import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.po.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 17:35
 * @Description:
 */
@Mapper
public interface CategoryThirdMapper {

    // 根据二级级类目id返回三级类目集合
    List<CategoryThird> getThirdCategoryByCsid(Integer csid);
    //根据三级类目id拿到这个二级类目id
    Integer getCsidByCtid(Product product);

    Integer getCountCategorythird(Integer csid);

    void add(CategoryThird categoryThird);

    void update(CategoryThird categoryThird);


    void del(Integer ctid);

    Integer checkCtname(String ctname);
}
