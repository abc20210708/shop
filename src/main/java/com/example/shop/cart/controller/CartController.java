package com.example.shop.cart.controller;

import com.example.shop.cart.domain.Cart;
import com.example.shop.cart.service.CartService;
import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.service.CustomerService;
import jdk.nashorn.internal.ir.CatchNode;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
@Log4j2
@RequiredArgsConstructor
public class CartController {

    private CartService cartService;

    private  final CustomerService customerService;

    //장바구니 추가
    @PostMapping("/add")
    public String insert(Cart cart, HttpSession session) {

        log.info(session.getAttribute("loginCustomer"));
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        String csId = loginCustomer.getCsId();

        //장바구니에 기존 상품이 있는지 검사
        int count = cartService.countCart(cart.getPrCode(), csId);
        //count == 0 ? cartService.updateCart(cart) : cartService.insert(cart);
        if (count == 0) { //없으면 insert
            cartService.insert(cart);
        } else { //있으면 update
            cartService.updateCart(cart);
        }
        return "redirect:/cart/list";
    }

    //장바구니 목록
    @GetMapping("/list")
    public String inset(HttpSession session, Model model) {

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        String csId = loginCustomer.getCsId();

        model.addAttribute("cs", loginCustomer);

        //장바구니 정보
        List<Cart> cartList = cartService.listCart(csId);
        model.addAttribute("cart",cartList);
        //장바구니 전체 금액 호출
        int sumTotal = cartService.sumTotal(csId);

        return "cart/list";
    }

}//
