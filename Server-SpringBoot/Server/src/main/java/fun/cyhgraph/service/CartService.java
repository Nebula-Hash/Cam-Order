package fun.cyhgraph.service;

import fun.cyhgraph.dto.CartDTO;
import fun.cyhgraph.entity.Cart;

import java.util.List;
import java.util.Map;

public interface CartService {
    void add(CartDTO cartDTO);

    List<Cart> getList();

    /**
     * 按窗口分组获取购物车列表
     * @return Map<windowId, List<Cart>>
     */
    Map<Integer, List<Cart>> getListGroupByWindow();

    void clean();

    void sub(CartDTO cartDTO);
}
