package com.aishang.manager.mapper;

import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategorySecondExt;
import com.aishang.manager.po.CategoryThird;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/2/19 8:49
 * @Description:
 *              一级类目mapper
 */
@Mapper
public interface CategorySecondMapper {

    //返回一级类目列表
     List<CategorySecondExt> findAllByCid(Integer cid);
    //根据一级类目返回二级类目列表
    List<CategorySecond> getSecondCategoryByCid(Integer cid);

    //检查二级类目名是否存在
    Integer checkCsname(String csname);
    //修改
    void update(CategorySecond categorySecond);
    //添加
    void add(CategorySecond categorySecond);
    //删除
    void del(Integer csid);
    //根据二级类目id查询二级类目对象
    CategorySecond getCategorySecondByCsid(Integer csid);
}
