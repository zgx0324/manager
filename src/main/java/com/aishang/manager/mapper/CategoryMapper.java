package com.aishang.manager.mapper;

import com.aishang.manager.po.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/2/19 8:49
 * @Description:
 *              一级类目mapper
 */
@Mapper
public interface CategoryMapper {

    //返回一级类目列表
     List<Category> findAll();

    //删除一级类目
    void del(Integer cid);
    //验证用户名是否可用
    Integer findName(String cname);
    //修改
    void update(Category category);
    //添加
    Integer add(Category category);

    //根据一级类目id查询一级类目对象
    Category getCategoryByCid(Integer cid);
}
