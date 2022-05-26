package com.example.shop.cart.controller;

import com.example.shop.cart.domain.Cart;
import com.example.shop.cart.service.CartService;
import com.example.shop.customer.domain.Customer;
import com.example.shop.product.domain.Product;

import com.sun.deploy.net.HttpResponse;
import lombok.RequiredArgsConstructor;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
@Log4j2
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

   // private  final CustomerService customerService;

    //장바구니 추가
    @PostMapping("/add")
    public String insert(Cart cart, HttpSession session, HttpServletResponse response) throws Exception {

        log.info("장바구니 insert! " +session.getAttribute("loginCustomer"));
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        Integer count = cartService.countCart(loginCustomer.getCsId(), cart.getPrCode());

        log.info("(cart):" +cart);
        log.info("로그 확인하기 1: "+ loginCustomer.getCsId());
        log.info("로그 확인하기 2: "+ cart.getPrCode());

        //장바구니에 기존 상품이 있는지 검사
        log.info("count: "+ count);
        if (count == null || count == 0)  {
            log.info("장바구니 상품 레코드 확인 Controller");
            cart.setCsId(loginCustomer.getCsId());
            cartService.insert(cart);
            log.info(cart);
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('이미 장바구니에 있는 상품입니다 :) ');</script>");
            out.flush();
        }

        return "redirect:/cart/list";
        //redirect:/customer/info?cdId="+loginCustomer.getCsId()
    }

    //장바구니 목록
    @GetMapping("/list")
    public String list(HttpSession session, Model model) {

        log.info("장바구니 목록 Controller! (화면)");

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        //장바구니 정보
        List<Cart> cartList = cartService.listCart(loginCustomer.getCsId());

        log.info(cartList);
        model.addAttribute("cart",cartList);

        List<Product> productList = new ArrayList<>();

        //상품정보
       for (Cart cart: cartList) {
                Product product = cartService.listProduct(cart.getPrCode());
                productList.add(product);
                model.addAttribute("product",productList);
            }

        //장바구니 전체 금액 호출
        //int sumTotal = cartService.sumTotal(csId);

       // return "redirect:/cart/list?csId="+loginCustomer.getCsId();
        return "cart/list";
    }

    //장바구니 삭제
    @GetMapping("/delete")
    public String delete(int cartCode) {
        log.info("장바구니 삭제: " + cartCode);
        cartService.delete(cartCode);
        return "redirect:/cart/list";
    }

}//
