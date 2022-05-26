create table wf_field_dept
(
    id                  bigint auto_increment
        primary key,
    process_key         varchar(64)                        not null comment '流程标识',
    wf_id               bigint                             null comment '流程ID',
    process_instance_id varchar(64)                        null comment 'flowable流程实例ID',
    field_id            bigint                             not null comment '字段ID(可更名不受影响)',
    dept_id             bigint                             not null comment '部门ID',
    update_by           varchar(64)                        not null,
    update_time         datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time         datetime default CURRENT_TIMESTAMP not null,
    constraint flowable_field_uindex
        unique (process_key, process_instance_id, field_id, dept_id),
    constraint process_model_field_uindex
        unique (process_key, wf_id, field_id, dept_id)
)
    comment '部门字段关联表';

