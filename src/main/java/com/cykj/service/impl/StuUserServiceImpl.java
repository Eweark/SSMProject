package com.cykj.service.impl;

import com.cykj.bean.User;
import com.cykj.mapper.StuUserMapper;
import com.cykj.service.StuUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class StuUserServiceImpl implements StuUserService {
    @Autowired
    private StuUserMapper stuUserMapper;
    @Override
    public int stuLogin(String acc, String pwd, HttpSession session) {
        User stu = stuUserMapper.findStu(acc, pwd);
        if (null != stu){
            System.out.println(stu.getUser_acc());
            System.out.println(stu.getUser_pwd());
            session.setAttribute("user",stu);
            return 1;
        }
        return 0;
    }

    @Override
    public int updatePwd(int id, String pwd) {
        int i = stuUserMapper.updatePwd(id, pwd);
        if (i > 0){
            return 1;
        }
        return 0;
    }
}
