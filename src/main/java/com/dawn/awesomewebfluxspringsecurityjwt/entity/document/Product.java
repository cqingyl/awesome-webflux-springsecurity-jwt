package com.dawn.awesomewebfluxspringsecurityjwt.entity.document;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
@Data
@EqualsAndHashCode
@ToString
@Document(collection = "product")
public class Product {
    @Id
    String id;
    String name;
}
