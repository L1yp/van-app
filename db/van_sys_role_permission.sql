create table sys_role_permission
(
    id            bigint auto_increment
        primary key,
    role_id       bigint                                null,
    permission_id bigint                                null,
    update_by     varchar(64) default 'admin'           null,
    update_time   datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    constraint sys_role_permission_role_id_permission_id_uindex
        unique (role_id, permission_id)
)
    comment '角色权限表格';

INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (17, 1, 1, 'admin', '2022-04-15 18:37:07');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (18, 1, 2, 'admin', '2022-04-15 18:37:07');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (19, 1, 3, 'admin', '2022-04-15 18:37:07');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (20, 1, 4, 'admin', '2022-04-15 18:37:07');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (21, 1, 5, 'admin', '2022-04-15 18:37:07');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (22, 2, 1, 'admin', '2022-04-15 18:37:40');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (23, 2, 2, 'admin', '2022-04-15 18:37:40');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (24, 2, 3, 'admin', '2022-04-15 18:37:40');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (25, 2, 4, 'admin', '2022-04-15 18:37:40');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (26, 2, 5, 'admin', '2022-04-15 18:37:40');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (27, 3, 1, 'admin', '2022-04-15 18:37:45');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (28, 3, 2, 'admin', '2022-04-15 18:37:45');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (29, 3, 3, 'admin', '2022-04-15 18:37:45');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (30, 3, 4, 'admin', '2022-04-15 18:37:45');
INSERT INTO van.sys_role_permission (id, role_id, permission_id, update_by, update_time) VALUES (31, 3, 5, 'admin', '2022-04-15 18:37:45');
