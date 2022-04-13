package com.example.shop.cart.controller;

import com.example.shop.cart.domain.Cart;
import com.example.shop.cart.service.CartService;
import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.service.CustomerService;
import com.example.shop.product.domain.Product;

import lombok.RequiredArgsConstructor;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
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
    public String insert(Cart cart, HttpSession session) {

        log.info("장바구니" +session.getAttribute("loginCustomer"));
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");

        //장바구니에 기존 상품이 있는지 검사
       // int count = cartService.countCart(cart.getPrCode(), csId);
        //count == 0 ? cartService.updateCart(cart) : cartService.insert(cart);
        //없으면 insert
        cart.setCsId(loginCustomer.getCsId());
        cartService.insert(cart);
        log.info(cart);
        /*else { //있으면 update
            cartService.updateCart(cart);
        }*/
        return "product/product";
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

}//
