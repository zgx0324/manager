package com.aishang.manager.mapper;

import com.aishang.manager.po.Image;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/16 10:39
 * @Description:
 */
@Mapper
public interface ImageMapper {
    //根据商品id查找图片集合
    List<Image> findImageByPid(Integer pid);
    //删除图片
    void del(Image image);
    //添加图片
    void add(Image image);
}
