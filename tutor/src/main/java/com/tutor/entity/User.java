package com.tutor.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;

import lombok.Data;


@Data


public class User implements Serializable {

    private static final long serialVersionUID = 1L;


    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;


    private String no;

    private String name;


    private String password;

    private Integer age;


    private Integer sex;

    private String phone;

    private Integer roleId;

    @TableField("isValid")
    private String isvalid;


}
