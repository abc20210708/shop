package com.example.shop.product.repository;

import com.example.shop.product.domain.Product;
import com.example.shop.product.dto.ModProduct;
import org.apache.ibatis.annotations.Mapper;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Mapper
public interface ProductMapper{

    //상품 목록 조회
    List<Product> getArticles();

    //상품 상세 조회
    Product getContent(int prCode);

    //상품 등록
    boolean insert(Product product);

    //상품 삭제
    boolean delete(int prCode);

    //상품 수정
    //boolean update(ModProduct product);


}//
