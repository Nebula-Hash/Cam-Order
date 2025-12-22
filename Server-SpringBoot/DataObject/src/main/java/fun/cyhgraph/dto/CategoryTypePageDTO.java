package fun.cyhgraph.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class CategoryTypePageDTO implements Serializable {

    private int page; // 参数直接int
    private int pageSize;
    private String name;
    private Integer type; // 对象属性用包装类
    private Integer windowId; // 窗口ID，支持按窗口筛选分类
}
