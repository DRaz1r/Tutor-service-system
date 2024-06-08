package com.vms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
@ApiModel(value="DemandPublish对象", description="")
public class DemandPublish implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户ID，关联用户ID")
    private Integer userId;

//    @ApiModelProperty(value = "类型，teacher/student")
//    private String type;

    @ApiModelProperty(value = "科目")
    private String subjects;

    @ApiModelProperty(value = "年级")
    private String grades;

    @ApiModelProperty(value = "时间")
    private String availableTimes;

    @ApiModelProperty(value = "家教需求，针对学生")
    private String requirement;

//    @ApiModelProperty(value = "个人简介或其他信息")
//    private String introduction;


}
