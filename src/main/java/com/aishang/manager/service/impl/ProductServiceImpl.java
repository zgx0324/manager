package com.aishang.manager.service.impl;

import com.aishang.manager.mapper.*;
import com.aishang.manager.po.*;
import com.aishang.manager.service.ProductService;
import com.aishang.manager.util.PublicUtil;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/14 14:49
 * @Description:
 */
@Service
public class ProductServiceImpl implements ProductService {
    //TODO 注入参数
    @Resource
    private ProductMapper productMapper;
    @Resource
    private CategoryMapper categoryMapper;
    @Resource
    private CategoryThirdMapper categoryThirdMapper;
    @Resource
    private CategorySecondMapper categorySecondMapper;
    @Resource
    private ImageMapper imageMapper;


    //返回商品集合
    @Override
    public List<Product> getProductList(ProductBean productBean) {
        productBean.setTotalCount(productMapper.getToTalCount(productBean));
        return productMapper.getProductList(productBean);
    }

    @Override
    public List<Category> findAll() {
        return categoryMapper.findAll();
    }
    //修改商品为热门
    @Override
    public boolean updateIsHot(Product product) {
        if(product.getIsHot()==0||product.getIsHot()==null){
            product.setIsHot(1);
        }else {
            product.setIsHot(0);
        }
        productMapper.updateIsHot(product);
        return true;
    }
    //根据商品id获取商品信息
    @Override
    public Product getProductByID(Integer pid) {
        return productMapper.getProductByID(pid);
    }
    //根据三级类目id拿到这个类目集合
    @Override
    public List<CategoryThird> getCtlistByCtid(ProductExt product) {
        return categoryThirdMapper.getThirdCategoryByCsid(product.getCsid());
    }
    //根据三级类目id拿到二级类目集合
    @Override
    public List<CategorySecond> getCslistByCsid(ProductExt product) {
        return categorySecondMapper.getSecondCategoryByCid(product.getCid());
    }
    //根据商品id获取商品ProductBean
    @Override
    public ProductExt getProductBeanByID(Integer pid) {
        return productMapper.getProductBeanByID(pid);
    }

    //商品修改
    @Override
    public void updateProduct(MultipartFile[] files, ProductExt productExt, String realpath, MultipartFile file) {
        Product productByID = productMapper.getProductByID(productExt.getPid());
        //添加新上传图片
        addImage(files,productExt,realpath);
        if(file.getOriginalFilename().length()>0&&productByID.getImgPath()==null){
            //添加商品缩略图
            String upload = PublicUtil.upload(file, realpath);
            productExt.setImgPath(upload);
        }else{
            productExt.setImgPath(productByID.getImgPath());
        }
        //修改商品信息
       productMapper.update(productExt);
    }
    //商品添加
    @Override
    public void addProduct(MultipartFile[] files, ProductExt productExt, String realPath, MultipartFile file) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        productExt.setDate(sdf.format(date));
        if(file.getOriginalFilename()!=null&&file.getOriginalFilename().trim()!="") {
            //添加商品缩略图
            String upload = PublicUtil.upload(file, realPath);
            productExt.setImgPath(upload);
        }
        //添加商品信息
        productMapper.add(productExt);
        //添加新上传图片
        addImage(files,productExt,realPath);
    }
    //删除 商品
    @Override
    public void delProduct(Integer pid,String realPath) {
        //删除缩略图
        Product product = productMapper.getProductByID(pid);
        if(product!=null){
            if(product.getImgPath()!=null){
                PublicUtil.delPic(realPath + product.getImgPath());
            }
        }
        //删除数据库
        productMapper.del(pid);
        //删除图片
        List<Image> images = imageMapper.findImageByPid(pid);
        for (Image image : images) {
            delPic(image,realPath);
        }
    }
    //根据三级类目id获取商品数量
    @Override
    public Integer getCountByCtid(Integer ctid) {
        return productMapper.getCountByCtid(ctid);
    }
    //删除缩略图
    @Override
    public void delSuolue(Product product, String realPath) {
        //删除本地文件
        if(product.getImgPath()!=null){
            PublicUtil.delPic(realPath + product.getImgPath());
            productMapper.delImgPath(product);
        }
    }

    //根据商品id获取图片集合
    @Override
    public List<Image> getImages(Integer pid) {
        return imageMapper.findImageByPid(pid);
    }
    //删除图片
    @Override
    public void delPic(Image image,String realpath) {
        //删除数据库文件
        imageMapper.del(image);
        //删除本地文件
        PublicUtil.delPic(realpath + image.getPath());
    }



    //删除已有文件
    private void deleteImage(ProductExt productExt, String realpath){
        List<Image> images=imageMapper.findImageByPid(productExt.getPid());
        if(images.size()>0) {
            for (Image image : images) {
                //删除数据库文件
                imageMapper.del(image);
                //删除本地文件
                PublicUtil.delPic(realpath + image.getPath());
            }
        }
    }
    //添加图片
    private void addImage(MultipartFile[] files, ProductExt productExt, String realpath){
        if(files.length>0) {
            for (MultipartFile file : files) {
                if (file.getOriginalFilename() != null && !"".equals(file.getOriginalFilename().trim())) {
                    //遍历添加图片
                    String upload = PublicUtil.upload(file, realpath);
                    //添加到数据库
                    Image image = new Image();
                    image.setPid(productExt.getPid());
                    image.setName(file.getOriginalFilename());
                    image.setPath(upload);
                    imageMapper.add(image);
                }
            }
        }
    }
}
