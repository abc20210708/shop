package com.example.shop.cart.repository;

import com.example.shop.cart.domain.Cart;
import com.example.shop.cart.dto.ModCart;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {

    //장바구니 추가
    void insert(Cart cart);

    //장바구니 목록
    List<Cart> listCart(String csId);

    //장바구니 삭제
    void delete(int cartCode);

    // 장바구니 수정
    void modifyCart(Cart cart);

    //장바구니 금액 합계
    int sumTotal(String csId);

    //장바구니 동일한 상품 확인
    int countCart(int prCode, String csId);

    //장바구니 상품수량 변경
    void updateCart(Cart cart);


}