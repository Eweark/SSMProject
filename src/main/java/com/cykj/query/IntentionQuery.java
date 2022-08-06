package com.cykj.query;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class IntentionQuery {
    private String name;
    private int province;
    private int city;
    private int county;
    private int minSal;
    private int maxSal;
}
