package com.cykj.mapper;

import com.cykj.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface StuUserMapper {
    User findStu(@Param("acc") String acc , @Param("pwd") String pwd);
    List<User> queryByAcc(@Param("acc") String acc);
    int updatePwd(@Param("id")int id,@Param("pwd")String pwd);
}
