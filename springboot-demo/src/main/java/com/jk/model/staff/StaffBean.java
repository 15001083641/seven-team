package com.jk.model.staff;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StaffBean implements Serializable {

    private Integer id;

    private String staffname;

    private Integer staffage;

    private Integer staffsex;

    private String staffinfo;

    private String staffhobby;

    private Integer staffeducation;

    private String staffimg;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;

    public String getBirthday() {
        if(birthday==null){
            return null;
        }
        SimpleDateFormat sim= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sim.format(birthday);
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStaffname() {
        return staffname;
    }

    public void setStaffname(String staffname) {
        this.staffname = staffname;
    }

    public Integer getStaffage() {
        return staffage;
    }

    public void setStaffage(Integer staffage) {
        this.staffage = staffage;
    }

    public Integer getStaffsex() {
        return staffsex;
    }

    public void setStaffsex(Integer staffsex) {
        this.staffsex = staffsex;
    }

    public String getStaffinfo() {
        return staffinfo;
    }

    public void setStaffinfo(String staffinfo) {
        this.staffinfo = staffinfo;
    }

    public String getStaffhobby() {
        return staffhobby;
    }

    public void setStaffhobby(String staffhobby) {
        this.staffhobby = staffhobby;
    }

    public Integer getStaffeducation() {
        return staffeducation;
    }

    public void setStaffeducation(Integer staffeducation) {
        this.staffeducation = staffeducation;
    }

    public String getStaffimg() {
        return staffimg;
    }

    public void setStaffimg(String staffimg) {
        this.staffimg = staffimg;
    }

    @Override
    public String toString() {
        return "StaffBean{" +
                "id=" + id +
                ", staffname='" + staffname + '\'' +
                ", staffage=" + staffage +
                ", staffsex=" + staffsex +
                ", staffinfo='" + staffinfo + '\'' +
                ", staffhobby='" + staffhobby + '\'' +
                ", staffeducation=" + staffeducation +
                ", staffimg='" + staffimg + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
