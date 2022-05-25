create table sys_user_dept
(
    id          bigint auto_increment
        primary key,
    uid         bigint                                not null,
    dept_id     bigint                                null,
    master      tinyint                               null comment '0=兼职部门，1=主部门',
    update_by   varchar(32) default 'admin'           not null,
    update_time datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time datetime    default CURRENT_TIMESTAMP not null,
    constraint sys_user_dept_uid_dept_id_uindex
        unique (uid, dept_id)
)
    comment '用户部门表';

INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (19, 1, 7, 1, 'admin', '2022-02-24 15:38:51', '2022-02-24 15:38:51');
INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (25, 1, 2, 0, 'admin', '2022-02-24 15:49:26', '2022-02-24 15:49:26');
INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (26, 1, 1, 0, 'admin', '2022-02-24 15:49:26', '2022-02-24 15:49:26');
INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (27, 1, 8, 0, 'admin', '2022-02-24 15:49:26', '2022-02-24 15:49:26');
INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (28, 1, 9, 0, 'admin', '2022-02-24 15:49:26', '2022-02-24 15:49:26');
INSERT INTO van.sys_user_dept (id, uid, dept_id, master, update_by, update_time, create_time) VALUES (29, 1, 10, 0, 'admin', '2022-02-24 15:49:26', '2022-02-24 15:49:26');
