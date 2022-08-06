package com.cykj.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class RegionQuery {
    private String name;
    private List<Integer> regionList;
    private Integer minSal;
    private Integer maxSal;
}
