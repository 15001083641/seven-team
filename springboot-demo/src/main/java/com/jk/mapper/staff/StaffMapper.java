package com.jk.mapper.staff;

import com.jk.model.staff.StaffBean;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
@Mapper
@Component
public interface StaffMapper {



    @Delete("delete from t_staff where id =#{id}")
    void deleteOne(Integer id);

    @Insert("insert into t_staff (staffname,staffage,staffsex,staffinfo,staffhobby,staffeducation,staffimg,birthday) values (#{staffname},#{staffage},#{staffsex},#{staffinfo},#{staffhobby},#{staffeducation},#{staffimg},#{birthday})")
    void addInfo(StaffBean staffBean);

    /*void deleteAll(@Param("array") String[] array);*/

    @Delete("delete from t_staff where id =#{id}")
    void deleOne(Integer id);

    @Select("select * from t_staff where id =#{id}")
    StaffBean huiXian(Integer id);

    @Update("update t_staff set staffname=#{staffname},staffage=#{staffage},staffsex=#{staffsex},staffinfo=#{staffinfo},staffhobby=#{staffhobby},staffeducation=#{staffeducation},staffimg=#{staffimg},birthday=#{birthday} where id=#{id}")
    void updateInfo(StaffBean staffBean);

    @Select("select * from t_staff  limit #{tPage},#{tNumber}")
    List<StaffBean> queryStaffPage(@Param("tPage") Integer tPage, @Param("tNumber") Integer tNumber);

    @Select("select * from t_staff")
    List<StaffBean> queryStaffTwo();

    @Select("select * from t_staff limit #{page},#{limit}")
    List<StaffBean> queryStaffTwoPage(@Param("page") Integer page, @Param("limit") Integer limit);

    @Select("select count(1) from  t_staff")
    Integer queryStaff();

   /* @Delete("DELETE from t_staff WHERE  id in (${ids})")*/
   /* @Delete("DELETE FROM t_staff WHERE id IN" +
            "<foreach item='a'  collection='array' open='(' separator=',' close=')'>" +
            "#{a}" +
            "</foreach>")*/
   @Delete("DELETE from t_staff WHERE  id in (${ids})")
   void deleteAll(@Param("ids") String ids);

}
