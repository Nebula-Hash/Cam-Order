package fun.cyhgraph.controller.client;

import fun.cyhgraph.context.BaseContext;
import fun.cyhgraph.entity.AddressBook;
import fun.cyhgraph.result.Result;
import fun.cyhgraph.service.AddressBookService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user/address")
@Slf4j
public class AddressBookController {

    @Autowired
    private AddressBookService addressBookService;

    /**
     * 新增地址
     * @return
     */
    @PostMapping
    public Result addAddress(@RequestBody AddressBook addressBook){
        log.info("新增地址，用户传过来的地址信息：{}", addressBook);
        addressBookService.addAddress(addressBook);
        return Result.success();
    }

    /**
     * 根据当前用户查询地址列表
     * @return
     */
    @GetMapping("/list")
    public Result<List<AddressBook>> list(){
        log.info("查询当前用户的地址列表");
        Long userId = BaseContext.getCurrentId().longValue();
        List<AddressBook> addressBookList = addressBookService.list(userId);
        return Result.success(addressBookList);
    }

    /**
     * 查询默认地址
     * @return
     */
    @GetMapping("/default")
    public Result<AddressBook> defaultAddress(){
        log.info("查询默认地址");
        Long userId = BaseContext.getCurrentId().longValue();
        AddressBook defaultAddress = addressBookService.getDefault(userId);
        if (defaultAddress != null){
            return Result.success(defaultAddress);
        }
        return Result.error("没有查询到默认地址");
    }

    /**
     * 根据id查询地址
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public Result<AddressBook> getById(@PathVariable Long id) {
        log.info("根据id查询地址：{}", id);
        AddressBook addressBook = addressBookService.getById(id);
        return Result.success(addressBook);
    }

    /**
     * 根据id修改地址
     * @param addressBook
     * @return
     */
    @PutMapping
    public Result updateAddress(@RequestBody AddressBook addressBook){
        log.info("根据id修改地址，新地址信息为：{}", addressBook);
        addressBookService.updateAddress(addressBook);
        return Result.success();
    }

    /**
     * 设置默认地址
     * @return
     */
    @PutMapping("/default")
    public Result setDefaultAddress(@RequestBody AddressBook addressBook){
        log.info("设置默认地址：{}", addressBook);
        Long userId = BaseContext.getCurrentId().longValue();
        addressBookService.setDefault(userId, addressBook.getId());
        return Result.success();
    }

    /**
     * 根据id删除地址
     * @return
     */
    @DeleteMapping("/{id}")
    public Result deleteAddress(@PathVariable Long id){
        log.info("要删除的地址id:{}", id);
        addressBookService.deleteById(id);
        return Result.success();
    }
}
