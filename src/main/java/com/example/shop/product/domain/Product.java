package com.example.shop.product.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@Setter @Getter @ToString
public class Product {

    private int prCode;
    private int cateCode; //FK
    private String prName;
    private int prPrice;
    private int prYn;
    private int prAmount;
    private String prThumb;
    private String prImg1;
    private String prImg2;
    private String prImg3;
    private String prImg4;
    private String prImg5;
    private String prDate;

    private static int seq;

    public Product() {
        this.prCode = ++seq;
    }

    public Product(int prCode, int cateCode, String prName, int prPrice, int prYn,
                     int prAmount, String prThumb, String prDate) {
        this();
        this.prCode = prCode;
        this.cateCode = cateCode;
        this.prName = prName;
        this.prPrice = prPrice;
        this.prYn = prYn;
        this.prAmount = prAmount;
        this.prThumb = prThumb;
        this.prImg1 = prImg1;
        this.prImg2 = prImg2;
        this.prImg3 = prImg3;
        this.prImg4 = prImg4;
        this.prImg5 = prImg5;
        this.prDate = prDate;
    }

    public Product(ResultSet rs) throws SQLException {
        this.prCode = rs.getInt("product_code");
        this.cateCode = rs.getInt("cate_code");
        this.prName = rs.getString("product_name");
        this.prPrice = rs.getInt("product_price");
        this.prYn = rs.getInt("product_yn");
        this.prAmount = rs.getInt("product_amount");
        this.prThumb = rs.getString("product_thumb");
        this.prImg1 = rs.getString("product_img1");
        this.prImg2 = rs.getString("product_img2");
        this.prImg3 = rs.getString("product_img3");
        this.prImg4 = rs.getString("product_img4");
        this.prImg5 = rs.getString("product_img5");
        this.prDate = rs.getString("product_date");
    }


}//
