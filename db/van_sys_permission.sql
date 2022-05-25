create table sys_permission
(
    id            bigint auto_increment
        primary key,
    ident         varchar(64)                           not null,
    owner_menu_id bigint      default 0                 null comment '所属菜单页面ID',
    update_by     varchar(64) default 'admin'           null,
    update_time   datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    constraint sys_permission_ident_uindex
        unique (ident)
)
    comment '权限表';

INSERT INTO van.sys_permission (id, ident, owner_menu_id, update_by, update_time) VALUES (1, 'system:user:query', 3, 'admin', '2022-04-05 16:38:36');
INSERT INTO van.sys_permission (id, ident, owner_menu_id, update_by, update_time) VALUES (2, 'system:user:update', 3, 'admin', '2022-04-06 08:15:07');
INSERT INTO van.sys_permission (id, ident, owner_menu_id, update_by, update_time) VALUES (3, 'system:user:delete', 3, 'admin', '2022-04-06 08:15:14');
INSERT INTO van.sys_permission (id, ident, owner_menu_id, update_by, update_time) VALUES (4, 'system:user:create', 3, 'admin', '2022-04-06 08:15:18');
INSERT INTO van.sys_permission (id, ident, owner_menu_id, update_by, update_time) VALUES (5, 'system:user:export', 3, 'admin', '2022-04-05 16:31:31');
