package com.cykj.service;

import javax.servlet.http.HttpSession;

public interface StuUserService {
    int stuLogin(String acc, String pwd, HttpSession session);
    int updatePwd(int id,String pwd);
}
