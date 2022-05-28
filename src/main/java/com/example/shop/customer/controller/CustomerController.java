package com.example.shop.customer.controller;

import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.dto.ModCustomer;
import com.example.shop.customer.service.CustomerService;
import com.example.shop.login.SessionConst;
import com.example.shop.notice.domain.Notice;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
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
    public String content(Model model, HttpSession session) {

        log.info("회원 정보 보기(화면) ");

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        customerService.getCustomer(loginCustomer.getCsId());

        log.info(loginCustomer);

        model.addAttribute("cs", loginCustomer);

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
        return "redirect:/customer/info?csId="+loginCustomer.getCsId();
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
    public String loginCustomer(Customer customer,BindingResult bindingResult,
                                HttpServletRequest request, Model model, HttpServletResponse response
                               ) throws UsernameNotFoundException,IOException {

        log.info("회원 로그인 controller---" + customer);


        Customer loginCustomer = customerService.login(customer.getCsId(), customer.getCsPw());
        if (loginCustomer == null) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();

            out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.');");
            out.println("history.back()");
            out.println("</script>");
            out.flush();
            response.flushBuffer();
            out.close();
            bindingResult.reject("loginFail", "아이디 또는 비밀번호가 맞지 않습니다.");
           return "login/customer";
        }

        //세션 매니저를 통해 세션 생성 및 회원정보 보관
        //세션이 있으면 있는 세션을 반환, 없으면 신규 세션을 생성
        HttpSession session = request.getSession();
        session.setAttribute(SessionConst.LOGIN_CUSTOMER, loginCustomer);
        return "customer/loginHome";
    }


    @GetMapping("/logout")
    public String logout(HttpServletResponse response, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return  "redirect:/";
    }

    /*
      @PostMapping("/login")
    public String loginCustomer(String csId, String csPw, Model model,
                                HttpSession session, HttpServletResponse response) throws IOException {
        log.info("로그인 검증 ID: "+ csId);
        //LoginFlag flag = customerService.login(csId, csPw);
       // Customer loginCs = customerService.login(csId, csPw);
        //model.addAttribute("flag",flag);
        //model.addAttribute("id", csId);

        //회원 로그인 성공시
        if (flag == LoginFlag.SUCCESS) {
            sessionManager.createSession(loginCs, response);
            //session.setAttribute("loginCustomer", customerService.getCustomer(csId));
            //response.sendRedirect("/product/product");
            return "redirect:/";
            //customer/info?cdId="+csId
        }
        return "login/customer";
    }
    * */

}//
