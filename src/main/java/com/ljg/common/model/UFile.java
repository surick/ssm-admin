package com.ljg.common.model;

import net.sf.json.JSONObject;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ${DESCRIPTION}
 *
 * @author w24164
 * @create 2018-02-09 14:24
 */
public class UFile implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long fid;
    private Long mid;
    private String fnum;
    private String fname;
    private String fver;
    private String fuser;
    private String fpath;
    private byte[] file;
    private Timestamp ftime;



    public UFile(){}
    public UFile(UFile file){
        this.fid = file.getFid();
        this.mid = file.getMid();
        this.fnum = file.getFnum();
        this.fname = file.getFname();
        this.fver = file.getFver();
        this.fuser = file.getFuser();
        this.fpath = file.getFpath();
        this.file = file.getFile();
        this.ftime = file.getFtime();
    }



    public String toString() {
        return JSONObject.fromObject(this).toString();
    }

   /* public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }*/

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getFnum() {
        return fnum;
    }

    public void setFnum(String fnum) {
        this.fnum = fnum;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getFver() {
        return fver;
    }

    public void setFver(String fver) {
        this.fver = fver;
    }

    public String getFuser() {
        return fuser;
    }

    public void setFuser(String fuser) {
        this.fuser = fuser;
    }

    public String getFpath() {
        return fpath;
    }

    public void setFpath(String fpath) {
        this.fpath = fpath;
    }



    public byte[] getFile() {
        return file;
    }

    public void setFile(byte[] file) {
        this.file = file;
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public Timestamp getFtime() {
        return ftime;
    }

    public void setFtime(Timestamp ftime) {
        this.ftime = ftime;
    }
}
