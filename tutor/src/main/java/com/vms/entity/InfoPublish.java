package com.vms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author Fuhang
 * @since 2024-06-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="InfoPublish对象", description="")
public class InfoPublish implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户ID，关联用户ID")
    private Integer userId;

    @ApiModelProperty(value = "科目")
    private String subjects;

    @ApiModelProperty(value = "年级")
    private String grades;

    @ApiModelProperty(value = "时间")
    private String availableTimes;

    @ApiModelProperty(value = "个人简介或其他信息")
    private String introduction;

    // 这个字段在数据库表中没有对应的列，因此使用 @TableField 注解
    @TableField(exist = false)
    private String userName;
}
