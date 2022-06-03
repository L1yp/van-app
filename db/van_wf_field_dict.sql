create table wf_field_dict
(
    id                  bigint auto_increment
        primary key,
    process_key         varchar(64)                        not null comment '流程标识',
    wf_id               bigint                             null comment '流程ID',
    process_instance_id varchar(64)                        null,
    field_id            bigint                             not null comment '字段ID(可更名不受影响)',
    dict_id             bigint                             not null comment '字典ID',
    update_by           varchar(64)                        not null,
    update_time         datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time         datetime default CURRENT_TIMESTAMP not null,
    constraint flowable_field_uindex
        unique (process_key, process_instance_id, field_id, dict_id),
    constraint process_model_field_uindex
        unique (process_key, wf_id, field_id, dict_id)
)
    comment '字典字段关联表';

INSERT INTO van.wf_field_dict (id, process_key, wf_id, process_instance_id, field_id, dict_id, update_by, update_time, create_time) VALUES (1, 'zhicheng', 1, '027a51b4-e2ed-11ec-a472-00e0705f49db', 34, 43, 'A52738', '2022-06-03 11:31:10', '2022-06-03 11:31:10');
INSERT INTO van.wf_field_dict (id, process_key, wf_id, process_instance_id, field_id, dict_id, update_by, update_time, create_time) VALUES (2, 'zhicheng', 2, '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 34, 43, 'admin', '2022-06-03 11:37:48', '2022-06-03 11:37:48');
INSERT INTO van.wf_field_dict (id, process_key, wf_id, process_instance_id, field_id, dict_id, update_by, update_time, create_time) VALUES (3, 'zhicheng', 3, '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 34, 43, 'admin', '2022-06-03 11:41:58', '2022-06-03 11:41:58');
