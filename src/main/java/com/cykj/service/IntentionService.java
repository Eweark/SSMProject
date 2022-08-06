package com.cykj.service;

import com.cykj.bean.AreaBean;
import com.cykj.bean.Tblintention;
import com.cykj.query.IntentionQuery;

import java.util.List;

public interface IntentionService {
    //查询数据（分页版）
    List<Tblintention>queryNowList(int pageCurr);
    //查询省市区
    List<AreaBean> queryRegion(List<Tblintention> list);
    //查询总页数
    int queryCount();
    //模糊查询数据
    List<Tblintention> queryLikeList(IntentionQuery intentionQuery,int pageCurr);
    //查询模糊查询的总页数
    int queryLikeCount(IntentionQuery intentionQuery);
    //添加就业意向
    int insertIntention(Tblintention tblintention);

}
