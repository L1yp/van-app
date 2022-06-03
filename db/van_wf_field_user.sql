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

INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (1, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 1, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (2, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 2, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (3, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 3, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (4, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 4, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (5, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 5, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (6, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 33, 6, 'A52738', '2022-06-03 11:26:51', '2022-06-03 11:26:51');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (7, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 2, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (8, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 3, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (9, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 4, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (10, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 5, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (11, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 6, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (12, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 33, 7, 'admin', '2022-06-03 11:37:27', '2022-06-03 11:37:27');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (13, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 2, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (14, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 3, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (15, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 4, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (16, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 5, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (17, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 6, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (18, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 33, 7, 'admin', '2022-06-03 11:41:09', '2022-06-03 11:41:09');
