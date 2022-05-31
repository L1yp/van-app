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

INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (1, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 18, 1, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (2, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 2, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (3, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 3, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (4, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 4, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (5, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 5, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (6, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 6, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (7, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 7, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (8, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 8, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (9, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 9, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (10, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 10, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (11, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 12, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (12, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 13, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (13, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 19, 14, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (14, 'holiday', 1, '106035b9-e0ac-11ec-9764-d8bbc132d9b2', 20, 1, 'admin', '2022-05-31 14:36:55', '2022-05-31 14:36:55');
