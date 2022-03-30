package com.example.shop;

import com.example.shop.customer.domain.Customer;
import com.example.shop.login.SessionConst;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class HomeController {


    @GetMapping("/")
    public String home (
            @SessionAttribute(name = SessionConst.LOGIN_CUSTOMER, required = false) Customer loginCustomer,
            HttpServletRequest request, Model model) {

        if (loginCustomer == null) return "/main/home";

        model.addAttribute("loginCustomer", loginCustomer);
        return "login/customer";


    }
}
