package com.cykj.mapper;

import com.cykj.bean.Tblintention;
import com.cykj.query.RegionQuery;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IntentionMapper {
    //添加就业意向
    int addIntention(Tblintention tblintention);
    //查询所有就业意向
    List<Tblintention> queryAll();
    //多条件查询就业意向
    List<Tblintention> queryByCondition(RegionQuery regionQuery);
}
