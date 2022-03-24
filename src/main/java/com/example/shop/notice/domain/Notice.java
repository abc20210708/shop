package com.example.shop.notice.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString
public class Notice {

    private Long noticeCode;
    private String noticeTitle;
    private String noticeContent;
    private String noticeDate;
    private String adminId;

    private static long seq;

    public Notice() {
        this.noticeCode = ++seq;
    }

    public Notice(Long noticeCode, String noticeTitle,
                  String noticeContent, String noticeDate,
                  String adminId) {
        this.noticeCode = noticeCode;
        this.noticeTitle = noticeTitle;
        this.noticeContent = noticeContent;
        this.noticeDate = noticeDate;
        this.adminId = adminId;
    }

    public Notice(ResultSet rs) throws SQLException {
        this.noticeCode = rs.getLong("notice_code");
        this.noticeTitle = rs.getString("notice_title");
        this.noticeContent =rs.getString("notice_content");
        this.noticeDate =rs.getString("notice_date");
        this.adminId =rs.getString("admin_id");
    }
}//
