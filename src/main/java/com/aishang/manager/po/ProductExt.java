package com.aishang.manager.po;

import java.util.List;

/**
 * @Author: ZGX
 * @Date: 2019/3/15 16:20
 * @Description:
 */

public class ProductExt extends Product {
    private Integer csid;
    private Integer cid;
    private List<Image> imageList;

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }
}
