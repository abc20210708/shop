package com.example.shop.cart.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ModCart {

    private int cartCode;
    private String csId;
    private int prCode;
    private int cartChecked; // 0과 1로
    private int cartAmount;
    private int cartTotalPrice;

}
