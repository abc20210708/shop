package com.example.shop.product.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
@RequestMapping("/product")
@RequiredArgsConstructor
public class ProductController {

    /**
     * 상품 목록요청: /product/list: GET
     * 상품 상세조회요청: /product/content: GET
     * 상품 등록 화면요청: /product/write: GET
     * 상품 등록요청: /product/write: POST
     * 상품 삭제요청: /product/delete: GET
     * 상품 수정 화면요청: /product/modify: GET
     * 상품 수정 요청: /product/modify: POST
     */



}//
