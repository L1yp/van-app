create table process_model_page
(
    id          bigint auto_increment
        primary key,
    process_key varchar(64)                           not null,
    name        varchar(32)                           null comment '页面名称',
    remark      varchar(128)                          null comment '页面备注',
    update_by   varchar(64) default 'admin'           not null,
    update_time datetime    default CURRENT_TIMESTAMP not null,
    create_time datetime    default CURRENT_TIMESTAMP not null
)
    comment '流程模型界面';

INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (1, 'change_budget', '填写调整信息', '填写调整信息', 'admin', '2022-05-13 21:24:53', '2022-05-13 21:24:53');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (2, 'change_budget', '完结界面', '完结界面', 'admin', '2022-05-18 20:01:03', '2022-05-18 20:01:03');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (3, 'change_budget', '基础信息页面', '基础信息页面', 'admin', '2022-05-19 08:52:56', '2022-05-19 08:52:56');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (4, 'change_budget', '基础信息', '基础信息', 'admin', '2022-05-19 22:52:12', '2022-05-19 22:52:12');
