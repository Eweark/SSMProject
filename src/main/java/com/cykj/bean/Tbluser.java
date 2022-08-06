package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户表
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tbluser {

  private int userId;
  private int roleId;
  private String acc;
  private String password;
  private int status;




}
