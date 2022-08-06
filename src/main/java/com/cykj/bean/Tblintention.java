package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Tblintention {

  private int id;
  private int regionId;
  private int stuId;
  private String name;
  private String company;
  private int minSal;
  private int maxSal;



}
