package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.CategorySecondMapper;
import com.aishang.manager.mapper.CategoryThirdMapper;
import com.aishang.manager.po.Category;
import com.aishang.manager.po.CategorySecond;
import com.aishang.manager.po.CategoryThird;
import com.aishang.manager.service.CategorySecondService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 17:30
 * @Description:
 */
@Service
public class CategorySecondServiceImpl implements CategorySecondService {
    @Resource
    private CategorySecondMapper categorySecondMapper;
    @Resource
    private CategoryThirdMapper categoryThirdMapper;
    //根据二级级类目id返回二级类目集合
    @Override
    public List<CategoryThird> getThirdCategoryByCsid(Integer csid) {
        return categoryThirdMapper.getThirdCategoryByCsid(csid);
    }
    //根据一级类目id返回二级类目集合
    @Override
    public List<CategorySecond> getSecondCategoryByCid(Integer cid) {
        return categorySecondMapper.getSecondCategoryByCid(cid);
    }
    //验证二级类目名
    @Override
    public boolean checkCname(String csname) {
        return categorySecondMapper.checkCsname(csname)>0?false:true;
    }

    @Override
    public boolean update(CategorySecond categorySecond) {
        categorySecondMapper.update(categorySecond);
        return true;
    }

    @Override
    public void add(CategorySecond categorySecond) {
        categorySecondMapper.add(categorySecond);
    }

    @Override
    public boolean delCategorySecond(Integer csid) {
        Integer count=categoryThirdMapper.getCountCategorythird(csid);
        if(count>0){
            return false;
        }else{
            categorySecondMapper.del(csid);
            return true;
        }

    }
    //根据二级类目id查询二级类目对象
    @Override
    public CategorySecond getCategorySecondByCsid(Integer csid) {
        return categorySecondMapper.getCategorySecondByCsid(csid);
    }
}
