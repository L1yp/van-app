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

INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (37, 'change_budget', 2, '3a4dc08e-df29-11ec-8327-00e0705f49db', 1, 1, 'admin', '2022-05-29 16:36:12', '2022-05-29 16:36:12');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (38, 'change_budget', 2, '3a4dc08e-df29-11ec-8327-00e0705f49db', 2, 1, 'admin', '2022-05-29 16:36:12', '2022-05-29 16:36:12');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (39, 'change_budget', 2, '3a4dc08e-df29-11ec-8327-00e0705f49db', 3, 1, 'admin', '2022-05-29 16:36:12', '2022-05-29 16:36:12');
INSERT INTO van.wf_field_user (id, process_key, wf_id, process_instance_id, field_id, user_id, update_by, update_time, create_time) VALUES (40, 'change_budget', 2, '3a4dc08e-df29-11ec-8327-00e0705f49db', 4, 1, 'admin', '2022-05-29 16:36:12', '2022-05-29 16:36:12');
