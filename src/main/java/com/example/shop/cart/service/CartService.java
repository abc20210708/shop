package com.example.shop.cart.service;

import com.example.shop.cart.domain.Cart;
import com.example.shop.cart.dto.ModCart;
import com.example.shop.cart.repository.CartMapper;
import com.example.shop.product.domain.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class CartService {

    private final CartMapper cartMapper;
    private final SqlSession session;

    //장바구니 추가
    public void insert(Cart cart) {
        cartMapper.insert(cart);
        log.info("장바구니 추가 "+ cart);
    }

    //장바구니 목록
    public List<Cart> listCart(String csId) {
        log.info("장바구니 목록 요청 서비스!" + csId);
        return cartMapper.listCart(csId);
    }

    //장바구니 상품 목록
    public Product listProduct(int prCode) {
        log.info("CartService 상품 목록 요청 서비스!" + prCode);
        return cartMapper.listProduct(prCode);
    }

    //장바구니 삭제
    public void delete(int cardCode) {
        cartMapper.delete(cardCode);
    }

    //장바구니 수정
    public void modifyCart(Cart cart) {
        cartMapper.modifyCart(cart);
    }

    //장바구니 금액 합계
    public int sumTotal(String csId) {
        return cartMapper.sumTotal(csId);
    }

    //장바구니 동일한 상품 레코드 확인
    public Integer countCart(String csId, int prCode) throws Exception {
        log.info("장바구니 상품 레코드 확인 Service");
        return cartMapper.countCart(csId, prCode);
    }

    //장바구니 상품 수량 변경
    public void updateCart(Cart cart) {
        cartMapper.updateCart(cart);
    }


}//
