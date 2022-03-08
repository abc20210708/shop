package com.example.shop.product.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Setter @Getter @ToString
public class Product {

    //private String cateCode;
    private int prCode;
    private String prName;
    private int prPrice;
    private int prYn;
    private int prAmount;
    private String prThumb;
    private String prImg;

    private static int seq;

    public Product() {
        this.prCode = ++seq;
    }

    public Product(int prCode, String prName, int prPrice, int prYn,
                     int prAmount, String prThumb, String prImg) {
        this();
        this.prCode = prCode;
        this.prName = prName;
        this.prPrice = prPrice;
        this.prYn = prYn;
        this.prAmount = prAmount;
        this.prThumb = prThumb;
        this.prImg = prImg;

    }

    public Product(ResultSet rs) throws SQLException {
        this.prCode = rs.getInt("product_code");
        this.prName = rs.getString("product_name");
        this.prPrice = rs.getInt("product_price");
        this.prYn = rs.getInt("product_yn");
        this.prAmount = rs.getInt("product_amount");
        this.prThumb = rs.getString("product_thumb");
        this.prImg = rs.getString("product_img");

    }


}//
