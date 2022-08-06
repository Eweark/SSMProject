package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.cykj.bean.Tblregion;
import com.cykj.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/region")
public class RegionServlet extends BaseServlet {
    @Autowired
    private RegionService regionService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        PrintWriter writer = resp.getWriter();
        switch (action){
            case "findAllRegion":
                findAllRegion(req,resp,writer);
                break;
        }
    }

    private void findAllRegion(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        List<Tblregion> regionList = regionService.queryAllRegion();
        writer.println(JSON.toJSONString(regionList));
    }
}
