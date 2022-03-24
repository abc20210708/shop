package com.example.shop.customer.controller;

import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.domain.LoginFlag;
import com.example.shop.customer.dto.ModCustomer;
import com.example.shop.customer.service.CustomerService;
import com.example.shop.notice.domain.Notice;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@Log4j2
@RequestMapping("/customer")
@RequiredArgsConstructor
public class CustomerController {

    private  final CustomerService customerService;

    //회원 가입 요청 - (화면)
    @GetMapping("/account")
    public String insert() {
        log.info("회원 가입 요청(화면) - GET ");
        return "customer/account";
    }

    //회원 가입 요청
    @PostMapping("/account")
    public String insert(Customer customer) {
        log.info("회원 가입 요청 " + customer);
        customerService.insert(customer);
        return "redirect:/";
    }

    //회원 탈퇴 요청 - (화면)
    @GetMapping("/delete")
    public String delete() {
        return "customer/delete";
    }

    //회원 탈퇴
    @PostMapping("/delete")
    public String delete(String csId, String csPw) {
        log.info("회원 탈퇴 요청 아이디: "+ csId);
        customerService.delete(csId, csPw);
        return  "redirect:/";
    }

    //회원 정보 상세 보기  - (화면)
    @GetMapping("/info")
    public String content(Model model, String csId) {
        Customer loginCustomer = customerService.getCustomer(csId);
        model.addAttribute("cs", loginCustomer);
        log.info(loginCustomer);
        return "customer/info";
    }

    //회원 정보 상세 보기
    @PostMapping("/info")
    public String content(Model model, ModCustomer modCustomer) {
        Customer loginCustomer = customerService.getCustomer(modCustomer.getCsId());
        model.addAttribute("cs", loginCustomer);
        log.info(loginCustomer);
        customerService.updateCustomer(modCustomer);
        log.info("회원 정보 변경 :" + modCustomer);
        return "redirect:/customer/info?cdId="+loginCustomer.getCsId();
    }

    //공지사항 요청 - (화면)
    @GetMapping("/notice")
    public String notice(Model model) {
        log.info("회원 공지사항 요청(화면) GET ");
        List<Notice> noticeList = customerService.getNotice();
        model.addAttribute("notice", noticeList);
        return "notice/list";
    }

    //아이디 중복확인 비동기 통신 요청
    @GetMapping("/check")
    @ResponseBody
    public boolean check(String checkId) {
        return customerService.isDuplicate(checkId);
    }

    //회원 로그인 양식 요청 - (화면)
    @GetMapping("/login")
    public String loginCustomer() {
        return "login/customer";
    }

    //회원 로그인 검증
    @PostMapping("/login")
    public String loginCustomer(String csId, String csPw, Model model,
                                HttpSession session, HttpServletResponse response) throws IOException {
        log.info("로그인 검증 ID: "+ csId);
        LoginFlag flag = customerService.login(csId, csPw);
        model.addAttribute("flag",flag);
        model.addAttribute("id", csId);

        //회원 로그인 성공시
        if (flag == LoginFlag.SUCCESS) {
            session.setAttribute("loginCustomer", customerService.getCustomer(csId));
            return "redirect:/";
            //customer/info?cdId="+csId
        }
        return "login/customer";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        Customer customer = (Customer) session.getAttribute("loginCustomer");
        if (customer != null) {
            session.removeAttribute("loginCustomer");
            session.invalidate();//세션 무효화
        }
        return  "redirect:/";
    }

}//
