create table wf_holiday
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null comment '流程版本ID',
    process_definition_id varchar(128) default ''                not null comment '流程定义ID',
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    name                  varchar(64)                            null,
    creator               varchar(64)                            not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    dept_leader           bigint       default 0                 not null comment '直属上级'
)
    comment '请假流程';

