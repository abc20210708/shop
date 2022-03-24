package com.example.shop.customer.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ModCustomer {

    private String csId;
    private String csPw;
    private String csName;
    private String csGender;
    private String csPhone;
    private String postCode;
    private String roadAddr; //도로명주소
    private String lotNumAddr; //지번주소
    private String extraAddr;//상세주소
    private String csBirth;

}
