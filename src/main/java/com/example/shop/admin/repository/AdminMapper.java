package com.example.shop.admin.repository;

import com.example.shop.admin.domain.Admin;
import com.example.shop.customer.domain.Customer;
import com.example.shop.notice.domain.Notice;
import com.example.shop.notice.dto.ModNotice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    //관리자 등록
    boolean createAdmin(Admin admin);

    //관리자 삭제
    boolean delAdmin(String adminId, String adminPw);

    //관리자 목록 전체 조회
    List<Admin> getAdminList();

    //단일 관리자 정보 받기
    Admin getAdmin(String adminId);

    //회원 목록 조회하기
    List<Customer> getCustomerList();

    //회원 목록 상세조회
    Customer getCustomerContent(String csId);

    //공지사항 목록 조회
    List<Notice> getNoticeList();

    //공지사항 목록 상세조회
    Notice getNoticeContent(Long noticeCode);

    //공지사항 삭제
    boolean delNotice(Long noticeCode);

    //공지사항 수정
    boolean updateNotice(ModNotice notice);

    //공지사항 등록
    boolean insert(Notice notice);
}
