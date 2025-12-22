package fun.cyhgraph.mapper;

import fun.cyhgraph.entity.AddressBook;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 地址簿Mapper（简化版 - 校园宿舍）
 */
@Mapper
public interface AddressBookMapper {

    /**
     * 新增地址
     */
    @Insert("INSERT INTO address_book (user_id, consignee, phone, dormitory, label, is_default) " +
            "VALUES (#{userId}, #{consignee}, #{phone}, #{dormitory}, #{label}, #{isDefault})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    void insert(AddressBook addressBook);

    /**
     * 查询用户地址列表
     */
    @Select("SELECT * FROM address_book WHERE user_id = #{userId} ORDER BY is_default DESC")
    List<AddressBook> listByUserId(Long userId);

    /**
     * 根据ID查询地址
     */
    @Select("SELECT * FROM address_book WHERE id = #{id}")
    AddressBook getById(Long id);

    /**
     * 更新地址
     */
    void update(AddressBook addressBook);

    /**
     * 将用户所有地址设为非默认
     */
    @Update("UPDATE address_book SET is_default = 0 WHERE user_id = #{userId}")
    void resetDefaultByUserId(Long userId);

    /**
     * 设置默认地址
     */
    @Update("UPDATE address_book SET is_default = 1 WHERE id = #{id}")
    void setDefault(Long id);

    /**
     * 删除地址
     */
    @Delete("DELETE FROM address_book WHERE id = #{id}")
    void deleteById(Long id);

    /**
     * 查询用户默认地址
     */
    @Select("SELECT * FROM address_book WHERE user_id = #{userId} AND is_default = 1 LIMIT 1")
    AddressBook getDefaultByUserId(Long userId);
}
