create table wf_field_user
(
    id                  bigint auto_increment
        primary key,
    process_key         varchar(64)                        not null comment '流程标识',
    wf_id               bigint                             null comment '流程ID',
    process_instance_id varchar(64)                        null,
    field_id            bigint                             not null comment '字段ID(可更名不受影响)',
    user_id             bigint                             not null comment '用户ID',
    update_by           varchar(64)                        not null,
    update_time         datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time         datetime default CURRENT_TIMESTAMP not null,
    constraint flowable_field_uindex
        unique (process_key, process_instance_id, field_id, user_id),
    constraint process_model_field_uindex
        unique (process_key, wf_id, field_id, user_id)
)
    comment '用户关联表';

INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (1, 'change_budget', 1, 'de7bf7b4-e07e-11ec-9871-d8bbc132d9b2', 1, 2, 'admin', '2022-05-31 09:13:24', '2022-05-31 09:13:24');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (2, 'change_budget', 1, 'de7bf7b4-e07e-11ec-9871-d8bbc132d9b2', 2, 3, 'admin', '2022-05-31 09:13:24', '2022-05-31 09:13:24');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (3, 'change_budget', 1, 'de7bf7b4-e07e-11ec-9871-d8bbc132d9b2', 3, 4, 'admin', '2022-05-31 09:13:24', '2022-05-31 09:13:24');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (4, 'change_budget', 1, 'de7bf7b4-e07e-11ec-9871-d8bbc132d9b2', 4, 5, 'admin', '2022-05-31 09:13:24', '2022-05-31 09:13:24');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (5, 'change_budget', 2, 'ecfff0cf-e07e-11ec-9871-d8bbc132d9b2', 1, 2, 'admin', '2022-05-31 09:13:48', '2022-05-31 09:13:48');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (6, 'change_budget', 2, 'ecfff0cf-e07e-11ec-9871-d8bbc132d9b2', 2, 3, 'admin', '2022-05-31 09:13:48', '2022-05-31 09:13:48');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (7, 'change_budget', 2, 'ecfff0cf-e07e-11ec-9871-d8bbc132d9b2', 3, 4, 'admin', '2022-05-31 09:13:48', '2022-05-31 09:13:48');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (8, 'change_budget', 2, 'ecfff0cf-e07e-11ec-9871-d8bbc132d9b2', 4, 5, 'admin', '2022-05-31 09:13:48', '2022-05-31 09:13:48');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (9, 'change_budget', 3, '74ef70c7-e07f-11ec-88d2-d8bbc132d9b2', 1, 2, 'admin', '2022-05-31 09:17:36', '2022-05-31 09:17:36');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (10, 'change_budget', 3, '74ef70c7-e07f-11ec-88d2-d8bbc132d9b2', 2, 3, 'admin', '2022-05-31 09:17:36', '2022-05-31 09:17:36');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (11, 'change_budget', 3, '74ef70c7-e07f-11ec-88d2-d8bbc132d9b2', 3, 4, 'admin', '2022-05-31 09:17:36', '2022-05-31 09:17:36');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (12, 'change_budget', 3, '74ef70c7-e07f-11ec-88d2-d8bbc132d9b2', 4, 5, 'admin', '2022-05-31 09:17:36', '2022-05-31 09:17:36');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (13, 'change_budget', 5, 'a19be6e6-e07f-11ec-ba6a-d8bbc132d9b2', 1, 2, 'admin', '2022-05-31 09:18:51', '2022-05-31 09:18:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (14, 'change_budget', 5, 'a19be6e6-e07f-11ec-ba6a-d8bbc132d9b2', 2, 3, 'admin', '2022-05-31 09:18:51', '2022-05-31 09:18:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (15, 'change_budget', 5, 'a19be6e6-e07f-11ec-ba6a-d8bbc132d9b2', 3, 4, 'admin', '2022-05-31 09:18:51', '2022-05-31 09:18:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (16, 'change_budget', 5, 'a19be6e6-e07f-11ec-ba6a-d8bbc132d9b2', 4, 5, 'admin', '2022-05-31 09:18:51', '2022-05-31 09:18:51');
