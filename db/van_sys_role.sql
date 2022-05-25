create table sys_role
(
    id          bigint auto_increment
        primary key,
    name        varchar(32)                        null,
    order_no    int                                null,
    status      tinyint  default 0                 null,
    update_by   varchar(32)                        not null,
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    create_time datetime default CURRENT_TIMESTAMP null
)
    comment '角色';

INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (1, '系统管理员', 1, 0, 'admin', '2022-02-18 17:54:42', '2022-02-18 17:54:42');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (2, '董事长', 2, 0, 'admin', '2022-02-18 17:54:58', '2022-02-18 17:54:58');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (3, '总经理', 3, 0, 'admin', '2022-02-18 17:55:04', '2022-02-18 17:55:04');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (4, '总监', 4, 0, 'admin', '2022-02-18 17:55:11', '2022-02-18 17:55:11');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (5, '主管', 5, 0, 'admin', '2022-02-18 17:55:18', '2022-02-18 17:55:18');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (6, '组长', 6, 0, 'admin', '2022-02-18 17:55:23', '2022-02-18 17:55:23');
INSERT INTO van.sys_role (id, name, order_no, status, update_by, update_time, create_time) VALUES (7, '成员', 7, 0, 'admin', '2022-02-18 17:55:28', '2022-02-18 17:55:28');
