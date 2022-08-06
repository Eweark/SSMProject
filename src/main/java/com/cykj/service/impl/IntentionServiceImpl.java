package com.cykj.service.impl;

import com.cykj.bean.AreaBean;
import com.cykj.bean.Tblintention;
import com.cykj.bean.Tblregion;
import com.cykj.mapper.IntentionMapper;
import com.cykj.mapper.RegionMapper;
import com.cykj.query.IntentionQuery;
import com.cykj.query.RegionQuery;
import com.cykj.service.IntentionService;
import com.cykj.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class IntentionServiceImpl implements IntentionService {
    @Autowired
    private IntentionMapper intentionMapper;
    @Autowired
    private RegionMapper regionMapper;

    @Override
    public List<Tblintention> queryNowList(int pageCurr) {
        List<Tblintention> tblintentions = intentionMapper.queryAll();
        PageUtils pageUtils = new PageUtils(5,tblintentions.size(),pageCurr);
        List<Tblintention> nowList = new ArrayList<>();
        for (int i = pageUtils.getFromIndex(); i < pageUtils.getToIndex(); i++) {
            nowList.add(tblintentions.get(i));
        }
        return nowList;
    }

    @Override
    public List<AreaBean> queryRegion(List<Tblintention> list) {
        List<AreaBean> areaList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            //区域id
            int countryId = list.get(i).getRegionId();
            //区域的父id（城市id）
            List<Tblregion> re = regionMapper.queryById(countryId);
            //区域名称
            String countryName = re.get(0).getRegionName();
            //获取区域的父id（城市id）
            int cityId = re.get(0).getParentId();
            //获取城市id的父id（省id）
            List<Tblregion> ci = regionMapper.queryById(cityId);
            //获取省id
            int proId = ci.get(0).getParentId();
            //市名称
            String cityName = ci.get(0).getRegionName();
            List<Tblregion> pro = regionMapper.queryById(proId);
            //省名称
            String proName = pro.get(0).getRegionName();
            AreaBean areaBean = new AreaBean(proName,cityName,countryName);
            areaList.add(areaBean);
        }
        return areaList;
    }

    @Override
    public int queryCount() {
        List<Tblintention> tblintentions = intentionMapper.queryAll();
        PageUtils pageUtils = new PageUtils(5,tblintentions.size(),1);
        return pageUtils.getPageCount();
    }

    @Override
    public List<Tblintention> queryLikeList(IntentionQuery intentionQuery, int pageCurr) {
        List<Integer> countByCity = new ArrayList<>();
        if (intentionQuery.getCounty() > 0){
            countByCity.add(intentionQuery.getCounty());
        }else if (intentionQuery.getCity() > 0){
            List<Tblregion> tblregionList = regionMapper.queryByPId(intentionQuery.getCity());
            for (Tblregion tblregion : tblregionList) {
                countByCity.add(tblregion.getRegionId());
            }
        }else if (intentionQuery.getProvince() > 0){
            List<Tblregion> tblregionList = regionMapper.queryByPId(intentionQuery.getProvince());
            for (Tblregion value : tblregionList) {
                List<Tblregion> list = regionMapper.queryByPId(value.getRegionId());
                for (Tblregion tblregion : list) {
                    countByCity.add(tblregion.getRegionId());
                }
                countByCity.add(value.getRegionId());
            }
        }
        RegionQuery regionQuery = new RegionQuery(intentionQuery.getName(),countByCity
                ,intentionQuery.getMinSal(),intentionQuery.getMaxSal());
        List<Tblintention> tblintentions = intentionMapper.queryByCondition(regionQuery);
        PageUtils pageUtils = new PageUtils(5,tblintentions.size(),pageCurr);
        List<Tblintention> nowList = new ArrayList<>();
        for (int i = pageUtils.getFromIndex(); i < pageUtils.getToIndex(); i++) {
            nowList.add(tblintentions.get(i));
        }
        return nowList;
    }

    @Override
    public int queryLikeCount(IntentionQuery intentionQuery) {
        List<Integer> countByCity = new ArrayList<>();
        if (intentionQuery.getCounty() > 0){
            countByCity.add(intentionQuery.getCounty());
        }else if (intentionQuery.getCity() > 0){
            List<Tblregion> tblregionList = regionMapper.queryByPId(intentionQuery.getCity());
            for (Tblregion tblregion : tblregionList) {
                countByCity.add(tblregion.getRegionId());
            }
        }else if (intentionQuery.getProvince() > 0){
            List<Tblregion> tblregionList = regionMapper.queryByPId(intentionQuery.getProvince());
            for (Tblregion value : tblregionList) {
                List<Tblregion> list = regionMapper.queryByPId(value.getRegionId());
                for (Tblregion tblregion : list) {
                    countByCity.add(tblregion.getRegionId());
                }
                countByCity.add(value.getRegionId());
            }
        }
        RegionQuery regionQuery = new RegionQuery(intentionQuery.getName(),countByCity
                ,intentionQuery.getMinSal(),intentionQuery.getMaxSal());
        List<Tblintention> tblintentions = intentionMapper.queryByCondition(regionQuery);
        PageUtils pageUtils = new PageUtils(5,tblintentions.size(),1);
        return pageUtils.getPageCount();
    }

    @Override
    public int insertIntention(Tblintention tblintention) {
        return intentionMapper.addIntention(tblintention);
    }
}
