create table sys_dept
(
    id              bigint auto_increment
        primary key,
    title           varchar(64)                           not null comment '部门名称',
    simple_name     varchar(64)                           null comment '部门简称',
    description     varchar(512)                          null comment '部门描述',
    ident           varchar(64)                           not null comment '部门编号',
    order_no        int         default 0                 null,
    pid             bigint      default 0                 null comment '行政上级',
    biz_pid         bigint      default 0                 null comment '业务上级',
    owner           bigint      default 0                 not null comment '部门经理',
    assistant       bigint      default 0                 not null comment '部门助理',
    phone           varchar(32)                           null comment '部门电话',
    office_location varchar(128)                          null comment '办公地点',
    address         varchar(128)                          null comment '详细地址',
    status          tinyint     default 0                 not null,
    update_by       varchar(32) default 'admin'           not null,
    update_time     datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time     datetime    default CURRENT_TIMESTAMP not null,
    constraint sys_dept_ident_uindex
        unique (ident)
)
    comment '部门表';

create index sys_dept_pid_order_no_index
    on sys_dept (pid, order_no);

INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (1, 'Admin', 'Admin', '', 'admin', 1, 0, 0, 0, 0, null, null, null, 0, 'admin', '2022-05-17 19:58:51', '2022-02-20 00:33:19');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (2, '全球研发中心-Central Engineering', '全球研发中心', '', 'CE', 1, 1, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 08:42:43', '2022-02-20 00:56:30');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (3, '总部-HQ', '总部', '', 'HQ', 2, 1, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 08:42:43', '2022-02-20 00:59:41');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (4, '长沙分公司', '长沙', '', 'WL', 3, 1, 0, 0, 0, null, null, null, 0, 'admin', '2022-05-17 19:58:45', '2022-02-20 01:00:14');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (5, '常州分公司', '常州', '', 'EX', 4, 1, 0, 0, 0, null, null, null, 0, 'admin', '2022-05-17 19:58:45', '2022-02-20 01:14:19');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (6, '杭州分公司', '杭州', '', 'DL', 5, 1, 0, 0, 0, null, null, null, 0, 'admin', '2022-05-17 19:58:45', '2022-02-20 01:14:48');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (7, 'CE IT', '数字信息', '', 'CE001', 1, 2, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 08:42:43', '2022-02-20 01:17:21');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (8, 'CE ID', '工业设计', '', 'CE013', 2, 2, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 08:42:43', '2022-02-20 01:17:38');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (9, 'CE Intelligent S&T', '智能设计院', '', 'CE006', 4, 2, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 08:42:43', '2022-02-20 01:18:31');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (10, 'CE Big Data & AI R&D', '大数据', '', 'CE014', 1, 9, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 09:46:59', '2022-02-20 01:18:48');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (11, 'CE Smart Jobsite R&D', '智能施工', '', 'CE016', 3, 9, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 09:46:59', '2022-02-20 01:24:25');
INSERT INTO van.sys_dept (id, title, simple_name, description, ident, order_no, pid, biz_pid, owner, assistant, phone, office_location, address, status, update_by, update_time, create_time) VALUES (12, 'CE Smart Machine R&D', '智能产品', '', 'CE015', 4, 9, 0, 0, 0, null, null, null, 0, 'admin', '2022-02-22 09:46:59', '2022-02-20 01:26:03');
