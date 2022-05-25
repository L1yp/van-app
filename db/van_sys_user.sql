create table sys_user
(
    id          bigint auto_increment
        primary key,
    username    varchar(32)                        not null,
    nickname    varchar(32)                        null,
    password    varchar(32)                        not null,
    phone       varchar(16)                        null,
    avatar      varchar(1024)                      null,
    register_ip varchar(16)                        null,
    status      tinyint  default 0                 not null,
    update_by   varchar(32)                        null comment 'username',
    email       varchar(128)                       null,
    update_time datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    create_time datetime default CURRENT_TIMESTAMP null,
    constraint sys_user_email_uindex
        unique (email),
    constraint sys_user_phone_uindex
        unique (phone),
    constraint sys_user_username_uindex
        unique (username)
)
    comment '用户表';

INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (1, 'admin', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', '18877811997', 'https://q4.qlogo.cn/g?b=qq&nk=942664114&s=0', null, 0, 'admin', 'l1yp@qq.com', '2022-05-20 13:42:06', '2022-02-16 15:32:27');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (2, 'A52747', '澜', 'e10adc3949ba59abbe56e057f20f883e', '18077855148', '/head/lan.jpg', null, 0, 'admin', '12353@qq.com', '2022-05-20 14:38:06', '2022-02-22 21:30:42');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (3, 'A52736', '韩信', 'e10adc3949ba59abbe56e057f20f883e', '18077855137', '/head/hanxin.png', null, 0, 'admin', '18877185@qq.com', '2022-05-20 14:39:22', '2022-02-22 20:11:26');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (4, 'A52737', '李白', 'e10adc3949ba59abbe56e057f20f883e', '18077855138', '/head/libai.png', null, 0, 'admin', '18877195@qq.com', '2022-05-20 14:40:42', '2022-02-22 20:16:56');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (5, 'A52738', '不知婉儿', 'e10adc3949ba59abbe56e057f20f883e', '18077855139', '/head/waner.png', null, 0, 'admin', '35295921@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:05');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (6, 'A52739', '马可波罗', 'e10adc3949ba59abbe56e057f20f883e', '18077855140', '/head/make.png', null, 0, 'admin', '12345@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:05');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (7, 'A52740', '上官火舞', 'e10adc3949ba59abbe56e057f20f883e', '18077855141', '/head/huowu.png', null, 0, 'admin', '12346@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:05');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (8, 'A52741', '露娜', 'e10adc3949ba59abbe56e057f20f883e', '18077855142', '/head/luna.png', null, 0, 'admin', '12347@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:05');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (9, 'A52742', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '18077855143', '/head/xiaoqiao.png', null, 0, 'admin', '12348@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:06');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (10, 'A52743', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '18077855144', '/head/daqiao.png', null, 0, 'admin', '12349@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:12:06');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (12, 'A52744', '孙策', 'e10adc3949ba59abbe56e057f20f883e', '18077855145', '/head/sunce.png', null, 0, 'admin', '12350@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:30:41');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (13, 'A52745', '妲己', 'e10adc3949ba59abbe56e057f20f883e', '18077855146', '/head/daji.png', null, 0, 'admin', '12351@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:30:41');
INSERT INTO van.sys_user (id, username, nickname, password, phone, avatar, register_ip, status, update_by, email, update_time, create_time) VALUES (14, 'A52746', '马超', 'e10adc3949ba59abbe56e057f20f883e', '18077855147', '/head/machao.png', null, 0, 'admin', '12352@qq.com', '2022-05-20 14:41:21', '2022-02-22 21:30:41');
