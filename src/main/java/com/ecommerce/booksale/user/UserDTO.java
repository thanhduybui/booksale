package com.ecommerce.booksale.user;

import com.ecommerce.booksale.user.address.Address;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class UserDTO {
    private String email;
    private String fullName;
    private String phone;
    private List<Address> addressList;

    public UserDTO(User user){
        this.email = user.getEmail();
        this.fullName = user.getFullName();
        this.phone = user.getPhone();
        this.addressList = user.getAddresses();
    }
}
