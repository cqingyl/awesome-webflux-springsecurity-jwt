package com.dawn.awesomewebfluxspringsecurityjwt.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * Author: Administrator
 * DATE: 2019/3/8
 * DESC:
 **/
@Data
@NoArgsConstructor
public class PageInfo<T> implements Serializable {
    private int pageNum;
    private int pageSize;
    private List<T> list;
    private int total;


    public PageInfo(List<T> list) {
        this.list = list;
    }

    public static <T> PageInfo<T> of(List<T> list) {
        return new PageInfo<T>(list);
    }

    public void initList(List<T> list) {
        this.list = list;
        this.pageNum = 1;
        this.pageSize = list.size();
    }
}
