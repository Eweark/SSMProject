package com.cykj.service.impl;

import com.cykj.bean.Tblregion;
import com.cykj.mapper.RegionMapper;
import com.cykj.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionServiceImpl implements RegionService {

    @Autowired
    private RegionMapper regionMapper;
    @Override
    public List<Tblregion> queryAllRegion() {
        List<Tblregion> tblRegions = regionMapper.queryAllRegion();
        return tblRegions;
    }
}
