package com.cykj.mapper;

import com.cykj.bean.Tblpower;
import com.cykj.bean.Tblrolepower;

import java.util.List;

public interface RolePowerMapper {
    //查询所有权限
    List<Tblpower> selectAllRolePower();
    //添加权限
    int insertRolePower(Tblrolepower tblrolepower);
    //通过角色id查询权限
    List<Tblrolepower> queryPowerById(int roleId);
    //查询所有权限
    List<Tblpower> queryAllPower();
    //通过角色id和权限id查询rpid
    List<Tblrolepower> queryPowerId(Tblrolepower tblrolepower);
    //删除权限
    int delPower(int id);
}
