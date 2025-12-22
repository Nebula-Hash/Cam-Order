package fun.cyhgraph.service;

import fun.cyhgraph.entity.AddressBook;

import java.util.List;

public interface AddressBookService {
    void addAddress(AddressBook addressBook);

    List<AddressBook> list(Long userId);

    void updateAddress(AddressBook addressBook);

    AddressBook getById(Long id);

    void setDefault(Long userId, Long addressId);

    void deleteById(Long id);

    AddressBook getDefault(Long userId);
}
