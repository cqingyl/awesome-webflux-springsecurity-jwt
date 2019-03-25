/*
 Navicat Premium Data Transfer

 Source Server         : mongo-local
 Source Server Type    : MongoDB
 Source Server Version : 40003
 Source Host           : localhost:27017
 Source Schema         : demo

 Target Server Type    : MongoDB
 Target Server Version : 40003
 File Encoding         : 65001

 Date: 26/03/2019 16:09:40
*/


// ----------------------------
// Collection structure for product
// ----------------------------
db.getCollection("product").drop();
db.createCollection("product");

// ----------------------------
// Documents of product
// ----------------------------
db.getCollection("product").insert([ {
    _id: ObjectId("5c99c5de4db96b1d3c5bcd28"),
    name: "pro1",
    startDate: ISODate("2019-03-26T06:25:34.501Z"),
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.Product"
} ]);

// ----------------------------
// Collection structure for sys_permission
// ----------------------------
db.getCollection("sys_permission").drop();
db.createCollection("sys_permission");

// ----------------------------
// Documents of sys_permission
// ----------------------------
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87707b28a07d25f4812db5"),
    name: "create user",
    description: "ROLE_CREATE_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877cd528a07d2070bb95d1"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87709228a07d207cb680cf"),
    name: "update user",
    description: "ROLE_UPDATE_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877cd528a07d2070bb95d1"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c8770ac28a07d1b588eb8dd"),
    name: "delete user",
    description: "ROLE_DELETE_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877cd528a07d2070bb95d1"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c8770bf28a07d2628536e13"),
    name: "query user",
    description: "ROLE_QUERY_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877cd528a07d2070bb95d1"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87712828a07d25407a6577"),
    name: "grant user",
    description: "ROLE_GRANT_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877cd528a07d2070bb95d1"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87724728a07d140842987c"),
    name: "grant role",
    description: "ROLE_GRANT_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877d2d28a07d1ac8551a68"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87724728a07d140842987d"),
    name: "create role",
    description: "ROLE_CREATE_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877d2d28a07d1ac8551a68"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87724728a07d140842987e"),
    name: "update role",
    description: "ROLE_UPDATE_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877d2d28a07d1ac8551a68"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87724728a07d140842987f"),
    name: "delete role",
    description: "ROLE_DELETE_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877d2d28a07d1ac8551a68"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87724728a07d1408429880"),
    name: "query role",
    description: "ROLE_QUERY_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877d2d28a07d1ac8551a68"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877c1d28a07d136cb4a3a3"),
    name: "create product",
    description: "ROLE_CREATE_PRODUCT",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877e3a28a07d10c0a4501f"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877c1d28a07d136cb4a3a4"),
    name: "update product",
    description: "ROLE_UPDATE_PRODUCT",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877e3a28a07d10c0a4501f"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877c1d28a07d136cb4a3a5"),
    name: "delete product",
    description: "ROLE_DELETE_PRODUCT",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877e3a28a07d10c0a4501f"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877c1d28a07d136cb4a3a6"),
    name: "query product",
    description: "ROLE_QUERY_PRODUCT",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c877e3a28a07d10c0a4501f"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877cd528a07d2070bb95d1"),
    name: "manager user",
    description: "ROLE_MANAGER_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c87709228a07d207cb680dd"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877d2d28a07d1ac8551a68"),
    name: "manager role",
    description: "ROLE_MANAGER_ROLE",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c87709228a07d207cb680dd"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877e3a28a07d10c0a4501e"),
    name: "manager permission",
    description: "ROLE_MANAGER_PERMISSION",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c87709228a07d207cb680dd"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877e3a28a07d10c0a4501f"),
    name: "manager product",
    description: "ROLE_MANAGER_PRODUCT",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission",
    parentId: "5c87709228a07d207cb680dd"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c877ee728a07d1f7c68a90b"),
    name: "manager role",
    description: "ROLE_MANAGER_ROLE",
    parentId: "5c87709228a07d207cb680dd",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission"
} ]);
db.getCollection("sys_permission").insert([ {
    _id: ObjectId("5c87709228a07d207cb680dd"),
    name: "manager all",
    description: "ROLE_SYSTEM",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysPermission"
} ]);

// ----------------------------
// Collection structure for sys_role
// ----------------------------
db.getCollection("sys_role").drop();
db.createCollection("sys_role");

// ----------------------------
// Documents of sys_role
// ----------------------------
db.getCollection("sys_role").insert([ {
    _id: ObjectId("5c876d3f28a07d1ddcec6629"),
    name: "admin",
    description: "ROLE_ADMIN",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRole"
} ]);
db.getCollection("sys_role").insert([ {
    _id: ObjectId("5c876dec28a07d147092ab89"),
    name: "user",
    description: "ROLE_USER",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRole"
} ]);

// ----------------------------
// Collection structure for sys_role_permission
// ----------------------------
db.getCollection("sys_role_permission").drop();
db.createCollection("sys_role_permission");
db.getCollection("sys_role_permission").createIndex({
    roleId: NumberInt("1"),
    permissionId: NumberInt("1")
}, {
    name: "role_permission",
    unique: true
});

// ----------------------------
// Documents of sys_role_permission
// ----------------------------
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd593"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87707b28a07d25f4812db5",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd594"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87709228a07d207cb680cf",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd595"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c8770ac28a07d1b588eb8dd",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd596"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c8770bf28a07d2628536e13",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd597"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87712828a07d25407a6577",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd598"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87724728a07d140842987c",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd599"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87724728a07d140842987d",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59a"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87724728a07d140842987e",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59b"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87724728a07d140842987f",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59c"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87724728a07d1408429880",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59d"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877c1d28a07d136cb4a3a3",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59e"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877c1d28a07d136cb4a3a4",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd59f"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877c1d28a07d136cb4a3a5",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a0"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877c1d28a07d136cb4a3a6",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a1"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877cd528a07d2070bb95d1",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a2"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877d2d28a07d1ac8551a68",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a3"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877e3a28a07d10c0a4501e",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a4"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877e3a28a07d10c0a4501f",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a5"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c87709228a07d207cb680dd",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);
db.getCollection("sys_role_permission").insert([ {
    _id: ObjectId("5c999d004db96b20f0afd5a6"),
    roleId: "5c876d3f28a07d1ddcec6629",
    permissionId: "5c877ee728a07d1f7c68a90b",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysRolePermission"
} ]);

// ----------------------------
// Collection structure for sys_user
// ----------------------------
db.getCollection("sys_user").drop();
db.createCollection("sys_user");

// ----------------------------
// Documents of sys_user
// ----------------------------
db.getCollection("sys_user").insert([ {
    _id: ObjectId("5c874fe228a07d0838970119"),
    username: "normalUser",
    name: "normalUser",
    password: "fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=",
    phone: "13300000001",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser"
} ]);
db.getCollection("sys_user").insert([ {
    _id: ObjectId("5c874fe228a07d0838970118"),
    username: "admin",
    name: "admin",
    password: "fV8G3g4M7OgyajhE/BcbHL69JAZfDlU5+ihrxO5wBi0=",
    phone: "13300000000",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUser"
} ]);

// ----------------------------
// Collection structure for sys_user_role
// ----------------------------
db.getCollection("sys_user_role").drop();
db.createCollection("sys_user_role");
db.getCollection("sys_user_role").createIndex({
    userId: NumberInt("1"),
    roleId: NumberInt("1")
}, {
    name: "user_role",
    unique: true
});

// ----------------------------
// Documents of sys_user_role
// ----------------------------
db.getCollection("sys_user_role").insert([ {
    _id: ObjectId("5c876e2628a07d1d2c0eafcf"),
    userId: "5c874fe228a07d0838970118",
    roleId: "5c876d3f28a07d1ddcec6629",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUserRole"
} ]);
db.getCollection("sys_user_role").insert([ {
    _id: ObjectId("5c876e4a28a07d1ba009de87"),
    userId: "5c874fe228a07d0838970119",
    roleId: "5c876dec28a07d147092ab89",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUserRole"
} ]);
db.getCollection("sys_user_role").insert([ {
    _id: ObjectId("5c876e4a28a07d1ba009de88"),
    userId: "5c874fe228a07d0838970118",
    roleId: "5c876dec28a07d147092ab80",
    _class: "com.dawn.awesomewebfluxspringsecurityjwt.entity.document.SysUserRole"
} ]);
