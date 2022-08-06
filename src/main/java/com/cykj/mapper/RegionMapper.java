package com.cykj.mapper;

import com.cykj.bean.Tblregion;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegionMapper {
    //查询所有地区
    List<Tblregion> queryAllRegion();
    //通过pid查询id
    List<Tblregion> queryByPId(int pid);
    //通过id查询pid
    List<Tblregion> queryById(int id);

}
