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
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (5, 'change_budget', '填写调整信息 - 提交', '填写调整信息 - 页面', 'admin', '2022-05-24 20:57:03', '2022-05-24 20:57:03');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (6, 'change_budget', 'START', '启动界面', 'admin', '2022-05-25 20:42:51', '2022-05-25 20:42:51');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (7, 'holiday', 'START', '启动', 'admin', '2022-05-31 09:45:06', '2022-05-31 09:45:06');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (8, 'holiday', '基本信息', '基本信息', 'admin', '2022-05-31 11:23:55', '2022-05-31 11:23:55');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (9, 'holiday', '请假明细提交', '请假明细提交', 'admin', '2022-05-31 11:27:17', '2022-05-31 11:27:17');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (10, 'zhicheng', '启动表单', null, 'admin', '2022-06-03 10:44:24', '2022-06-03 10:44:24');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (11, 'zhicheng', '基本信息', null, 'admin', '2022-06-03 10:45:20', '2022-06-03 10:45:20');
INSERT INTO van.process_model_page (id, process_key, name, remark, update_by, update_time, create_time) VALUES (12, 'zhicheng', '专家审核界面', null, 'admin', '2022-06-03 10:46:42', '2022-06-03 10:46:42');
