package com.dawn.awesomewebfluxspringsecurityjwt.entity.document;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.springframework.data.mongodb.core.index.CompoundIndex;
import org.springframework.data.mongodb.core.index.CompoundIndexes;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Author: Administrator
 * DATE: 2019/3/12
 * DESC:
 **/
@Data
@EqualsAndHashCode
@ToString
@Document(collection = "sys_role_permission")
@CompoundIndexes({
        // 唯一复合索引
        @CompoundIndex(name = "role_permission", def = "{'roleId' : 1, 'permissionId': 1}", unique = true)
})
public class SysRolePermission {
    String roleId;
    String permissionId;
}
