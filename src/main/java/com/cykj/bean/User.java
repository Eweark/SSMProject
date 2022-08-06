package com.cykj.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class User {
  private int id;
  private String user_acc;
  private String user_pwd;
  private String trueName;
  private int userType;
  private int gender;

}
