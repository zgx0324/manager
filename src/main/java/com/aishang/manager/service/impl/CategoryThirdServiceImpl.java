package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.CategoryThirdMapper;
import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.service.CategoryThirdService;
import com.aishang.manager.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/18 11:18
 * @Description:
 */
@Service
public class CategoryThirdServiceImpl implements CategoryThirdService {

    @Resource
    private CategoryThirdMapper categoryThirdMapper;
    @Resource
    private ProductService productService;

    @Override
    public List<CategoryThird> getThirdCategoryByCsid(Integer csid) {
        return categoryThirdMapper.getThirdCategoryByCsid(csid);
    }

    @Override
    public void add(CategoryThird categoryThird) {
        categoryThirdMapper.add(categoryThird);
    }

    @Override
    public boolean update(CategoryThird categoryThird) {
        categoryThirdMapper.update(categoryThird);
        return true;
    }

    @Override
    public boolean checkCtname(String ctname) {
        Integer count=categoryThirdMapper.checkCtname(ctname);
        return count>0?false:true;
    }

    @Override
    public boolean del(Integer ctid) {
        Integer count = productService.getCountByCtid(ctid);
        if(count>0){
            return false;
        }else{
            categoryThirdMapper.del(ctid);
            return true;
        }
    }
}
