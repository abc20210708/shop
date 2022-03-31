package com.example.shop.cart.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString
public class Cart {

    private int cartCode;
    private String csId;
    private int prCode;
    private int cartChecked; // 0과 1로
    private int cartAmount;
    private int cartTotalPrice;

    private static int seqCart;

    public Cart() {
        this.cartCode = ++seqCart;
    }

    public Cart(int cartCode, String csId, int prCode, int cartChecked,
                int cartAmount, int cartTotalPrice) {
        this.cartCode = cartCode;
        this.csId = csId;
        this.prCode = prCode;
        this.cartChecked = cartChecked;
        this.cartAmount = cartAmount;
        this.cartTotalPrice = cartTotalPrice;
    }

    public Cart(ResultSet rs) throws SQLException {
        this.cartCode = rs.getInt("cart_code");
        this.csId = rs.getString("customer_id");
        this.prCode = rs.getInt("product_code");
        this.cartChecked = rs.getInt("cart_checked");
        this.cartAmount = rs.getInt("cart_amount");
        this.cartTotalPrice = rs.getInt("cart_total_price");
    }

}//
