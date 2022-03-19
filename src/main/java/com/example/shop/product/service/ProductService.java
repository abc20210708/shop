package com.example.shop.product.service;

import com.example.shop.product.domain.Product;
import com.example.shop.product.dto.ModProduct;
import com.example.shop.product.repository.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper productMapper;

    //상품 목록 중간 처리
    public List<Product> getList() {

        List<Product> articles  = productMapper.getArticles();

        return articles;
    }

    //상품 등록 중간 처리
    public boolean write(Product product) {
        productMapper.insert(product);
        return true;
    }

    //상품 수정 중간 처리
  /*  public boolean update(ModProduct product) {
        productMapper.update(product);
        return true;
    }
*/

    //상세조회 중간 처리
    public Product get(int prCode) {
        return productMapper.getContent(prCode);
    }

    //상품 삭제 중간 처리
    public void remove(int prCode) {
        productMapper.delete(prCode);
    }

}//
