package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ๆ้่กจ
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tblpower {

  private int powerId;
  private String powerName;
  private String url;
  private int parentId;


}
