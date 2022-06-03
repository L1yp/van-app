create table sys_dict_info
(
    id          bigint auto_increment
        primary key,
    name        varchar(64)                           null,
    scope       varchar(16) default 'global'          null,
    ident       varchar(32)                           null,
    status      tinyint                               null comment '0=normal,1=ban',
    type        tinyint     default 1                 null comment '1=list;2=tree',
    remark      varchar(128)                          null,
    create_time datetime    default CURRENT_TIMESTAMP null,
    constraint sys_dict_info_scope_ident_uindex
        unique (scope, ident)
);

INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (1, '通用状态', 'global', 'common_status', 0, 1, '通用状态', '2022-04-03 00:50:54');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (2, '性别', 'global', 'sex', 0, 1, '性别', '2022-04-03 01:11:29');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (3, '字典类型', 'global', 'dict_type', 0, 1, '字典类型', '2022-04-03 15:14:24');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (4, '成本中心', 'global', 'cost_center', 0, 2, '成本中心', '2022-04-03 23:27:24');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (5, '测测', 'global', 'test', 0, 1, 'aaa', '2022-04-04 11:00:27');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (6, '控件类型', 'global', 'component_type', 0, 1, '控件类型', '2022-04-15 14:15:18');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (8, '是否', 'global', 'yesno', 0, 1, '', '2022-04-24 22:01:54');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (9, '发布状态', 'global', 'publish', 0, 1, '', '2022-04-27 13:36:18');
INSERT INTO van.sys_dict_info (id, name, scope, ident, status, type, remark, create_time) VALUES (10, '通过状态', 'global', 'pass_status', 0, 1, '通过/首次不通过/多次不通过', '2022-06-03 10:41:50');
