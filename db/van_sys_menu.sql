create table sys_menu
(
    id          bigint auto_increment
        primary key,
    title       varchar(32)                           null,
    name        varchar(32)                           not null comment 'route name',
    route       varchar(128)                          not null,
    icon        varchar(32)                           null,
    close       tinyint     default 0                 not null comment '是否展示关闭按钮',
    hidden      tinyint     default 0                 not null comment '不在菜单栏显示',
    update_by   varchar(32) default 'admin'           not null,
    create_by   varchar(32) default 'admin'           not null,
    pid         bigint      default 0                 not null,
    update_time datetime    default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    create_time datetime    default CURRENT_TIMESTAMP null,
    constraint sys_menu_name_uindex
        unique (name)
)
    comment '菜单表';

create index sys_menu_pid_index
    on sys_menu (pid);

INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (1, 'Dashboard', 'dashboard', '/home', 'House', 0, 0, 'admin', 'admin', 0, '2022-03-13 20:40:30', '2022-02-18 18:49:02');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (2, '系统管理', 'sysManagement', '/sys', 'Setting', 0, 0, 'admin', 'admin', 0, '2022-02-18 18:49:15', '2022-02-18 18:49:15');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (3, '用户管理', 'userManagement', '/sys/user', 'User', 1, 0, 'admin', 'admin', 2, '2022-02-18 19:05:56', '2022-02-18 18:51:11');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (4, '角色管理', 'roleManagement', '/sys/role', 'UserRole', 1, 0, 'admin', 'admin', 2, '2022-02-18 18:51:20', '2022-02-18 18:51:20');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (5, '菜单管理', 'menuManagement', '/sys/menu', 'Menu', 1, 0, 'admin', 'admin', 2, '2022-02-18 18:53:22', '2022-02-18 18:53:22');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (6, '个人设置', 'userSetting', '/user', 'UserSettings', 0, 0, 'admin', 'admin', 0, '2022-02-18 18:53:31', '2022-02-18 18:53:31');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (7, '个人信息', 'userProfile', '/user/profile', 'UserProfile', 1, 0, 'admin', 'admin', 6, '2022-02-18 21:43:31', '2022-02-18 18:55:18');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (8, '修改密码', 'userPassword', '/user/password', 'Password', 1, 0, 'admin', 'admin', 6, '2022-02-18 21:43:31', '2022-02-18 18:55:21');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (9, '关联角色', 'userRelateRole', '/sys/user/releta/role', 'relation', 1, 1, 'admin', 'admin', 0, '2022-02-20 13:47:23', '2022-02-18 21:53:48');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (11, '关联菜单', 'roleRelateMenu', '/sys/role/releta/menu', 'relation', 1, 1, 'admin', 'admin', 0, '2022-02-20 13:35:28', '2022-02-18 22:36:15');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (12, '部门管理', 'deptManagement', '/sys/dept', 'Department', 1, 0, 'admin', 'admin', 2, '2022-02-19 21:52:48', '2022-02-19 21:52:48');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (13, '关联部门', 'userRelateDept', '/sys/user/releta/dept', 'relation', 1, 1, 'admin', 'admin', 0, '2022-02-20 16:43:35', '2022-02-20 16:43:35');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (14, '字典配置', 'dictConfig', '/sys/config', 'config', 1, 0, 'admin', 'admin', 2, '2022-02-21 20:22:55', '2022-02-21 20:22:55');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (16, 'Shopee订单', 'shopeeOrder', '/shopee', 'Order', 1, 0, 'admin', 'admin', 0, '2022-03-20 08:50:53', '2022-03-20 08:50:53');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (17, '全部', 'shopeeAllOrder', '/shopee/order/all', 'Order', 1, 0, 'admin', 'admin', 16, '2022-03-20 09:11:37', '2022-03-20 09:11:37');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (18, '未完成', 'shopeePendingOrder', '/shopee/order/pending', 'Order', 1, 0, 'admin', 'admin', 16, '2022-03-20 09:12:03', '2022-03-20 09:11:53');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (19, 'Lazada订单', 'lazadaOrder', '/lazada', 'Order', 1, 0, 'admin', 'admin', 0, '2022-03-27 19:27:27', '2022-03-27 19:27:27');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (20, '全部', 'lazadaAllOrder', '/lazada/order/all', 'Order', 1, 0, 'admin', 'admin', 19, '2022-03-27 19:27:54', '2022-03-27 19:27:54');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (21, '未完成', 'lazadaPendingOrder', '/lazada/order/pending', 'Order', 1, 0, 'admin', 'admin', 19, '2022-03-27 19:28:12', '2022-03-27 19:28:12');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (22, '流程设计', 'processDesign', '/process/design', 'Cluster', 1, 0, 'admin', 'admin', 0, '2022-04-07 23:10:19', '2022-04-02 10:08:30');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (23, '权限管理', 'permissionManagement', '/sys/permission', 'UserRole', 1, 0, 'admin', 'admin', 2, '2022-04-04 02:17:18', '2022-04-04 02:17:18');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (24, '流程管理', 'processManagement', '/process/management', 'Cluster', 1, 0, 'admin', 'admin', 0, '2022-04-07 23:10:44', '2022-04-07 23:10:44');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (25, '流程设计', 'processApp', '/process/app', 'Cluster', 1, 0, 'admin', 'admin', 22, '2022-04-07 23:14:31', '2022-04-07 23:11:38');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (28, '待认领流程', 'unclaimTask', '/process/task/unclaim', 'InstanceVirtual', 1, 0, 'admin', 'admin', 24, '2022-05-22 23:36:47', '2022-04-07 23:16:45');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (29, '我的待办', 'todoTask', '/process/task/todo', 'Task', 1, 0, 'admin', 'admin', 24, '2022-05-21 00:51:50', '2022-04-07 23:17:57');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (30, '我经办的流程', 'processHistoryInstance', '/process/history/instance', 'Task', 1, 0, 'admin', 'admin', 24, '2022-05-22 23:37:08', '2022-04-07 23:18:46');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (31, '流程列表', 'processInstanceByKey', '/process/app/instance/:key', 'View', 1, 1, 'admin', 'admin', 22, '2022-04-08 08:30:35', '2022-04-08 08:30:16');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (32, '流程图设计', 'processAppDesign', '/process/app/design/:bpmnId', 'Cluster', 1, 1, 'admin', 'admin', 22, '2022-04-29 17:17:41', '2022-04-12 10:19:44');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (33, '流程字段配置', 'processField', '/process/field/:processKey', 'TextField', 1, 1, 'admin', 'admin', 22, '2022-04-15 08:46:17', '2022-04-15 08:44:58');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (34, '流程模型', 'processModel', '/process/model', 'Cluster', 1, 0, 'admin', 'admin', 22, '2022-04-25 22:53:04', '2022-04-24 22:03:49');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (35, '流程明细', 'processInstanceInfo', '/process/instance', 'InfoFilled', 1, 1, 'admin', 'admin', 22, '2022-05-04 11:26:23', '2022-05-04 11:16:41');
INSERT INTO van.sys_menu (id, title, name, route, icon, close, hidden, update_by, create_by, pid, update_time, create_time) VALUES (36, '流程页面', 'processModelPage', '/process/model/page', 'Page', 1, 1, 'admin', 'admin', 22, '2022-05-16 19:07:40', '2022-05-12 21:21:05');
