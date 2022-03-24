package com.example.shop.notice.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ModNotice {

    private Long noticeCode;
    private String noticeTitle;
    private String noticeContent;
    private String noticeDate;

}
