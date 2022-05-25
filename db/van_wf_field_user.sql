create table wf_field_user
(
    id          bigint auto_increment
        primary key,
    process_key varchar(64)                        not null comment '流程标识',
    wf_id       bigint                             null comment '流程ID',
    field_id    bigint                             not null comment '字段ID(可更名不受影响)',
    user_id     bigint                             not null comment '用户ID',
    update_by   varchar(64)                        not null,
    update_time datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time datetime default CURRENT_TIMESTAMP not null,
    constraint wf_field_user_process_key_wf_id_field_id_user_id_uindex
        unique (process_key, wf_id, field_id, user_id)
)
    comment '用户关联表';

INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (1, 'change_budget', 1, 1, 2, 'A52738', '2022-05-20 23:57:07', '2022-05-20 23:57:07');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (2, 'change_budget', 1, 2, 3, 'A52738', '2022-05-20 23:57:07', '2022-05-20 23:57:07');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (3, 'change_budget', 1, 3, 4, 'A52738', '2022-05-20 23:57:07', '2022-05-20 23:57:07');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (4, 'change_budget', 1, 4, 5, 'A52738', '2022-05-20 23:57:07', '2022-05-20 23:57:07');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (5, 'change_budget', 2, 1, 2, 'admin', '2022-05-22 22:45:50', '2022-05-22 22:45:50');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (6, 'change_budget', 2, 2, 3, 'admin', '2022-05-22 22:45:50', '2022-05-22 22:45:50');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (7, 'change_budget', 2, 3, 4, 'admin', '2022-05-22 22:45:50', '2022-05-22 22:45:50');
INSERT INTO van.wf_field_user (id, process_key, wf_id, field_id, user_id, update_by, update_time, create_time) VALUES (8, 'change_budget', 2, 4, 5, 'admin', '2022-05-22 22:45:50', '2022-05-22 22:45:50');
