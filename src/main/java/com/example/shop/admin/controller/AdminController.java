package com.example.shop.admin.controller;

import com.example.shop.admin.domain.Admin;
import com.example.shop.admin.domain.LoginFlag;
import com.example.shop.admin.service.AdminService;
import com.example.shop.customer.domain.Customer;
import com.example.shop.notice.domain.Notice;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@Log4j2
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

    private final AdminService adminService;

    @GetMapping("/list")
    public String list(Model model) {
        log.info("관리자 - 회원 및 공지사항 조회 GET!");

        List<Admin> adminList = adminService.getList();
        model.addAttribute("admin",adminList);

        List<Customer> customerList = adminService.getCustomerList();
        model.addAttribute("cs",customerList);

        //List<Notice> noticeList = adminService.getNoticeList();
       // model.addAttribute("notice",noticeList);

        return "admin/list";
    }

    //관리자 등록 요청 - (화면)
    @GetMapping("/account")
    public String insert() {
        log.info("관리자 등록 요청(화면) - GET ");
        return "admin/insert";
    }

    //관리자 등록 요청
    @PostMapping("/account")
    public String insert(Admin admin) {
        log.info(admin);
        adminService.write(admin);
        return "redirect:/";
    }

    //관리자 삭제 요청 - (화면)
    @GetMapping("/delete")
    public String delete() {
        log.info("관리자 삭제 요청(화면) - GET");
        return "admin/delete";
    }

    //관리자 삭제
    @PostMapping("/delete")
    public String delete(String adminId, String adminPw) {
        log.info("삭제할 관리자 id: " + adminId);
        adminService.delete(adminId, adminPw);
        return "redirect:/main/home";
    }

    //회원 상세 조회 요청
    @GetMapping("/csContent")
    public String csContent(String csId, Model model) {
        log.info("회원 목록 상세 조회" + csId);
        Customer customer = adminService.getCustomerContent(csId);
        model.addAttribute("customer", customer);
        return "admin/csContent";
    }

    //공지사항 상세 조회 요청
    @GetMapping("/noticeContent")
    public String csContent(Long noticeCode, Model model) {
        log.info("공지사항 목록 상세 조회" + noticeCode);
        Notice notice = adminService.getNoticeContent(noticeCode);
        model.addAttribute("notice", notice);
        return "admin/noticeContent";
    }

    //관리자 로그인 요청 - (화면)
    @GetMapping("/login")
    public String loginAdmin() {
        return "login/admin";
    }

    //관리자 로그인 검증
    @PostMapping("/login")
    public String loginCheck(String adminId, String adminPw, Model model,
                             HttpSession session, HttpServletResponse response) throws IOException {
        log.info("ID: "+adminId, "PW: "+ adminPw );
        LoginFlag flag = adminService.login(adminId, adminPw);

        model.addAttribute("flag", flag);

        //관리자 로그인 성공시
        if  (flag == LoginFlag.SUCCESS) {
            session.setAttribute("loginAdmin", adminService.getAdmin(adminId));
            return "admin/list";
        }
        return "login/admin";
    }

}//
