create table sys_user_role
(
    id          bigint auto_increment
        primary key,
    uid         bigint                                not null,
    role_id     bigint                                not null,
    update_by   varchar(32) default 'admin'           not null,
    update_time datetime    default CURRENT_TIMESTAMP null,
    create_time datetime    default CURRENT_TIMESTAMP null
)
    comment '用户角色表';

INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (19, 1, 1, 'admin', '2022-02-25 16:34:39', '2022-02-25 16:34:39');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (20, 4, 1, 'admin', '2022-04-08 00:17:27', '2022-04-08 00:17:27');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (21, 5, 1, 'admin', '2022-04-08 00:17:31', '2022-04-08 00:17:31');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (22, 6, 1, 'admin', '2022-04-08 00:17:39', '2022-04-08 00:17:39');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (23, 2, 1, 'admin', '2022-05-19 08:38:59', '2022-05-19 08:38:59');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (24, 3, 1, 'admin', '2022-05-19 08:40:12', '2022-05-19 08:40:12');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (25, 7, 1, 'admin', '2022-05-19 08:40:22', '2022-05-19 08:40:22');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (26, 8, 1, 'admin', '2022-05-19 08:40:28', '2022-05-19 08:40:28');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (27, 9, 1, 'admin', '2022-05-19 08:40:31', '2022-05-19 08:40:31');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (28, 10, 1, 'admin', '2022-05-19 08:40:33', '2022-05-19 08:40:33');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (29, 12, 1, 'admin', '2022-05-19 08:40:36', '2022-05-19 08:40:36');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (30, 13, 1, 'admin', '2022-05-19 08:40:39', '2022-05-19 08:40:39');
INSERT INTO van.sys_user_role (id, uid, role_id, update_by, update_time, create_time) VALUES (31, 14, 1, 'admin', '2022-05-19 08:40:45', '2022-05-19 08:40:45');
