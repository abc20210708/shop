package com.example.shop.customer.repository;

import com.example.shop.customer.domain.Customer;
import com.example.shop.customer.dto.ModCustomer;
import com.example.shop.notice.domain.Notice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CustomerMapper {

    //회원가입
    boolean createCustomer(Customer customer);

    //회원탈퇴
    boolean delCustomer(String csId, String csPw);

    //회원수정
    void updateCustomer(ModCustomer customer);

    //회원 정보 받기
    Customer getCustomer(String csId);

    //회원 공지사항 목록 조회
    List<Notice> getNotice();

    //회원 아이디 중복 체크
    int isDuplicate(String target);



}//
