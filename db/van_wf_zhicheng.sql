create table wf_zhicheng
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null comment '流程版本ID',
    process_definition_id varchar(128) default ''                not null comment '流程定义ID',
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    code                  varchar(64)                            not null,
    name                  varchar(64)                            not null,
    creator               bigint                                 not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    judges                varchar(128)                           null comment '评委用户列表',
    expert_status         bigint                                 null comment '专家审核',
    expert_reject_count   int          default 0                 not null comment '专家退回次数',
    form_reject_count     int          default 0                 not null comment '形式审查退回次数',
    constraint code_uindex
        unique (code),
    constraint process_instance_id_uindex
        unique (process_instance_id)
)
    comment '职称申请流程';

create index process_bpmn_id_index
    on wf_zhicheng (process_bpmn_id);

create index process_definition_id_index
    on wf_zhicheng (process_definition_id);

