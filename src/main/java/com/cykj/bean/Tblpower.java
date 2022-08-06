package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 权限表
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
