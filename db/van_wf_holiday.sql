create table wf_holiday
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null comment '流程版本ID',
    process_definition_id varchar(128) default ''                not null comment '流程定义ID',
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    code                  varchar(64)                            not null,
    name                  varchar(64)                            null,
    creator               bigint                                 not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    dept_leader           bigint       default 0                 not null comment '直属上级',
    hq_leaders            varchar(128)                           null comment '总部领导列表',
    supervisor            bigint                                 null comment '主管',
    days                  int          default 0                 not null comment '请假天数',
    constraint wf_holiday_code_uindex
        unique (code),
    constraint wf_holiday_process_instance_id_uindex
        unique (process_instance_id)
)
    comment '请假流程';

create index wf_holiday_process_bpmn_id_index
    on wf_holiday (process_bpmn_id);

create index wf_holiday_process_definition_id_index
    on wf_holiday (process_definition_id);

