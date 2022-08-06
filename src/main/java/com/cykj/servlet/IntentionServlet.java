package com.cykj.servlet;

import com.alibaba.fastjson.JSON;
import com.cykj.bean.AreaBean;
import com.cykj.bean.Tblintention;
import com.cykj.bean.User;
import com.cykj.query.IntentionQuery;
import com.cykj.service.IntentionService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/Intention")
public class IntentionServlet extends BaseServlet {
    @Autowired
    private IntentionService intentionService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        PrintWriter writer = resp.getWriter();
        switch (action){
            case "addIntention":
                addIntention(req,resp,writer);
                break;
            case "selAllIntention":
                selAllIntention(req,resp,writer);
                break;
            case "searchLike":
                selectLikeRegion(req,resp,writer);
                break;
        }
    }

    /**
     * 模糊查询
     * @param req
     * @param resp
     * @param writer
     */
    private void selectLikeRegion(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        int pageCurr = Integer.parseInt(req.getParameter("pageCurr"));
        String nameInput = req.getParameter("nameInput");
        int province = Integer.parseInt(req.getParameter("province"));
        int city = Integer.parseInt(req.getParameter("city"));
        int county = Integer.parseInt(req.getParameter("county"));
        int minMoney = Integer.parseInt(req.getParameter("minMoney"));
        int maxMoney = Integer.parseInt(req.getParameter("maxMoney"));
        IntentionQuery intentionQuery = new IntentionQuery(nameInput,province,city,county,minMoney,maxMoney);
        List<Tblintention> nowList = intentionService.queryLikeList(intentionQuery, pageCurr);
        List<AreaBean> areaList = intentionService.queryRegion(nowList);
        int pageCount = intentionService.queryLikeCount(intentionQuery);
        Map<String,Object> map = new HashMap<>();
        map.put("intentionList",nowList);
        map.put("areaList",areaList);
        map.put("pageCount",pageCount);
        writer.println(JSON.toJSONString(map));
    }

    /**
     *  查询所有就业去向
     * @param req
     * @param resp
     * @param writer
     */
    private void selAllIntention(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        String pageCurr = req.getParameter("pageCurr");
        List<Tblintention> nowList = intentionService.queryNowList(Integer.parseInt(pageCurr));
        List<AreaBean> areaList = intentionService.queryRegion(nowList);
        int pageCount = intentionService.queryCount();
        Map<String,Object> map = new HashMap<>();
        map.put("intentionList",nowList);
        map.put("areaList",areaList);
        map.put("pageCount",pageCount);
        writer.println(JSON.toJSONString(map));
    }

    /**
     *  添加就业去向
     * @param req
     * @param resp
     * @param writer
     */
    private void addIntention(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        int county = Integer.parseInt(req.getParameter("county"));
        String company = req.getParameter("company");
        String minMoney = req.getParameter("minMoney");
        String maxMoney = req.getParameter("maxMoney");
        User user = (User) req.getSession().getAttribute("user");
        Tblintention tblintention = new Tblintention(-1,county,user.getId(),user.getTrueName(),company,Integer.parseInt(minMoney),Integer.parseInt(maxMoney));
        int i = intentionService.insertIntention(tblintention);
        if (i > 0){
            writer.println(1);
        }else {
            writer.println(0);
        }
    }
}
