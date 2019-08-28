package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.CategoryMapper;
import com.aishang.manager.mapper.CategorySecondMapper;
import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.service.CategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 16:53
 * @Description:
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private CategorySecondMapper categorySecondMapper;
    //根据一级类目id返回二级类目集合
    @Override
    public List<CategorySecond> getSecondCategoryByCid(Integer cid) {
        return categorySecondMapper.getSecondCategoryByCid(cid);
    }
    //返回一级类目列表
    @Override
    public List<Category> findAll() {
        return categoryMapper.findAll();
    }
    //删除一级类目
    @Override
    public boolean delCategory(Integer cid) {
        List<CategorySecond> secondCategoryByCid = categorySecondMapper.getSecondCategoryByCid(cid);
        if(secondCategoryByCid.size()>0){
            return false;
        }else {
            categoryMapper.del(cid);
            return true;
        }


    }
    //验证类目名是否可用
    @Override
    public boolean checkCname(String cname) {
        Integer count=categoryMapper.findName(cname);
        System.out.println(count);
        return count>0?false:true;
    }
    //修改
    @Override
    public boolean update(Category category) {
        categoryMapper.update(category);
        return true;
    }
    //添加
    @Override
    public Integer add(Category category) {
        Integer integer = categoryMapper.add(category);
        return integer;
    }
    //根据一级类目id查询一级类目对象
    @Override
    public Category getCategoryByCid(Integer cid) {
        return categoryMapper.getCategoryByCid(cid);
    }

}
