package com.dawn.awesomewebfluxspringsecurityjwt.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Author: Administrator
 * DATE: 2019/3/7
 * DESC:
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CusPageRequest {
    String lastId;
    int pageSize;
}
