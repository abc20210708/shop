package com.example.shop.product.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class Product {

    private String prCode;
    private String prName;
    private int prPrice;
    private String prYn;
    private int prAmount;

}
