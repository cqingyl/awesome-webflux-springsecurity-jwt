package com.dawn.awesomewebfluxspringsecurityjwt.entity.document;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@EqualsAndHashCode
@ToString
@Document(collection = "sys_user")
public class SysUser {

    @Id
    private String id;

    private String username;

    private String name;

    private String password;

    private String phone;

    private String email;
}