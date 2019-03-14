package com.dawn.awesomewebfluxspringsecurityjwt.entity.document;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Data
@EqualsAndHashCode
@ToString
@Document(collection = "sys_role")
public class SysRole {

    @Id
    private String id;

    private String name;

    private String description;
}