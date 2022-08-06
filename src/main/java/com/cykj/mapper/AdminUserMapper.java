package com.cykj.mapper;


import com.cykj.bean.Tbluser;

import java.util.List;

public interface AdminUserMapper {
    //登录方法
    List<Tbluser> login(Tbluser tbluser);
    //查询用户角色id
    int queryRoleId(String acc);


}
