package com.ljg.common.model;

import net.sf.json.JSONObject;

import java.io.Serializable;

/**
 * model实体类
 *
 * @author w24164
 * @create 2018-02-08 14:58
 */
public class UModel implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long mid;
    private String mname;
    private Long gid;

    public UModel(){}
    public UModel(UModel model){
        this.mid = model.getMid();
        this.mname = model.getMname();
        this.gid = model.getGid();
    }


    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Long getGid() {
        return gid;
    }

    public void setGid(Long gid) {
        this.gid = gid;
    }

    public String toString() {
        return JSONObject.fromObject(this).toString();
    }
}
