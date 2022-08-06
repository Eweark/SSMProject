package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class AreaBean {
    private String province;
    private String city;
    private String county;
}
