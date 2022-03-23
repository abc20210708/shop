package com.example.shop.admin.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString
@NoArgsConstructor
public class Admin {

    private String adminId;
    private String adminPw;
    private String adminName;

    public Admin(String adminId, String adminPw, String adminName) {
        this.adminId = adminId;
        this.adminPw = adminPw;
        this.adminName = adminName;
    }

    public Admin(ResultSet rs) throws SQLException {
        this.adminId = rs.getString("admin_id");
        this.adminPw = rs.getString("admin_pw");
        this.adminName = rs.getString("admin_name");
    }

}//
