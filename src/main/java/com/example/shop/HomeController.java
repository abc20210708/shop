package com.example.shop;

import com.example.shop.customer.domain.Customer;
import com.example.shop.login.SessionManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final SessionManager sessionManager;

    @GetMapping("/")
    public String home(@SessionAttribute(name = SessionManager.SESSION_COOKIE_NAME, required = false)
                                   Customer loginCustomer, Model model) {

        //세션에 회원 데이터가 없으면 home으로
        if (loginCustomer == null) {
            return  "/main/home";
        }

        //세션이 유지되면 로그인으로 이동
        model.addAttribute("loginCustomer", loginCustomer);
        return "/customer/loginHome";
    }
}
