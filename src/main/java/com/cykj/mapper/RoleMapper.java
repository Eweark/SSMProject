package com.cykj.mapper;

import com.cykj.bean.Tblpower;
import com.cykj.bean.Tblrole;

import java.util.List;

public interface RoleMapper {
    //通过role查询角色查询权限码
    List<Tblpower> queryPowerByRoleId(int id);
    List<Tblrole> queryRole();




}
