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

INSERT INTO van.wf_field_dict (id, process_key, wf_id, process_instance_id, field_id, dict_id, update_by, update_time, create_time) VALUES (1, 'change_budget', 1, '671990a3-df27-11ec-8327-00e0705f49db', 5, 39, 'admin', '2022-05-29 16:14:46', '2022-05-29 16:14:46');
INSERT INTO van.wf_field_dict (id, process_key, wf_id, process_instance_id, field_id, dict_id, update_by, update_time, create_time) VALUES (3, 'change_budget', 2, '3a4dc08e-df29-11ec-8327-00e0705f49db', 5, 40, 'admin', '2022-05-29 16:36:15', '2022-05-29 16:36:15');
