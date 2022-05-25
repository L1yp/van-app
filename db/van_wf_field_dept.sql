create table wf_field_dept
(
    id          bigint auto_increment
        primary key,
    process_key varchar(64)                        not null comment '流程标识',
    wf_id       bigint                             null comment '流程ID',
    field_id    bigint                             not null comment '字段ID(可更名不受影响)',
    dept_id     bigint                             not null comment '部门ID',
    update_by   varchar(64)                        not null,
    update_time datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time datetime default CURRENT_TIMESTAMP not null,
    constraint wf_field_user_process_key_wf_id_field_id_user_id_uindex
        unique (process_key, wf_id, field_id, dept_id)
)
    comment '部门字段关联表';

