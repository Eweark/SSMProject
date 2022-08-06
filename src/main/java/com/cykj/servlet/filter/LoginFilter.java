package com.cykj.servlet.filter;



import com.cykj.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登入过滤器
 */
@WebFilter("/view/power/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        User stu = (User) req.getSession().getAttribute("user");
        if(null != stu){
            chain.doFilter(request,response);
        }else{
            resp.sendRedirect(req.getContextPath()+"/view/login.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}
