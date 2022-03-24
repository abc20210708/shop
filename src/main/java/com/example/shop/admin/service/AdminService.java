package com.example.shop.admin.service;

import com.example.shop.admin.domain.Admin;
import com.example.shop.admin.domain.LoginFlag;
import com.example.shop.admin.repository.AdminMapper;
import com.example.shop.customer.domain.Customer;
import com.example.shop.notice.domain.Notice;
import com.example.shop.notice.dto.ModNotice;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class AdminService {

    private final AdminMapper adminMapper;

    //관리자 목록 조회 중간 처리
    public List<Admin> getList() {
        return adminMapper.getAdminList();
    }

    //관리자 정보 받기
    public Admin getAdmin(String adminId) {
        return adminMapper.getAdmin(adminId);
    }

    //관리자 등록 중간처리
    public boolean write(Admin admin) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPw = encoder.encode(admin.getAdminPw());
        admin.setAdminPw(encodedPw);
        log.info(admin);
        return adminMapper.createAdmin(admin);
    }

    //관리자 삭제 중간처리
    public boolean delete(String adminId, String adminPw) {
        return adminMapper.delAdmin(adminId, adminPw);
    }

    //회원 조회 중간 처리
    public List<Customer> getCustomerList() {
        return adminMapper.getCustomerList();
    }

    //회원 상세 조회 중간 처리
    public Customer getCustomerContent(String csId) {
        return adminMapper.getCustomerContent(csId);
    }

    //공지사항 조회 중간처리
    public List<Notice> getNoticeList() {
        log.info("공지사항 조회 중간 처리");
        return adminMapper.getNoticeList();
    }

    //회원 상세 조회 중간 처리
    public Notice getNoticeContent(Long noticeCode) {
        return adminMapper.getNoticeContent(noticeCode);
    }

    //공지사항 등록 중간처리
    public void insert(Notice notice) {
        adminMapper.insert(notice);
    }

    //공지사항 삭제 중간처리
    public void remove(Long noticeCode) {
        adminMapper.delNotice(noticeCode);
    }

    //공지사항 수정 중간처리
    public boolean update(ModNotice notice) {
        adminMapper.updateNotice(notice);
        log.info(notice);
        return true;
    }

    //관리자 로그인 중간처리
    public LoginFlag login(String adminId, String adminPw) {
        Admin admin = adminMapper.getAdmin(adminId);
        if (admin != null) {
            String dbPw = admin.getAdminPw();
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            return encoder.matches(adminPw, dbPw) ? LoginFlag.SUCCESS: LoginFlag.NO_PW;
        } else {
            return LoginFlag.NO_ID;
        }
    }

}//

