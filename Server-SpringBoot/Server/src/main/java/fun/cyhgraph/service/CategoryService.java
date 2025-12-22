package fun.cyhgraph.service;

import fun.cyhgraph.dto.CategoryDTO;
import fun.cyhgraph.dto.CategoryTypePageDTO;
import fun.cyhgraph.entity.Category;
import fun.cyhgraph.result.PageResult;

import java.util.List;

public interface CategoryService {
    void addCategory(CategoryDTO categoryDTO);

    PageResult getPageList(CategoryTypePageDTO categoryTypePageDTO);

    /**
     * 根据类型和窗口ID查询分类列表
     * @param type 分类类型
     * @param windowId 窗口ID（可为null，查询所有窗口）
     * @return
     */
    List<Category> getList(Integer type, Integer windowId);

    /**
     * 根据类型查询所有分类（兼容旧接口）
     * @param type
     * @return
     */
    List<Category> getList(Integer type);

    Category getById(Integer id);
    void onOff(Integer id);

    void udpate(CategoryDTO categoryDTO);

    void delete(Integer id);
}
